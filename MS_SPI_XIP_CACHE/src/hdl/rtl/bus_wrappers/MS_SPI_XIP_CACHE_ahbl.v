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
    AHB-Lite SPI flash XiP controller with Nx16 Read-only Direct-mapped Cache.
*/
module MS_SPI_XIP_CACHE_ahbl #(parameter NUM_LINES = 8) (
    // AHB-Lite Slave Interface
    input   wire            HCLK,
    input   wire            HRESETn,
    input   wire            HSEL,
    input   wire [31:0]     HADDR,
    input   wire [1:0]      HTRANS,
    input   wire            HWRITE,
    input   wire            HREADY,
    output  reg             HREADYOUT,
    output  wire [31:0]     HRDATA,

    // External Interface to Quad I/O
    output  wire            sck,
    output  wire            ce_n,
    input   wire            miso,
    output  wire            mosi 
);

    localparam LINE_SIZE = 16;

    // Cache wires/buses
    wire [31:0]                 c_datao;
    wire [(LINE_SIZE*8)-1:0]    c_line;
    wire                        c_hit;
    reg [1:0]                   c_wr;
    wire [23:0]                 c_A;

    // Flash Reader wires
    wire            fr_rd;
    wire            fr_done;

    wire            doe;

    // The State Machine
    localparam [1:0]    IDLE    = 2'b00;
    localparam [1:0]    WAIT    = 2'b01;
    localparam [1:0]    RW      = 2'b10;
    
    reg [1:0]   state, nstate;

    //AHB-Lite Address Phase Regs
    reg             last_HSEL;
    reg [31:0]      last_HADDR;
    reg             last_HWRITE;
    reg [1:0]       last_HTRANS;

    always@ (posedge HCLK) begin
        if(HREADY) begin
            last_HSEL       <= HSEL;
            last_HADDR      <= HADDR;
            last_HWRITE     <= HWRITE;
            last_HTRANS     <= HTRANS;
        end
    end

    always @ (posedge HCLK or negedge HRESETn)
        if(HRESETn == 0) 
            state <= IDLE;
        else 
            state <= nstate;

    always @* begin
        nstate = IDLE;
        case(state)
            IDLE :   if(HTRANS[1] & HSEL & HREADY & c_hit) 
                            nstate = RW;
                        else if(HTRANS[1] & HSEL & HREADY & ~c_hit) 
                            nstate = WAIT;

            WAIT :   if(c_wr[1]) 
                            nstate = RW; 
                        else  
                            nstate = WAIT;

            RW   :   if(HTRANS[1] & HSEL & HREADY & c_hit) 
                            nstate = RW;
                        else if(HTRANS[1] & HSEL & HREADY & ~c_hit) 
                            nstate = WAIT;
        endcase
    end

    always @(posedge HCLK or negedge HRESETn)
        if(!HRESETn) 
            HREADYOUT <= 1'b1;
        else
            case (state)
                IDLE :  if(HTRANS[1] & HSEL & HREADY & c_hit) 
                            HREADYOUT <= 1'b1;
                        else if(HTRANS[1] & HSEL & HREADY & ~c_hit) 
                            HREADYOUT <= 1'b0;
                        else 
                            HREADYOUT <= 1'b1;
                WAIT :  if(c_wr[1]) 
                            HREADYOUT <= 1'b1;
                        else 
                            HREADYOUT <= 1'b0;
                RW   :  if(HTRANS[1] & HSEL & HREADY & c_hit) 
                            HREADYOUT <= 1'b1;
                        else if(HTRANS[1] & HSEL & HREADY & ~c_hit) 
                            HREADYOUT <= 1'b0;
            endcase
        

    assign fr_rd        =   ( HTRANS[1] & HSEL & HREADY & ~c_hit & (state==IDLE) ) |
                            ( HTRANS[1] & HSEL & HREADY & ~c_hit & (state==RW) );

    assign c_A          =   last_HADDR[23:0];
    
    DMC_Nx16 #(.NUM_LINES(NUM_LINES)) 
        CACHE ( 
                .clk(HCLK), 
                .rst_n(HRESETn), 
                .A(last_HADDR[23:0]), 
                .A_h(HADDR[23:0]), 
                .Do(c_datao), 
                .hit(c_hit), 
                .line(c_line), 
                .wr(c_wr[1]) 
            );

    FLASH_READER_SPI FR (   
                .clk(HCLK), 
                .rst_n(HRESETn), 
                .addr({HADDR[23:4], 4'd0}), 
                .rd(fr_rd), 
                .done(fr_done), 
                .line(c_line),
                .sck(sck), 
                .ce_n(ce_n), 
                .miso(miso), 
                .mosi(mosi)
            );

    assign HRDATA   = c_datao;

    always @ (posedge HCLK or negedge HRESETn) begin
        if(~HRESETn) begin
            c_wr <= 2'b0;
        end else begin
            c_wr[0] <= fr_done;
            c_wr[1] <= c_wr[0];
        end
    end
    
endmodule
