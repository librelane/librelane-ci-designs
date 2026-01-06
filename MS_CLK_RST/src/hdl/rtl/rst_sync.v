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
    Reset Synchronizer.
*/
`timescale 			1ns/1ps
`default_nettype 	none

module rst_sync (
	input 	wire	clk,
	input 	wire	rst_n,
	output 	wire	srst_n
);
	(* keep *)
	reg [2:0] rst_sync;
	always @ (posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			rst_sync[0] <= 1'b0;
			rst_sync[1] <= 1'b0;	
			rst_sync[2] <= 1'b0;	
		end 
		else begin
			rst_sync[0] <= 1'b1;
			rst_sync[1] <= rst_sync[0];
			rst_sync[2] <= rst_sync[1];			
		end
	end
	assign srst_n = rst_sync[2];
	
endmodule