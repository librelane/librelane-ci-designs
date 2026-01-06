/*
	Copyright 2020 Mohamed Shalan (mshalan@aucegypt.edu)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale          1ns/1ps
`default_nettype    none


/*
    for i/o constrained systems, consider using this instead.
    It uses the 03 SPI read comand which takes longer to fetch 
    the line but it releases two pins compared to quad i/o SPI.

    The performance should be comparable to quad i/o SPI reader
    because of the cache which hides the long fetch latency.
*/
module FLASH_READER_SPI (
    input   wire                    clk,
    input   wire                    rst_n,
    input   wire [23:0]             addr,
    input   wire                    rd,
    output  wire                    done,
    output  wire [(LINE_SIZE*8)-1: 0]   line,      

    output  reg                     sck,
    output  reg                     ce_n,
    input   wire                    miso,
    output                          mosi
);

    localparam  LINE_SIZE = 16;
    localparam  LINE_BYTES = LINE_SIZE;
    localparam  LINE_CYCLES = LINE_BYTES * 8;

    parameter   IDLE = 1'b0, 
                READ = 1'b1;

    reg         state, nstate;
    reg [7:0]   counter;
    reg [23:0]  saddr;
    reg [7:0]   data [LINE_BYTES-1 : 0]; 

    reg         first;

    wire[7:0]   CMD     = 8'h03;
    
    // for debugging
    wire [7:0] data_0 = data[0];
    wire [7:0] data_1 = data[1];
    wire [7:0] data_15 = data[15];


    always @*
        case (state)
            IDLE: if(rd) nstate = READ; else nstate = IDLE;
            READ: if(done) nstate = IDLE; else nstate = READ;
        endcase 
/*
    always @ (posedge clk or negedge rst_n)
        if(!rst_n) first = 1'b1;
        else if(first & done) first <= 0;
*/
    
    always @ (posedge clk or negedge rst_n)
        if(!rst_n) 
            state <= IDLE;
        else 
            state <= nstate;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) 
            sck <= 1'b0;
        else if(~ce_n) 
            sck <= ~ sck;
        else if(state == IDLE) 
            sck <= 1'b0;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) ce_n <= 1'b1;
        else if(state == READ) ce_n <= 1'b0;
        else ce_n <= 1'b1;

    always @ (posedge clk or negedge rst_n)
        if(!rst_n) counter <= 8'b0;
        else if(sck & ~done) counter <= counter + 1'b1;
        else if(state == IDLE) 
            counter <= 8'd0;
            //if(first) counter <= 8'b0;
            //else counter <= 8'd8;
            
    always @ (posedge clk or negedge rst_n)
        if(!rst_n) saddr <= 24'b0;
        else if((state == IDLE) && rd) saddr <= addr;

    always @ (posedge clk)
        if(counter >= 32 && counter <= 31+LINE_BYTES*8)
            if(sck) data[counter/8-4] <= {data[counter/8 - 4][6:0], miso}; // Optimize!

    assign mosi     =   (counter < 8)   ? CMD[7 - counter]  :
                        (counter < 32)  ? saddr[31 - counter]   :
                        1'b0;
                        
    assign done     = (counter == (31 + LINE_BYTES * 8));

    generate
        genvar i; 
        for(i=0; i<LINE_BYTES; i=i+1)
            assign line[i*8+7: i*8] = data[i];
    endgenerate

endmodule

/*
    N lines x 16 bytes Direct Mapped Cache
    There is a bug that surfaces when th eline size changes from 16. 
*/
module DMC_Nx16 #(parameter NUM_LINES = 16) (
    input wire          clk,
    input wire          rst_n,
    // 
    input wire  [23:0]  A,
    input wire  [23:0]  A_h,
    output wire [31:0]  Do,
    output wire         hit,
    //
    input wire [(LINE_SIZE*8)-1:0]  line,
    input wire          wr
);
    localparam      LINE_SIZE   = 16 ;
    localparam      LINE_WIDTH  = LINE_SIZE * 8;
    localparam      INDEX_WIDTH = $clog2(NUM_LINES);
    localparam      OFF_WIDTH   = $clog2(LINE_SIZE);
    localparam      TAG_WIDTH   = 24 - INDEX_WIDTH - OFF_WIDTH;
    
    //
    reg [(LINE_WIDTH - 1): 0]   LINES   [(NUM_LINES-1):0];
    reg [(TAG_WIDTH - 1) : 0]   TAGS    [(NUM_LINES-1):0];
    reg                         VALID   [(NUM_LINES-1):0];

    wire [(OFF_WIDTH - 1) : 0]  offset  =   A[(OFF_WIDTH - 1): 0];
    wire [(INDEX_WIDTH -1): 0]  index   =   A[(OFF_WIDTH+INDEX_WIDTH-1): (OFF_WIDTH)];
    wire [(TAG_WIDTH-1)   : 0]  tag     =   A[23:(OFF_WIDTH+INDEX_WIDTH)];

    wire [(INDEX_WIDTH -1): 0]  index_h =   A_h[(OFF_WIDTH+INDEX_WIDTH-1): (OFF_WIDTH)];
    wire [(TAG_WIDTH-1)   : 0]  tag_h   =   A_h[23:(OFF_WIDTH+INDEX_WIDTH)];

    
    assign  hit =   VALID[index_h] & (TAGS[index_h] == tag_h);

    // Change this to support lines other than 16 bytes
    
    assign  Do  =   (offset[3:2] == 2'd0) ?  LINES[index][31:0] :
                    (offset[3:2] == 2'd1) ?  LINES[index][63:32] :
                    (offset[3:2] == 2'd2) ?  LINES[index][95:64] :
                    LINES[index][127:96];
    /*
    assign  Do  =   (offset[4:2] == 2'd0) ?  LINES[index][31:0] :
                    (offset[4:2] == 2'd1) ?  LINES[index][63:32] :
                    (offset[4:2] == 2'd2) ?  LINES[index][95:64] :
                    (offset[4:2] == 2'd3) ?  LINES[index][127:96] :
                    (offset[4:2] == 2'd4) ?  LINES[index][159:128] :
                    (offset[4:2] == 2'd5) ?  LINES[index][191:160] :
                    (offset[4:2] == 2'd6) ?  LINES[index][223:192] :
                    LINES[index][255:224] ;
    */                
    
    // clear the VALID flags
    integer i;
    always @ (posedge clk or negedge rst_n)
        if(!rst_n) 
            for(i=0; i<NUM_LINES; i=i+1)
                VALID[i] <= 1'b0;
        else if(wr)  
            VALID[index]    <= 1'b1;

    always @(posedge clk)
        if(wr) begin
            LINES[index]    <= line;
            TAGS[index]     <= tag;
        end

endmodule
