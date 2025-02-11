## CLOCK CONSTRAINTS
create_clock [get_ports $::env(CLOCK_PORT)]  -name $::env(CLOCK_PORT)  -period 20
set_propagated_clock [get_clocks $::env(CLOCK_PORT)]
# set_clock_transition 1.5 [get_clocks $::env(CLOCK_PORT)]
set_driving_cell -lib_cell sky130_fd_sc_hd__clkbuf_4 -pin {X} [get_ports $::env(CLOCK_PORT)]
set_clock_uncertainty 0.1 [get_clocks $::env(CLOCK_PORT)]

## INPUT DELAY
set_input_transition 0.5 [all_inputs]
set_input_delay -max 4 -clock [get_clocks $::env(CLOCK_PORT)] [all_inputs]
set_input_delay -min 3.3 -clock [get_clocks $::env(CLOCK_PORT)] [all_inputs]

## OUTPUT DELAY
set_output_delay 4 -clock [get_clocks $::env(CLOCK_PORT)] [all_outputs]

## CAP LOAD
set cap_load 0.075
puts "\[INFO\]: Setting load to: $cap_load"
set_load $cap_load [all_outputs]

## MAX TRANS
set_max_trans 1.5 [current_design]

## DERATES
puts "\[INFO\]: Setting timing derate to: [expr {5 * 100}] %"
set_timing_derate -early 0.95
set_timing_derate -late 1.05
