#!/usr/bin/env python3
from librelane.flows import Flow

Classic = Flow.factory.get("Classic")

flow = Classic(
    {
        "PDK": "sky130A",
        "DESIGN_NAME": "spm",
        "VERILOG_FILES": ["./src/spm.v"],
        "CLOCK_PORT": "clk",
        "CLOCK_PERIOD": 10,
    },
    design_dir=".",
)

flow.start()
