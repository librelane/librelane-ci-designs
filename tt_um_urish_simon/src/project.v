/*
 * Copyright (c) 2024 Uri Shaked
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_urish_simon (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire [3:0] led;
  wire [6:0] segments;
  wire [1:0] segment_digits;
  wire sound;
  wire clk_sel = ui_in[7];
  wire clk_ring_osc;
  wire clk_internal;
  wire clk_simon = clk_sel ? clk_internal : clk;
  wire clk_internal_out = clk_sel ? clk_internal : 0;

  assign uo_out  = {clk_internal_out, segment_digits, sound, led};
  assign uio_out = {1'b0, segments};
  assign uio_oe  = 8'b0111_1111;

  ring_osc #(
      .CHAIN_LENGTH(13),
      .DIVIDER_BITS(13)  // For ~62.5 KHz output, determined by measuring tt05's tt_um_urish_ringosc_cnt
  ) ring_osc (
      .clk_out(clk_ring_osc),
      .clk_out_div(clk_internal)
  );

  simon simon1 (
      .clk   (clk_simon),
      .rst   (!rst_n),
      .ticks_per_milli (clk_sel ? 6'd62 : 6'd50),
      .btn   (ui_in[3:0]),
      .led   (led),
      .segments(segments),
      .segment_digits(segment_digits),
      .segments_invert(ui_in[4]),
      .sound (sound)
  );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[7:5], uio_in, clk_ring_osc, 1'b0};

endmodule
