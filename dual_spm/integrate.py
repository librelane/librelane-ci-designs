#!/usr/bin/env python3
# Copyright 2024 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import os
import click

from librelane.flows import Flow
from librelane.state import State
from librelane.config import Macro
from librelane.logging import options
from librelane.common import ScopedFile, get_latest_file

__dir__ = os.path.dirname(os.path.abspath(__file__))


@click.command(context_settings={"ignore_unknown_options": True})
@click.option("--pdk-root", type=click.Path(dir_okay=True, file_okay=False))
@click.option(
    "--run-tag", type=click.Path(dir_okay=True, file_okay=False), required=True
)
@click.option("--macro-and-integration/--integration-only", type=bool, default=True)
@click.argument("args", nargs=-1, type=click.UNPROCESSED)
def main(
    pdk_root,
    run_tag,
    macro_and_integration,
    args,
):
    Classic = Flow.factory.get("Classic")

    options.set_condensed_mode(True)

    spm_v = ScopedFile(
        contents="""
        module spm #(parameter bits=32) (
            input clk,
            input rst,
            input x,
            input[bits-1: 0] a,
            output y
        );
            wire[bits: 0] y_chain;
            assign y_chain[0] = 0;
            assign y = y_chain[bits];

            wire[bits-1:0] a_flip;
            generate 
                for (genvar i = 0; i < bits; i = i + 1) begin : flip_block
                    assign a_flip[i] = a[bits - i - 1];
                end 
            endgenerate

            DelayedSerialAdder dsa[bits-1:0](
                .clk(clk),
                .rst(rst),
                .x(x),
                .a(a_flip),
                .y_in(y_chain[bits-1:0]),
                .y_out(y_chain[bits:1])
            );

        endmodule

        module DelayedSerialAdder(
            input clk,
            input rst,
            input x,
            input a,
            input y_in,
            output reg y_out
        );
            reg lastCarry;
            wire lastCarry_next;
            wire y_out_next;

            wire g = x & a;
            assign {lastCarry_next, y_out_next} = g + y_in + lastCarry;

            always @ (posedge clk or negedge rst) begin
                if (!rst) begin
                    lastCarry <= 1'b0;
                    y_out <= 1'b0;
                end else begin
                    lastCarry <= lastCarry_next;
                    y_out <= y_out_next;
                end
            end
        endmodule
    """
    )

    macro_flow = Classic(
        {
            "DESIGN_NAME": "spm",
            "CLOCK_PORT": "clk",
            "VERILOG_FILES": [spm_v],
            "FP_PDN_CORE_RING": True,
            "RUN_KLAYOUT_DRC": False,
            "FP_PDN_CORE_RING_VWIDTH": 3.1,
            "FP_PDN_CORE_RING_HWIDTH": 3.1,
            "FP_PDN_CORE_RING_VOFFSET": 12.45,
            "FP_PDN_CORE_RING_HOFFSET": 12.45,
            "FP_PDN_CORE_RING_VSPACING": 1.7,
            "FP_PDN_CORE_RING_HSPACING": 1.7,
            "FP_PDN_VPITCH": 80,
            "FP_PDN_HPITCH": 80,
            "FP_PDN_VWIDTH": 3.2,
            "FP_PDN_HWIDTH": 3.2,
            "FP_PDN_VSPACING": 3.2,
            "FP_PDN_HSPACING": 3.2,
            "FP_MACRO_HORIZONTAL_HALO": 20,
            "FP_MACRO_VERTICAL_HALO": 20,
            "VDD_PIN": "power",
            "GND_PIN": "ground",
        },
        design_dir=__dir__,
        pdk="sky130A",
        pdk_root=pdk_root,
    )

    if macro_and_integration:
        macro_state = macro_flow.start(
            tag=os.path.join(run_tag, "macro"), overwrite=True
        )
    else:
        latest_file = get_latest_file(
            f"{__dir__}/runs/{run_tag}/macro", "state_out.json"
        )
        macro_state = State.loads(open(str(latest_file)).read())

    spm = Macro.from_state(macro_state)
    spm.instantiate("spm_inst[0].inst", (150, 150))
    spm.instantiate("spm_inst[1].inst", (300, 300))
    # spm.instantiate("spm_inst.inst", (150, 150))

    integration_v = ScopedFile(
        contents="""
        module thin_wrapper(
        `ifdef USE_POWER_PINS
            inout vcc0,
            inout vss0,
        `endif
            input clk,
            input rst,
            input x,
            input[31:0] a,
            output y 
        );
            spm inst(
            `ifdef USE_POWER_PINS
                .power(vcc0),
                .ground(vss0),
            `endif
                .clk(clk),
                .rst(rst),
                .x(x),
                .a(a),
                .y(y)
            );
        endmodule
        
        module dual_spm(
        `ifdef USE_POWER_PINS
            inout vcc0,
            inout vss0,
        `endif
            input clk,
            input rstn,
            input x1,
            input x2,
            input[31:0] a1,
            input[31:0] a2,
            output y1,
            output y2
        );
            thin_wrapper spm_inst[1:0] (
            `ifdef USE_POWER_PINS
                .vcc0(vcc0),
                .vss0(vss0),
            `endif
                .clk(clk),
                .rst(rstn),
                .x({x1, x2}),
                .a({a1, a2}),
                .y({y1, y2})
            );
        /*
            assign y2 = 1'b0;
            thin_wrapper spm_inst (
            `ifdef USE_POWER_PINS
                .vcc0(vcc0),
                .vss0(vss0),
            `endif
                .clk(clk),
                .rst(rstn),
                .x(x1),
                .a(a1),
                .y(y1)
            );
        */
        endmodule    
        """
    )

    integration_flow = Classic(
        {
            "DESIGN_NAME": "dual_spm",
            "CLOCK_PORT": "clk",
            "VERILOG_FILES": [integration_v],
            "MACROS": {"spm": spm},
            "FP_SIZING": "absolute",
            "DIE_AREA": [0, 0, 500, 500],
            "FP_PDN_CORE_RING_VWIDTH": 3.1,
            "FP_PDN_CORE_RING_HWIDTH": 3.1,
            "FP_PDN_CORE_RING_VOFFSET": 12.45,
            "FP_PDN_CORE_RING_HOFFSET": 12.45,
            "FP_PDN_CORE_RING_VSPACING": 1.7,
            "FP_PDN_CORE_RING_HSPACING": 1.7,
            "FP_PDN_VWIDTH": 3.2,
            "FP_PDN_HWIDTH": 3.2,
            "FP_PDN_VSPACING": 3.2,
            "FP_PDN_HSPACING": 3.2,
            "FP_PDN_VPITCH": 40,
            "FP_PDN_HPITCH": 40,
            "FP_MACRO_HORIZONTAL_HALO": 20,
            "FP_MACRO_VERTICAL_HALO": 20,
            "FP_PDN_CHECK_NODES": False,
            "RUN_IRDROP_REPORT": False,
            "RUN_KLAYOUT_DRC": False,
            "RUN_KLAYOUT_STREAMOUT": False,
            "RUN_KLAYOUT_XOR": False,
            "VDD_PIN": "vcc0",
            "GND_PIN": "vss0",
        },
        design_dir=__dir__,
        pdk="sky130A",
        pdk_root=pdk_root,
    )

    integration_run_tag = os.path.join(run_tag, "integration")
    integration_flow.start(tag=integration_run_tag, overwrite=True)


if __name__ == "__main__":
    main()
