/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

(* keep_hierarchy = "yes" *)
module clock_divider_stage (
    input  wire clk,
    input  wire in,
    output reg  out
);
  always @(posedge clk) begin
    out <= ~in;
  end
endmodule
