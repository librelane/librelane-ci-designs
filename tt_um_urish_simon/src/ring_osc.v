/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

// verilator lint_off UNOPTFLAT

`default_nettype none

module ring_osc #(
    parameter CHAIN_LENGTH = 13,
    parameter DIVIDER_BITS = 10
) (
    output wire clk_out,
    output wire clk_out_div
);

  wire [CHAIN_LENGTH-1:0] inv_in;
  wire [CHAIN_LENGTH-1:0] inv_out;

  assign inv_in  = {inv_out[CHAIN_LENGTH-2:0], inv_out[CHAIN_LENGTH-1]};
  assign clk_out = inv_out[CHAIN_LENGTH-1];

  inverter inv[CHAIN_LENGTH-1:0] (
      .in (inv_in),
      .out(inv_out)
  );

  wire [DIVIDER_BITS-1:0] divider;
  assign clk_out_div = divider[DIVIDER_BITS-1];

  clock_divider_stage dividers[DIVIDER_BITS-1:0] (
      .clk({divider[DIVIDER_BITS-2:0], clk_out}),
      .in (divider),
      .out(divider)
  );

endmodule
