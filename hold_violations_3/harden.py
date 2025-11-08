#!/usr/bin/env python3
# Copyright 2025 LibreLane Contributors
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
import yaml
import click

from librelane.flows import Flow, FlowError
from librelane.config import Macro
from librelane.steps import Checker, DeferredStepError

__dir__ = os.path.dirname(os.path.realpath(__file__))


@click.command(context_settings={"ignore_unknown_options": True})
@click.option("--pdk-root", type=click.Path(dir_okay=True, file_okay=False))
@click.option("--pdk", type=str)
@click.option("--run-tag", type=click.Path(dir_okay=True, file_okay=False))
@click.option("--gui", is_flag=True)
@click.argument("args", nargs=-1, type=click.UNPROCESSED)
def main(
    pdk_root,
    pdk,
    run_tag,
    gui,
    args,
):
    target_flow = Flow.factory.get("Classic")

    # Don't throw exception on hold violations
    target_flow.Steps.remove(Checker.HoldViolations)

    if gui:
        target_flow = Flow.factory.get("OpenInOpenROAD")

    # Build the flipflop macro
    ff_dir = os.path.join(__dir__, "src", "flipflop")
    ff_config_path = os.path.join(ff_dir, "config.yaml")
    ff_config = yaml.safe_load(open(ff_config_path))
    design_dir = os.path.join(__dir__, "src", "flipflop")

    flow = target_flow(
        ff_config,
        design_dir=design_dir,
        pdk_root=pdk_root,
        pdk=pdk,
    )
    ff_state_out = flow.start(tag=run_tag)

    ff_macro = Macro.from_state(ff_state_out)
    ff_macro.instantiate("my_ff_1", (35, 35))
    ff_macro.instantiate("my_ff_2", (35, 75))
    ff_macro.instantiate("my_ff_3", (70, 35))
    ff_macro.instantiate("my_ff_4", (70, 75))

    # Build the top level
    flow_cfg = {
        # Design
        "DESIGN_NAME": "hold_violations_3",
        # Sources
        "VERILOG_FILES": [os.path.join(__dir__, "src", "hold_violations_3.sv")],
        # Clock
        "CLOCK_PORT": "clk_i",
        "CLOCK_PERIOD": 10,  # 10ns = 100MHz
        # Die area
        "FP_SIZING": "absolute",
        "DIE_AREA": [0, 0, 135, 135],
        "PL_TARGET_DENSITY_PCT": 60,
        # Macros
        "MACROS": {"flipflop": ff_macro},
        # PDN
        "PDN_HOFFSET": 5,
        "PDN_HPITCH": 12.4,
        "PDN_VOFFSET": 5,
        "PDN_VPITCH": 15,
        "FP_MACRO_HORIZONTAL_HALO": 3.5,
        "FP_MACRO_VERTICAL_HALO": 3.5,
        "VDD_PIN": "VPWR",
        "GND_PIN": "VGND",
        # Save area
        "BOTTOM_MARGIN_MULT": 2,
        "TOP_MARGIN_MULT": 2,
        "LEFT_MARGIN_MULT": 4,
        "RIGHT_MARGIN_MULT": 4,
        # Don't touch
        "RSZ_DONT_TOUCH_RX": "data_o.*",
    }

    flow = target_flow(
        flow_cfg,
        design_dir=__dir__,
        pdk_root=pdk_root,
        pdk=pdk,
    )
    top_state_out = flow.start(tag=run_tag)

    # Check for hold violations
    step = Checker.HoldViolations(config=flow.config, state_in=top_state_out)
    got_hold_violations = False
    try:
        current_state = step.start(
            step_dir=os.path.join(__dir__, "runs", run_tag, "xx-checker-holdviolations"),
        )
    except DeferredStepError as e:
        print(e)
        got_hold_violations = True

    if not got_hold_violations:
        # Don't expect hold violations for gf180mcu
        if not "gf180mcu" in pdk:
            raise FlowError("Expected hold violations, got none!") from None

    print("Got hold violations, as expected.")


if __name__ == "__main__":
    main()
