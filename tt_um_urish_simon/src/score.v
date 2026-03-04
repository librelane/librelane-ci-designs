// SPDX-License-Identifier: Apache-2.0
// SPDX-FileCopyrightText: © 2023-2024 Uri Shaked

`default_nettype none

module score (
    input wire clk,
    input wire rst,
    input wire ena,
    input wire invert,
    input wire inc,
    output reg [6:0] segments,
    output reg [1:0] digits
);
  reg active_digit;
  reg [3:0] ones;
  reg [3:0] tens;
  wire [3:0] digit_value = active_digit ? tens : ones;

  always @(posedge clk) begin
    active_digit <= ~active_digit;

    if (rst) begin
      ones <= 0;
      tens <= 0;
      active_digit <= 0;
    end else if (inc) begin
      ones <= ones + 1;
      if (ones == 9) begin
        ones <= 0;
        tens <= tens + 1;
        if (tens == 9) begin
          tens <= 0;
        end
      end
    end

    case (active_digit)
      1'b0: digits <= invert ? 2'b10 : 2'b01;
      1'b1: digits <= invert ? 2'b01 : 2'b10;
    endcase

    case (ena ? digit_value : 4'd15)
      4'd0: segments <= invert ? 7'b1000000 : 7'b0111111;
      4'd1: segments <= invert ? 7'b1111001 : 7'b0000110;
      4'd2: segments <= invert ? 7'b0100100 : 7'b1011011;
      4'd3: segments <= invert ? 7'b0110000 : 7'b1001111;
      4'd4: segments <= invert ? 7'b0011001 : 7'b1100110;
      4'd5: segments <= invert ? 7'b0010010 : 7'b1101101;
      4'd6: segments <= invert ? 7'b0000010 : 7'b1111101;
      4'd7: segments <= invert ? 7'b1111000 : 7'b0000111;
      4'd8: segments <= invert ? 7'b0000000 : 7'b1111111;
      4'd9: segments <= invert ? 7'b0010000 : 7'b1101111;
      default: segments <= invert ? 7'b1111111 : 7'b0000000;
    endcase
  end

endmodule
