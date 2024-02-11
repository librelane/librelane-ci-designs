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
import json
import click
import shutil
from openlane.common.misc import mkdirp

from openlane.flows import Flow
from openlane.config import Macro

__dir__ = os.path.dirname(os.path.realpath(__file__))


@click.command(context_settings={"ignore_unknown_options": True})
@click.option("--pdk-root", type=click.Path(dir_okay=True, file_okay=False))
@click.option("--run-tag", type=click.Path(dir_okay=True, file_okay=False))
@click.argument("args", nargs=-1, type=click.UNPROCESSED)
def main(
    pdk_root,
    run_tag,
    args,
):
    TargetFlow = Flow.factory.get("Classic")

    upe_dir = os.path.join(__dir__, "src", "openlane", "user_proj_example")
    upe_config_path = os.path.join(upe_dir, "config.json")
    upe_config = json.load(open(upe_config_path))
    upe_config.update(
        **{
            "BASE_SDC_FILE": os.path.join(__dir__, "base_user_proj_example.sdc"),
            "RUN_IRDROP_REPORT": False,
            "meta": {"version": 1},
        }
    )

    upe_flow = TargetFlow(
        upe_config,
        design_dir=upe_dir,
        pdk="sky130A",
        pdk_root=pdk_root,
    )
    upe_state_out = upe_flow.start(tag=run_tag)

    user_proj_example = Macro.from_state(upe_state_out)

    # TODO: Fix these hacks
    user_proj_example.nl = [x.replace(".nl.v", ".pnl.v") for x in user_proj_example.nl]
    user_proj_example.lib = []
    
    user_proj_example.instantiate("mprj", (60, 15))

    upw_dir = os.path.join(__dir__, "src", "openlane", "user_project_wrapper")
    upw_config_path = os.path.join(upw_dir, "config.json")
    upw_config = json.load(open(upw_config_path))
    upw_config.update(
        **{
            "BASE_SDC_FILE": os.path.join(__dir__, "base_user_project_wrapper.sdc"),
            "MACROS": {"user_proj_example": user_proj_example},
            "EXTRA_GDS_FILES": None,
            "EXTRA_SPEFS": None,
            "EXTRA_LIBS": None,
            "EXTRA_LEFS": None,
            "VERILOG_FILES_BLACKBOX": None,
            "meta": {"version": 1},
        }
    )

    upw_flow = TargetFlow(
        upw_config,
        design_dir=upw_dir,
        pdk="sky130A",
        pdk_root=pdk_root,
    )
    upw_flow.start(tag=run_tag)
    
    runs_dir = os.path.join(__dir__, "runs")
    run_dir_final = os.path.join(runs_dir, run_tag)
    mkdirp(runs_dir)
    shutil.copytree(upw_flow.run_dir, run_dir_final)


main()
