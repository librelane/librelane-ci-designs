// Copyright 2024 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
module inverter (
`ifdef USE_POWER_PINS
`ifdef PDK_sky130A 
    inout VPWR,
    inout VGND,
`elsif PDK_gf180mcuD
    inout VDD,
    inout VSS,
`endif
`endif
    input wire in,
    output out
);
`ifdef PDK_sky130A
    sky130_fd_sc_hd__inv_1 inv(
    `ifdef USE_POWER_PINS
        .VPWR(VPWR),
        .VGND(VGND),
        .VPB(VPWR),
        .VNB(VGND),
    `endif
        .Y(out),
        .A(in)
    );
`elsif PDK_gf180mcuD
    gf180mcu_fd_sc_mcu7t5v0__inv_1 inv(
    `ifdef USE_POWER_PINS
        .VDD(VDD),
        .VSS(VSS),
        .VNW(VDD),
        .VPW(VSS),
    `endif
        .ZN(out),
        .I(in)
    );
`elsif PDK_ihp_sg13g2
    sg13g2_inv_1 inv(
        .Y(out),
        .A(in)
    );
`endif

endmodule
