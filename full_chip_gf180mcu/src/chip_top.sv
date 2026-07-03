// SPDX-FileCopyrightText: © 2025 LibreLane Template Contributors
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

module chip_top #(
    // Power/ground pads for I/O and core
    parameter NUM_DVDD_PADS = 2,
    parameter NUM_DVSS_PADS = 2,
    
    // Signal pads
    parameter NUM_INPUT_PADS  = 10,
    parameter NUM_BIDIR_PADS  = 16,
    parameter NUM_ANALOG_PADS = 8
    )(
    `ifdef USE_POWER_PINS
    inout  wire VDD,
    inout  wire VSS,
    `endif
    inout  wire clk_PAD,
    inout  wire rst_n_PAD,
    inout  wire [NUM_INPUT_PADS-1 :0] input_PAD,
    inout  wire [NUM_BIDIR_PADS-1 :0] bidir_PAD,
    inout  wire [NUM_ANALOG_PADS-1:0] analog_PAD
);

    wire clk_PAD2CORE;
    wire rst_n_PAD2CORE;
    wire [NUM_INPUT_PADS-1 :0] input_PAD2CORE;
    wire [NUM_BIDIR_PADS-1 :0] bidir_PAD2CORE;
    wire [NUM_BIDIR_PADS-1 :0] bidir_CORE2PAD;
    wire [NUM_BIDIR_PADS-1 :0] bidir_CORE2PAD_OE;

    // Power/ground pad instances
    generate
    for (genvar i=0; i<NUM_DVDD_PADS; i++) begin : dvdd_pads
        (* keep *)
        gf180mcu_fd_io__dvdd pad  (
            `ifdef USE_POWER_PINS
            .DVDD   (VDD),
            .DVSS   (VSS),
            .VSS    (VSS)
            `endif
        );
    end
    for (genvar i=0; i<NUM_DVSS_PADS; i++) begin : dvss_pads
        (* keep *)
        gf180mcu_fd_io__dvss pad  (
            `ifdef USE_POWER_PINS
            .DVDD   (VDD),
            .DVSS   (VSS),
            .VDD    (VDD)
            `endif
        );
    end
    endgenerate

    // Signal IO pad instances

    // Schmitt trigger
    gf180mcu_fd_io__in_s clk_pad (
        `ifdef USE_POWER_PINS
        .DVDD   (VDD),
        .DVSS   (VSS),
        .VDD    (VDD),
        .VSS    (VSS),
        `endif
    
        .Y      (clk_PAD2CORE),
        .PAD    (clk_PAD),
        
        .PU     (1'b0),
        .PD     (1'b0)
    );
    
    // Normal input
    gf180mcu_fd_io__in_c rst_n_pad (
        `ifdef USE_POWER_PINS
        .DVDD   (VDD),
        .DVSS   (VSS),
        .VDD    (VDD),
        .VSS    (VSS),
        `endif
    
        .Y      (rst_n_PAD2CORE),
        .PAD    (rst_n_PAD),
        
        .PU     (1'b0),
        .PD     (1'b0)
    );

    generate
    for (genvar i=0; i<NUM_INPUT_PADS; i++) begin : inputs
        (* keep *)
        gf180mcu_fd_io__in_c pad (
            `ifdef USE_POWER_PINS
            .DVDD   (VDD),
            .DVSS   (VSS),
            .VDD    (VDD),
            .VSS    (VSS),
            `endif
        
            .Y      (input_PAD2CORE[i]),
            .PAD    (input_PAD[i]),
            
            .PU     (1'b0),
            .PD     (1'b0)
        );
    end
    endgenerate

    generate
    for (genvar i=0; i<NUM_BIDIR_PADS; i++) begin : bidirs
        (* keep *)
        gf180mcu_fd_io__bi_24t pad (
            `ifdef USE_POWER_PINS
            .DVDD   (VDD),
            .DVSS   (VSS),
            .VDD    (VDD),
            .VSS    (VSS),
            `endif
        
            .A      (bidir_CORE2PAD[i]),
            .OE     (bidir_CORE2PAD_OE[i]),
            .Y      (bidir_PAD2CORE[i]),
            .PAD    (bidir_PAD[i]),
            
            .CS     (1'b0),
            .SL     (1'b0),
            .IE     (!bidir_CORE2PAD_OE[i]),

            .PU     (1'b0),
            .PD     (1'b0)
        );
    end
    endgenerate
    
    generate
    for (genvar i=0; i<NUM_ANALOG_PADS; i++) begin : analogs
        (* keep *)
        gf180mcu_fd_io__asig_5p0 pad (
            `ifdef USE_POWER_PINS
            .DVDD   (VDD),
            .DVSS   (VSS),
            .VDD    (VDD),
            .VSS    (VSS),
            `endif
            .ASIG5V (analog_PAD[i])
        );
    end
    endgenerate

    // Core design

    (* keep *) chip_core #(
        .NUM_INPUT_PADS  (NUM_INPUT_PADS),
        .NUM_BIDIR_PADS  (NUM_BIDIR_PADS),
        .NUM_ANALOG_PADS (NUM_ANALOG_PADS)
    ) i_chip_core (
        .clk        (clk_PAD2CORE),
        .rst_n      (rst_n_PAD2CORE),
        .input_in   (input_PAD2CORE),
        .bidir_in   (bidir_PAD2CORE),
        .bidir_out  (bidir_CORE2PAD),
        .bidir_oe   (bidir_CORE2PAD_OE),
        .analog     (analog_PAD)
    );

endmodule

`default_nettype wire
