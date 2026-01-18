// SPDX-FileCopyrightText: © 2025 LibreLane Template Contributors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module chip_top #(
    // Power/ground pads for core
    parameter NUM_VDD_PADS = 1,
    parameter NUM_VSS_PADS = 1,
    
    // Power/ground pads for I/O
    parameter NUM_IOVDD_PADS = 1,
    parameter NUM_IOVSS_PADS = 1,
    
    // Signal pads
    parameter NUM_INPUT_PADS  = 10,
    parameter NUM_OUTPUT_PADS = 8,
    parameter NUM_BIDIR_PADS  = 8,
    parameter NUM_ANALOG_PADS = 8
    )(
    `ifdef USE_POWER_PINS
    inout wire IOVDD,
    inout wire IOVSS,
    inout wire VDD,
    inout wire VSS,
    `endif
    inout  wire clk_PAD,
    inout  wire rst_n_PAD,
    inout  wire [NUM_INPUT_PADS-1 :0] input_PAD,
    inout  wire [NUM_OUTPUT_PADS-1:0] output_PAD,
    inout  wire [NUM_BIDIR_PADS-1 :0] bidir_PAD,
    inout  wire [NUM_ANALOG_PADS-1:0] analog_PAD
);

    wire clk_PAD2CORE;
    wire rst_n_PAD2CORE;
    wire [NUM_INPUT_PADS-1 :0] input_PAD2CORE;
    wire [NUM_OUTPUT_PADS-1:0] output_CORE2PAD;
    wire [NUM_BIDIR_PADS-1 :0] bidir_PAD2CORE;
    wire [NUM_BIDIR_PADS-1 :0] bidir_CORE2PAD;
    wire [NUM_BIDIR_PADS-1 :0] bidir_CORE2PAD_OE;
    wire [NUM_ANALOG_PADS-1:0] analog_PADRES;

    // Power/ground pad instances
    generate
    for (genvar i=0; i<NUM_IOVDD_PADS; i++) begin : iovdd_pads
        (* keep *)
        sg13g2_IOPadIOVdd iovdd_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_IOVSS_PADS; i++) begin : iovss_pads
        (* keep *)
        sg13g2_IOPadIOVss iovss_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_VDD_PADS; i++) begin : vdd_pads
        (* keep *)
        sg13g2_IOPadVdd vdd_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_VSS_PADS; i++) begin : vss_pads
        (* keep *)
        sg13g2_IOPadVss vss_pad  (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS)
            `endif
        );
    end
    endgenerate

    // Signal IO pad instances

    // Schmitt trigger
    sg13g2_IOPadIn clk_pad (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .p2c    (clk_PAD2CORE),
        .pad    (clk_PAD)
    );
    
    // Normal input
    sg13g2_IOPadIn rst_n_pad (
        `ifdef USE_POWER_PINS
        .iovdd  (IOVDD),
        .iovss  (IOVSS),
        .vdd    (VDD),
        .vss    (VSS),
        `endif
        .p2c    (rst_n_PAD2CORE),
        .pad    (rst_n_PAD)
    );

    generate
    for (genvar i=0; i<NUM_INPUT_PADS; i++) begin : inputs
        sg13g2_IOPadIn input_pad (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS),
            `endif
            .p2c    (input_PAD2CORE[i]),
            .pad    (input_PAD[i])
        );
    end
    endgenerate

    generate
    for (genvar i=0; i<NUM_OUTPUT_PADS; i++) begin : outputs
        sg13g2_IOPadOut30mA output_pad (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS),
            `endif
            .c2p    (output_CORE2PAD[i]),
            .pad    (output_PAD[i])
        );
    end
    endgenerate

    generate
    for (genvar i=0; i<NUM_BIDIR_PADS; i++) begin : bidirs
        sg13g2_IOPadInOut30mA bidir_pad (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS),
            `endif
            .c2p    (bidir_CORE2PAD[i]),
            .c2p_en (bidir_CORE2PAD_OE[i]),
            .p2c    (bidir_PAD2CORE[i]),
            .pad    (bidir_PAD[i])
        );
    end
    endgenerate
    
    generate
    for (genvar i=0; i<NUM_ANALOG_PADS; i++) begin : analogs
        (* keep *)
        sg13g2_IOPadAnalog analog_pad (
            `ifdef USE_POWER_PINS
            .iovdd  (IOVDD),
            .iovss  (IOVSS),
            .vdd    (VDD),
            .vss    (VSS),
            `endif
            .padres (analog_PADRES[i]),
            .pad    (analog_PAD[i])
        );
    end
    endgenerate

    // Core design

    (* keep *) chip_core #(
        .NUM_INPUT_PADS  (NUM_INPUT_PADS),
        .NUM_OUTPUT_PADS (NUM_OUTPUT_PADS),
        .NUM_BIDIR_PADS  (NUM_BIDIR_PADS),
        .NUM_ANALOG_PADS (NUM_ANALOG_PADS)
    ) i_chip_core (
        .clk        (clk_PAD2CORE),
        .rst_n      (rst_n_PAD2CORE),
        .input_in   (input_PAD2CORE),
        .output_out (output_CORE2PAD),
        .bidir_in   (bidir_PAD2CORE),
        .bidir_out  (bidir_CORE2PAD),
        .bidir_oe   (bidir_CORE2PAD_OE),
        .analog     (analog_PADRES)
    );

endmodule

`default_nettype wire
