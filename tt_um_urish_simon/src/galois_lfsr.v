/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module galois_lfsr (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire load_enable,
    input wire [31:0] load_value,
    output reg [31:0] lfsr_out
);

  wire feedback = lfsr_out[31] ^ lfsr_out[21] ^ lfsr_out[1] ^ lfsr_out[0];

  always @(posedge clk) begin
    if (rst) begin
      lfsr_out <= 32'h2048FAFA;  // Initialize LFSR to non-zero value
    end else begin
      if (lfsr_out == 32'h0) begin
        lfsr_out <= 32'h2048FAFA;  // Reload LFSR to non-zero value
      end else if (load_enable) begin
        lfsr_out <= load_value;
      end else if (enable) begin
        lfsr_out <= {lfsr_out[30:0], feedback};  // Shift left and insert feedback bit
      end
    end
  end

endmodule
