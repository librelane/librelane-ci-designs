/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
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
  A 32-bit Timer/Counter and PWM generator with an 8-bit prescalar. 
  
  This IP can be used to:
    - Keep track of time (up/down, periodic/one_shot Timer)
    - Count external pulses from external GPIO
    - Generate PWM signal on a GPIO pin
    - Measure the time between events on an GPIO pin (posedge/negedge/both)
  
  clk_src:
    0   clk/2
    1   clk/4
    .
    .
    7   clk/256
    8   clk
    9   counter external pin 
  
  Mode of operations:
    - Timer (tmr_en=1)
      + one_shot : 1: one shot; 0: periodic
      + period : initial count for down counting or terminal count for up counting
      + up : 1:up, 0:down counting
      + to_flag : Time-out Flag (up=0: tmr==0; up=1: tmr==period )
      + tmr : current count
    
    - PWM (tmr_en = 1 and pwm_en = 1)
      + pwm_cmp : if(tmr == pwm_cmp) pwm_out = 1 else if(to_flag) pwm_out = 0
    
    - Counter (tmr_en=1 and clk_src=9)
      + ctr_match : match register
      + match_flag : if(tmr == ctr_match) 
    
    - Event Capture (cp_en = 1)
      + cp_event : 1: posedge, 2: negedge, 3: both
      + cp_count : count between events
      + cp_flag : event count ready
*/

`timescale          1ns/1ns
`default_nettype    none

module EF_TCC32 (		
    input   wire            clk,
    input   wire	        rst_n,
    input	wire	        ctr_in,
    input   wire [31:0]     period,
    input   wire [31:0]     ctr_match,
    output  reg  [31:0]     tmr,
    output  reg  [31:0]     cp_count,
    input   wire [ 3:0]     clk_src,
    output  wire	        to_flag,
    output  wire            match_flag,
    input	wire	        tmr_en,
    input	wire	        one_shot,
    input	wire	        up,
    input   wire            cp_en,
    input   wire [1:0]      cp_event,
    output  wire            cp_flag,
    input   wire            en
);
			
    //reg	[31:0]	    tmr;
    wire            ctr_clk;
    reg			    stop;
    reg			    pwm_out;
    
    assign to_flag = up ? (tmr == period) : (tmr == 32'b0);
    
    // ctr pin syn
    reg	ctr_in_sync [1:0];
    always @(posedge clk) begin
        ctr_in_sync[0] <= ctr_in;
        ctr_in_sync[1] <= ctr_in_sync[0];
    end
    assign ctr_clk = ctr_in_sync[1];
    
    // Clock Divider: 2/4/8/.../256
    reg [7:0] pre;
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            pre <= 8'd0;
        else
            if(en)
                pre <= pre + 1'd1;
        
    // clock source
    wire        tmr_clk;
    wire        tmr_clk_src;
    
    assign tmr_clk_src =    (clk_src[3] == 1'b0)    ? pre[clk_src[2:0]] :
                            (clk_src == 4'd9)       ? ctr_clk           : 1'b1;
                            
    // clock edge detector                  
    reg         tmr_clk_src_delayed;
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            tmr_clk_src_delayed <= 1'b0;
        else
            tmr_clk_src_delayed <= tmr_clk_src;
    
    assign tmr_clk =    (clk_src == 4'd8)   ? 1'b1 : ~tmr_clk_src_delayed & tmr_clk_src;
    
    
    always @ (posedge clk or negedge rst_n) begin
        if(!rst_n)
            tmr <= 32'b0;
        else
            if(~tmr_en)
                tmr <= up ? 32'b0 : period;
            else if(to_flag)
                tmr <= up ? 32'b0 : period;
            else if(~stop & tmr_clk)
                tmr <= up ? (tmr + 32'b1) : (tmr - 32'b1);
    end
    
    always @ (posedge clk or negedge rst_n)
        if(!rst_n)
            stop <= 1'b0;
        else if(~tmr_en)
            stop <= 1'b0;
        else if(to_flag & one_shot)
            stop <= 1'b1;
            
    // PWM
    /*		
    wire	pwm_toggle = (tmr == pwm_cmp);
    always @ (posedge clk or negedge rst_n)
        if(!rst_n)
            pwm_out <= 1'b0;
        else if(pwm_en)
                if(pwm_toggle) 
                    pwm_out <= 1'b1;
                else if(to_flag) 
                    pwm_out <= 1'b0;
    */        
    // Capture Events
    reg [31:0]  cp_ctr;
    //reg [31:0]  cp_count;
    reg         cp_counting;
    wire        cp_pos, cp_neg;
    reg         ctr_in_sync_delayed;
    
    always @(posedge clk)
        ctr_in_sync_delayed <= ctr_in_sync[1];
    
    assign cp_pos = ~ctr_in_sync_delayed & ctr_in_sync[1];
    assign cp_neg = ctr_in_sync_delayed & ~ctr_in_sync[1];
    
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            cp_counting <= 1'b0;
        else if(!cp_en)
            cp_counting <= 1'b0;
        else if(cp_event[0] & cp_pos) 
            cp_counting <= ~cp_counting;
        else if(cp_event[1] & cp_neg)
            cp_counting <= ~cp_counting;
            
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            cp_ctr <= 32'd0;
        else if(!cp_counting)
            cp_ctr <= 32'd0;
        else if(tmr_clk)
            cp_ctr <= cp_ctr + 1'b1;
            
    // cp_flag
    reg cp_counting_delayed;
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            cp_counting_delayed <= 1'b0;
        else
            cp_counting_delayed <= cp_counting;
    
    assign cp_flag = cp_counting_delayed & ~cp_counting;
    
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        cp_count <= 32'd0;
    else if(cp_flag) 
        cp_count <= cp_ctr;
        
    // The Counter match flag
    reg     match;
    wire    ctr_mode = (clk_src == 4'd9);
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        match <= 1'b0;    
    else
        if(tmr == ctr_match && ctr_mode == 1'b1)
            match <= 1'b1;
        else
            match <= 1'b0;
    
    reg match_delayed;
    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            match_delayed <= 1'b0;
        else
            match_delayed <= match;

    assign match_flag = match & ~match_delayed;
		
endmodule
