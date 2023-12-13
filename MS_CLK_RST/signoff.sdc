###############################################################################
# Created by write_sdc
# Tue Apr 25 10:55:41 2023
###############################################################################
current_design MS_CLK_RST
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name __VIRTUAL_CLK__ -period 10.00
set_input_delay 0.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {por_fb_in}]
set_output_delay 0.0000 -clock [get_clocks {__VIRTUAL_CLK__}] -add_delay [get_ports {por_fb_out}]

set_false_path -from [get_ports {one}]
set_false_path -from [get_ports {zero}]

create_clock -name CLK -period 5 [get_pins PoR.ROSC_CLKBUF_1/X]
set CLK_500kHz_pin [get_pins -of_objects {PoR.clk_div[8]} -filter lib_pin_name==Q]
create_clock -name CLK_500kHz -period 200 $CLK_500kHz_pin

set_clock_groups \
   -name clock_group \
   -logically_exclusive \
   -group [get_clocks {CLK}]\
   -group [get_clocks {CLK_500kHz}]

set_clock_uncertainty 0.150 [all_clocks] 
set_propagated_clock [all_clocks]

###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.120 [get_ports {clk}]
set_load -pin_load 0.020 [get_ports {por_n}]
set_load -pin_load 0.020 [get_ports {rst_n}]
set_load -pin_load 0.020 [get_ports {por_fb_out}]

###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]
