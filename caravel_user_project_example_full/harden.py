#!/usr/bin/env python3
import json
import os

from openlane.flows.classic import Classic

DIRNAME = os.path.dirname(os.path.realpath(__file__))
os.chdir(DIRNAME)
example_config = json.load(open("./src/openlane/user_proj_example/config.json"))
run_dir = "./runs/CI/user_proj_example"
example_overrides = {
    "BASE_SDC_FILE": os.path.abspath("./base_user_proj_example.sdc"),
    "RUN_IRDROP_REPORT": False,
}
for key in example_overrides.keys():
    example_config[key] = example_overrides[key]

example_flow = Classic(
    {
        **example_config,
        **{
            "meta": {"version": 0},
        },
    },
    design_dir="./src/openlane/user_proj_example",
    pdk="sky130A",
)
example_flow.start(_force_run_dir=run_dir)

wrapper_config = json.load(open("./src/openlane/user_project_wrapper/config.json"))
wrapper_overrides = {
    "BASE_SDC_FILE": "./base_user_project_wrapper.sdc",
    "MACROS": {
        "user_proj_example": {
            "gds": [
                os.path.abspath(
                    os.path.join(run_dir, "final", "gds", "user_proj_example.gds")
                )
            ],
            "lef": [
                os.path.abspath(
                    os.path.join(run_dir, "final", "lef", "user_proj_example.lef")
                )
            ],
            "instances": {"mprj": {"location": [60, 15], "orientation": "N"}},
            "nl": [
                os.path.abspath(
                    os.path.join(run_dir, "final", "pnl", "user_proj_example.pnl.v")
                )
            ],
            "spef": {
                "min_*": [
                    os.path.abspath(
                        os.path.join(
                            run_dir,
                            "final",
                            "spef",
                            "min_",
                            "user_proj_example.min.spef",
                        )
                    )
                ],
                "nom_*": [
                    os.path.abspath(
                        os.path.join(
                            run_dir,
                            "final",
                            "spef",
                            "nom_",
                            "user_proj_example.nom.spef",
                        )
                    )
                ],
                "max_*": [
                    os.path.abspath(
                        os.path.join(
                            run_dir,
                            "final",
                            "spef",
                            "max_",
                            "user_proj_example.max.spef",
                        )
                    )
                ],
            },
        }
    },
}
del wrapper_config["EXTRA_GDS_FILES"]
del wrapper_config["EXTRA_SPEFS"]
del wrapper_config["EXTRA_LIBS"]
del wrapper_config["EXTRA_LEFS"]
del wrapper_config["VERILOG_FILES_BLACKBOX"]
run_dir = "./runs/CI/user_project_wrapper"
wrapper_flow = Classic(
    {
        **wrapper_config,
        **wrapper_overrides,
        **{
            "meta": {"version": 0},
        },
    },
    design_dir="./src/openlane/user_project_wrapper",
    pdk="sky130A",
)
wrapper_flow.start(_force_run_dir=run_dir)
