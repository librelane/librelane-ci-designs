## CLOCK CONSTRAINTS
create_clock [get_ports $::env(CLOCK_PORT)]  -name $::env(CLOCK_PORT)  -period 15
set_propagated_clock [get_clocks $::env(CLOCK_PORT)]
# set_clock_transition 1.5 [get_clocks $::env(CLOCK_PORT)]
set_driving_cell -lib_cell sky130_fd_sc_hd__clkbuf_4 -pin {X} [get_ports $::env(CLOCK_PORT)]
set_clock_uncertainty 0.1 [get_clocks $::env(CLOCK_PORT)]

## INPUT DELAY
set_input_transition 0.5 [all_inputs]
set_input_delay  4.8 -clock [get_clocks $::env(CLOCK_PORT)] [all_inputs]
set_input_delay -min 3.2 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports PADDR*]

set_input_delay 0 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports PCLK]



## OUTPUT DELAY
set_output_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [all_outputs]

#Menna to avoid infeasable path from and to the following two points
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports PADDR*]
    set_input_delay -min 3.2 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports PADDR*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports brownout_timeout*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports vdda1_pwr_good*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports comp_out*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports vccd2_pwr_good*]
    
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports vccd1_pwr_good*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports brownout_vunder*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports vdda2_pwr_good*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports ulpcomp_out*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports overvoltage_out*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports brownout_filt*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports brownout_unfilt*]
    set_input_delay 4.8 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports vccd2_pwr_good*]

    
    set_output_delay 4.5 -clock [get_clocks $::env(CLOCK_PORT)] [get_ports PRDATA*]



## CAP LOAD
set cap_load 0.075
puts "\[INFO\]: Setting load to: $cap_load"
set_load $cap_load [all_outputs]

## MAX TRANS
set_max_transition 1 [current_design]

## DERATES
puts "\[INFO\]: Setting timing derate to: [expr {5 * 100}] %"
set_timing_derate -early 0.95
set_timing_derate -late 1.05

#Menna Oct30
# Maximum fanout
set_max_fanout $::env(MAX_FANOUT_CONSTRAINT) [current_design]
puts "\[INFO\]: Setting maximum fanout to: $::env(MAX_FANOUT_CONSTRAINT)"
