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
/*
    Glitch-free Clock Multiplexors:
        - clkmux_2x1
        - clkmux_4x1
    
    The multiplexors are capable of switching between clocks from 
    different sources. They are based on the following old EDN article: 
    https://www.edn.com/techniques-to-make-clock-switching-glitch-free/
    
*/

`timescale 			1ns/1ps
`default_nettype 	none

module clkmux_2x1 (
    input   wire    rst_n,
    input   wire    clk0, 
    input   wire    clk1,
    input   wire    sel,
    output  wire    clko
);

    reg Q1a, Q1b, Q2a, Q2b;
    wire q1a_in, q2a_in;
    
    assign clko = (clk0 & Q1b) | (clk1 & Q2b);
    
    wire  Q2b_bar = ~Q2b;
    wire  Q1b_bar = ~Q1b;
    wire  sel_bar = ~sel;
    
    assign q1a_in = Q2b_bar & sel_bar;
    assign q2a_in = Q1b_bar & sel;
    
    always @(posedge clk0 or negedge rst_n) 
        if (~rst_n) 
            Q1a <= 1'b0; 
        else 
            Q1a <= q1a_in;

    always @(negedge clk0 or negedge rst_n) 
        if (~rst_n) 
            Q1b <= 1'b0; 
        else 
            Q1b <= Q1a;

    always @(posedge clk1 or negedge rst_n) 
        if (~rst_n) 
            Q2a <= 1'b0; 
        else 
            Q2a <= q2a_in;

    always @(negedge clk1 or negedge rst_n) 
        if (~rst_n) 
            Q2b <= 1'b0; 
        else 
            Q2b <= Q2a;

endmodule

module clkmux_4x1 (
    input   wire        rst_n,
    input   wire        clk0, 
    input   wire        clk1, 
    input   wire        clk2, 
    input   wire        clk3,
    input   wire [1:0]  sel,
    output  wire        clko
);

    wire clko1, clko2;

    clkmux_2x1 m1(  
                    .rst_n(rst_n),
                    .clk0(clk0), 
                    .clk1(clk1), 
                    .clko(clko1), 
                    .sel(sel[0])
                );
    clkmux_2x1 m2(  
                    .rst_n(rst_n),
                    .clk0(clk2), 
                    .clk1(clk3), 
                    .clko(clko2), 
                    .sel(sel[0])
                );
    clkmux_2x1 m3(  
                    .rst_n(rst_n),
                    .clk0(clko1), 
                    .clk1(clko2), 
                    .clko(clko), 
                    .sel(sel[1])
                );
    
endmodule