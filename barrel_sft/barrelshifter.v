/*
 * RiscBEE © 2018 Karim Abdel Hamid and Mohamed Gaber
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */
`timescale 1ns/1ns

module BarrelShifter(A, O, shamt, arith, right);
    parameter width = 32;
    parameter bitLength = $clog2(width);
    
    input [width-1:0] A;
    input [bitLength-1:0] shamt;
    input arith, right;
    output [width-1:0] O;
    
    wire lastbit;
    assign lastbit = (arith&&right)? A[width-1] : 1'b0;
    
    genvar i, j;
    wire [width-1:0] C [bitLength:0];
    
    generate
        for(i = 0; i < width; i=i+1) begin : reversal1
            Mux2 #(1) rm(.A(A[i]), .B(A[width-1-i]), .sel(right), .O(C[0][i]));
        end
    endgenerate

    generate
        for(i = 1; i <= bitLength; i=i+1) begin : barrelRow
            for(j = 0; j < width; j=j+1) begin : barrelBit
                if (j-(2**(i-1)) < 0)
                    Mux2 #(1) rm(.A(C[i-1][j]), .B(lastbit), .sel(shamt[i-1]), .O(C[i][j]));
                else
                    Mux2 #(1) rm(.A(C[i-1][j]), .B(C[i-1][j-(2**(i-1))]), .sel(shamt[i-1]), .O(C[i][j]));
            end
        end
    endgenerate
    
    generate
        for(i = 0; i < width; i=i+1) begin : reversal2
            Mux2 #(1) rm(.A(C[bitLength][i]), .B(C[bitLength][width-1-i]), .sel(right), .O(O[i]));
        end
    endgenerate
    
endmodule 