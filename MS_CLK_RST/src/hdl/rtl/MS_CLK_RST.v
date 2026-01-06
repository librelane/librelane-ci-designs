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

`timescale              1ns/1ps
`default_nettype        none

/* 
    Clock and Reset Manager 
     - PoR Generation (all digital)
     - Internal RC Oscillator (8mhz, 16mhz, 32mhz, 64mhz and 128mhz)
     - Clock Multiplexor
     - Clock divider (/2, /4 and /8)
     - External Clock Monitor (fail-safe)
*/
module MS_CLK_RST(
     `ifdef GL 
        input   wire        vccd1,
        input   wire        vssd1,
    `endif // GL
    input   wire        xclk0,     // External clock source 0
    input   wire        xclk1,     // External clock source 1
    input   wire        xrst_n,     // external reset
    input   wire        sel_mux0,   // CLKMUX0 selection - 0: select ROSC 8MHz; 1: select xclk or ROSC (see sel_xclk)
    input   wire        sel_mux1,   // CLKMUX1 selection - 0: ROSC; 1: xclk
    input   wire        sel_mux2,   // CLKMUX2 selection - 0: xclk_0, 1:xclk_1
    input   wire [1:0]  sel_rosc,   // ROSC Frequency: 00:128mh, 01:64mhz, 10:32mhz, 11:16mhz
    input   wire [1:0]  clk_div,    // Clock divider for the output of CLKMUX1: 1, 2, 4 and 8
    input   wire        zero,
    input   wire        one,
    input   wire        por_fb_in,  // must be connected to por_fb_in externally
    output  wire        por_fb_out,
    output  wire        clk,        // syste, clock
    output  wire        rst_n,      // system reset
    output  wire        por_n       // Power-on-Reset
);

    //wire    tiehi = 1'b1;
    //wire    tielo = 1'b0;
    wire    clk_pll;
    wire    clk_8mhz;
    wire    clk_128mhz;
    wire    clk_rosc;
    wire    sxrst_n;
    reg     xclk_mon_rst_n;

    wire    xclk;

    wire clk_buf_in;

    clkmux_2x1 CLKMUX2 (
        .rst_n(rst_n),
        .clk0(xclk0), 
        .clk1(xclk1), 
        .sel(sel_mux2),
        .clko(xclk)
    );

    por_rosc PoR (
        .rst_n(rst_n),          
        .fb_in(por_fb_in),          
        .zero(zero),           
        .one(one),            
        .freq_sel(sel_rosc),       
        .clk_8mhz(clk_8mhz), 
        .clk_128mhz(clk_128mhz),       
        .clk_out(clk_rosc),        
        .por_n(por_n),          
        .fb_out(por_fb_out)          
    );

    // Reset Synchonizer
    rst_sync RST_SYNC (
	    .clk(clk_8mhz),
	    .rst_n(xrst_n),
	    .srst_n(sxrst_n)
    );

    assign rst_n = sxrst_n & por_n & xclk_mon_rst_n;

    // Clock Divider
    reg [2:0]   clkdiv = 0;
    wire        clk_mux1_div;
    wire        clk_mux1;
    always@(posedge clk_mux1)
        clkdiv <= clkdiv + 1'b1;

    wire    clk_2 = clkdiv[0];
    wire    clk_4 = clkdiv[1];
    wire    clk_8 = clkdiv[2];

    clkmux_4x1 CLKMUX (
        .rst_n(rst_n),
        .clk0(clk_mux1), 
        .clk1(clk_2), 
        .clk2(clk_4), 
        .clk3(clk_8),
        .sel(clk_div),
        .clko(clk_mux1_div)
    );
    // Clock Multiplexors
    wire    clk_mux0;
    wire    clk_mux2;
    
    clkmux_2x1 CLKMUX0 (
        .rst_n(rst_n),
        .clk0(clk_8mhz), 
        .clk1(clk_mux1_div), 
        .sel(sel_mux0),
	.clko(`ifdef PnR clk_buf_in `else clk `endif)
    );
`ifdef PnR
    (* keep *) sky130_fd_sc_hd__clkbuf_8 clkbuf (
`ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
`endif
        .A(clk_buf_in),
        .X(clk)
    );
`endif // PnR
    clkmux_2x1 CLKMUX1 (
        .rst_n(rst_n),
        .clk0(clk_rosc), 
        .clk1(xclk), 
        .sel(sel_mux1),
        .clko(clk_mux1)
    );

    // XCLK monitor
    wire enable_xclk_mon = sel_mux1 & sel_mux0;

    reg [8:0]   mon_cntr;
    always @(posedge clk_128mhz or negedge por_n)
        if(!por_n) 
            mon_cntr <= 9'd0;
        else
            mon_cntr <= mon_cntr + 1'b1;
        
    // xclk synchronizer & Edge detector
    reg[2:0] xclk_sync;
    always @(posedge clk_128mhz or negedge rst_n)
    if(!rst_n)
        xclk_sync <= 3'b000;
    else
        xclk_sync <= {xclk_sync[1:0], xclk};
    wire xclk_edge = ~xclk_sync[2] & xclk_sync[1];

    // xclk counter
    reg [8:0]   xclk_cntr;
    wire        en_xclk_cntr = mon_cntr[8];
    always @(posedge clk_128mhz or negedge rst_n)
        if(!rst_n) 
            xclk_cntr <= 9'b0;
        else if(mon_cntr == 9'd255)
            xclk_cntr <= 9'b0;
        else if(xclk_edge & en_xclk_cntr) 
            xclk_cntr <= xclk_cntr + 1'b1;

    wire xclk_cntr_z = (xclk_cntr == 0);

    always @(posedge clk_128mhz or negedge por_n)
        if(!por_n) 
            xclk_mon_rst_n <= 1'b1;
       else if(~en_xclk_cntr & xclk_cntr_z & enable_xclk_mon)
            xclk_mon_rst_n <= 1'b0;
        else if(en_xclk_cntr)
            xclk_mon_rst_n <= 1'b1;

endmodule
