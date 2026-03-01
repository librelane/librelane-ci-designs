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
from librelane.steps import Checker, OpenROAD, DeferredStepError

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

    # Needed because of https://github.com/The-OpenROAD-Project/OpenROAD/issues/8642
    target_flow.Steps.remove(OpenROAD.ResizerTimingPostCTS)
    target_flow.Steps.remove(OpenROAD.ResizerTimingPostGRT)

    if gui:
        target_flow = Flow.factory.get("OpenInOpenROAD")

    # Run the flow
    config_path = os.path.join(__dir__, "config.yaml")
    config = yaml.safe_load(open(config_path))

    flow = target_flow(
        config,
        design_dir=__dir__,
        pdk_root=pdk_root,
        pdk=pdk,
    )
    state_out = flow.start(tag=run_tag)

    # Check for hold violations
    step = Checker.HoldViolations(config=flow.config, state_in=state_out)
    got_hold_violations = False
    try:
        current_state = step.start(
            step_dir=os.path.join(
                __dir__, "runs", run_tag, "xx-checker-holdviolations"
            ),
        )
    except DeferredStepError as e:
        print(e)
        got_hold_violations = True

    if not got_hold_violations:
        raise FlowError("Expected hold violations, got none!") from None

    print("Got hold violations, as expected.")


if __name__ == "__main__":
    main()
