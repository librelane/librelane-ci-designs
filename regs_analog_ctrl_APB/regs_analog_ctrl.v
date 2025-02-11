// SPDX-FileCopyrightText: 2020 Efabless Corporation
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
// SPDX-License-Identifier: Apache-2.0

`timescale 			1ns/1ps
`default_nettype 	none

module regs_analog_ctrl (

    input clk,
    input rst_n,

    // Test points enable/disable connections
   input wire [1:0] bus_ibias_test_to_gpio1_2,
   input wire [1:0] bus_vbg_test_to_gpio1_1,

   // iDAC enable/disable connections
   input wire [1:0] bus_idac_to_gpio1_3,
   input wire [1:0] bus_idac_to_gpio1_2,

   // ADC and DAC reference voltage selection enable/disable connections
   input wire [1:0] bus_adc_refh_to_gpio6_6,
   input wire [1:0] bus_dac_refh_to_gpio1_1,
   input wire [1:0] bus_adc_refl_to_gpio6_7,
   input wire [1:0] bus_dac_refl_to_gpio1_0,

   // Right lp op-amp output wire wire enable/disable connections
   input wire [1:0] bus_right_lp_opamp_to_ulpcomp_p,
   input wire [1:0] bus_right_lp_opamp_to_comp_p,
   input wire [1:0] bus_right_lp_opamp_to_adc0,
   input wire [1:0] bus_right_lp_opamp_to_gpio4_7,
   input wire [1:0] bus_right_lp_opamp_to_gpio4_3,
   input wire [1:0] bus_right_lp_opamp_to_analog1,
   input wire [1:0] bus_right_lp_opamp_to_amuxbusB,
   input wire [1:0] bus_right_lp_opamp_to_gpio3_7,
   input wire [1:0] bus_right_lp_opamp_to_gpio3_3,

   // Right hgbw op-amp output wire wire enable/disable connections
   input wire [1:0] bus_right_hgbw_opamp_to_ulpcomp_n,
   input wire [1:0] bus_right_hgbw_opamp_to_comp_n,
   input wire [1:0] bus_right_hgbw_opamp_to_adc1,
   input wire [1:0] bus_right_hgbw_opamp_to_gpio4_6,
   input wire [1:0] bus_right_hgbw_opamp_to_gpio4_2,
   input wire [1:0] bus_right_hgbw_opamp_to_analog0,
   input wire [1:0] bus_right_hgbw_opamp_to_amuxbusA,
   input wire [1:0] bus_right_hgbw_opamp_to_gpio3_6,
   input wire [1:0] bus_right_hgbw_opamp_to_gpio3_2,

   // Left hgbw op-amp output wire wire enable/disable connections
   input wire [1:0] bus_left_hgbw_opamp_to_ulpcomp_p,
   input wire [1:0] bus_left_hgbw_opamp_to_comp_p,
   input wire [1:0] bus_left_hgbw_opamp_to_adc0,
   input wire [1:0] bus_left_hgbw_opamp_to_gpio4_5,
   input wire [1:0] bus_left_hgbw_opamp_to_gpio4_1,
   input wire [1:0] bus_left_hgbw_opamp_to_analog1,
   input wire [1:0] bus_left_hgbw_opamp_to_amuxbusB,
   input wire [1:0] bus_left_hgbw_opamp_to_gpio3_5,
   input wire [1:0] bus_left_hgbw_opamp_to_gpio3_1,

   // Left lp op-amp output wire wire enable/disable connections
   input wire [1:0] bus_left_lp_opamp_to_ulpcomp_n,
   input wire [1:0] bus_left_lp_opamp_to_comp_n,
   input wire [1:0] bus_left_lp_opamp_to_adc1,
   input wire [1:0] bus_left_lp_opamp_to_gpio4_0,
   input wire [1:0] bus_left_lp_opamp_to_analog0,
   input wire [1:0] bus_left_lp_opamp_to_amuxbusA,
   input wire [1:0] bus_left_lp_opamp_to_gpio3_4,

   // Right lp op-amp positive input wire enable/disable connections
   input wire bus_right_lp_opamp_p_to_dac0,
   input wire bus_right_lp_opamp_p_to_analog0,
   input wire bus_right_lp_opamp_p_to_amuxbusA,
   input wire bus_right_lp_opamp_p_to_rheostat_out,
   input wire bus_right_lp_opamp_p_to_sio0,
   input wire bus_right_lp_opamp_p_to_tempsense,
   input wire bus_right_lp_opamp_p_to_left_vref,
   input wire bus_right_lp_opamp_p_to_voutref,
   input wire [1:0] bus_right_lp_opamp_p_to_gpio2_5,

   // Right lp op-amp negative input wire enable/disable connections
   input wire bus_right_lp_opamp_n_to_dac1,
   input wire bus_right_lp_opamp_n_to_analog1,
   input wire bus_right_lp_opamp_n_to_amuxbusB,
   input wire bus_right_lp_opamp_n_to_rheostat_out,
   input wire bus_right_lp_opamp_n_to_rheostat_tap,
   input wire bus_right_lp_opamp_n_to_sio1,
   input wire bus_right_lp_opamp_n_to_vbgtc,
   input wire bus_right_lp_opamp_n_to_right_vref,
   input wire bus_right_lp_opamp_n_to_vinref,
   input wire [1:0] bus_right_lp_opamp_n_to_gpio2_4,

   // Right hgbw op-amp positive input wire enable/disable connections
   input wire [1:0] bus_right_hgbw_opamp_p_to_gpio5_0,
   input wire bus_right_hgbw_opamp_p_to_dac0,
   input wire bus_right_hgbw_opamp_p_to_analog0,
   input wire bus_right_hgbw_opamp_p_to_amuxbusA,
   input wire bus_right_hgbw_opamp_p_to_rheostat_out,
   input wire bus_right_hgbw_opamp_p_to_sio0,
   input wire bus_right_hgbw_opamp_p_to_left_vref,
   input wire bus_right_hgbw_opamp_p_to_voutref,
   input wire [1:0] bus_right_hgbw_opamp_p_to_gpio2_3,

   // Right hgbw op-amp negative input wire enable/disable connections
   input wire [1:0] bus_right_hgbw_opamp_n_to_gpio5_1,
   input wire bus_right_hgbw_opamp_n_to_dac1,
   input wire bus_right_hgbw_opamp_n_to_analog1,
   input wire bus_right_hgbw_opamp_n_to_amuxbusB,
   input wire bus_right_hgbw_opamp_n_to_rheostat_out,
   input wire bus_right_hgbw_opamp_n_to_rheostat_tap,
   input wire bus_right_hgbw_opamp_n_to_sio1,
   input wire bus_right_hgbw_opamp_n_to_vbgsc,
   input wire bus_right_hgbw_opamp_n_to_right_vref,
   input wire bus_right_hgbw_opamp_n_to_vinref,
   input wire [1:0] bus_right_hgbw_opamp_n_to_gpio2_2,

   // Left hgbw op-amp positive input wire enable/disable connections
   input wire [1:0] bus_left_hgbw_opamp_p_to_gpio5_2,
   input wire bus_left_hgbw_opamp_p_to_dac0,
   input wire bus_left_hgbw_opamp_p_to_analog0,
   input wire bus_left_hgbw_opamp_p_to_amuxbusA,
   input wire bus_left_hgbw_opamp_p_to_rheostat_out,
   input wire bus_left_hgbw_opamp_p_to_sio0,
   input wire bus_left_hgbw_opamp_p_to_tempsense,
   input wire bus_left_hgbw_opamp_p_to_left_vref,
   input wire bus_left_hgbw_opamp_p_to_voutref,
   input wire [1:0] bus_left_hgbw_opamp_p_to_gpio2_1,

   // Left hgbw op-amp negative input wire enable/disable connections
   input wire [1:0] bus_left_hgbw_opamp_n_to_gpio5_3,
   input wire bus_left_hgbw_opamp_n_to_dac1,
   input wire bus_left_hgbw_opamp_n_to_analog1,
   input wire bus_left_hgbw_opamp_n_to_amuxbusB,
   input wire bus_left_hgbw_opamp_n_to_rheostat_out,
   input wire bus_left_hgbw_opamp_n_to_rheostat_tap,
   input wire bus_left_hgbw_opamp_n_to_sio1,
   input wire bus_left_hgbw_opamp_n_to_vbgtc,
   input wire bus_left_hgbw_opamp_n_to_right_vref,
   input wire bus_left_hgbw_opamp_n_to_vinref,
   input wire [1:0] bus_left_hgbw_opamp_n_to_gpio2_0,

   // Left lp op-amp positive input wire enable/disable connections
   input wire [1:0] bus_left_lp_opamp_p_to_gpio5_4,
   input wire bus_left_lp_opamp_p_to_dac0,
   input wire bus_left_lp_opamp_p_to_analog0,
   input wire bus_left_lp_opamp_p_to_amuxbusA,
   input wire bus_left_lp_opamp_p_to_rheostat_out,
   input wire bus_left_lp_opamp_p_to_sio0,
   input wire bus_left_lp_opamp_p_to_left_vref,
   input wire bus_left_lp_opamp_p_to_voutref,

   // Left lp op-amp negative input wire enable/disable connections
   input wire [1:0] bus_left_lp_opamp_n_to_gpio5_5,
   input wire bus_left_lp_opamp_n_to_dac1,
   input wire bus_left_lp_opamp_n_to_analog1,
   input wire bus_left_lp_opamp_n_to_amuxbusB,
   input wire bus_left_lp_opamp_n_to_rheostat_out,
   input wire bus_left_lp_opamp_n_to_rheostat_tap,
   input wire bus_left_lp_opamp_n_to_sio1,
   input wire bus_left_lp_opamp_n_to_vbgsc,
   input wire bus_left_lp_opamp_n_to_right_vref,
   input wire bus_left_lp_opamp_n_to_vinref,

   // Left instrumentation amplifier output wire wire enable/disable connections
   input wire [1:0] bus_left_instramp_to_ulpcomp_p,
   input wire [1:0] bus_left_instramp_to_comp_p,
   input wire [1:0] bus_left_instramp_to_adc0,
   input wire [1:0] bus_left_instramp_to_gpio4_4,
   input wire [1:0] bus_left_instramp_to_analog1,
   input wire [1:0] bus_left_instramp_to_amuxbusB,

   // Right instrumentation amplifier output wire wire enable/disable connections
   input wire [1:0] bus_right_instramp_to_ulpcomp_n,
   input wire [1:0] bus_right_instramp_to_comp_n,
   input wire [1:0] bus_right_instramp_to_adc1,
   input wire [1:0] bus_right_instramp_to_analog0,
   input wire [1:0] bus_right_instramp_to_amuxbusA,
   input wire [1:0] bus_right_instramp_to_gpio3_0,

   // Left instrumentation amplifier negative input wire enable/disable connections
   input wire [1:0] bus_left_instramp_n_to_gpio5_7,
   input wire bus_left_instramp_n_to_analog1,
   input wire bus_left_instramp_n_to_amuxbusB,
   input wire bus_left_instramp_n_to_sio1,
   input wire bus_left_instramp_n_to_right_vref,
   input wire bus_left_instramp_n_to_vinref,

   // Left instrumentation amplifier positive input wire enable/disable connections
   input wire [1:0] bus_left_instramp_p_to_gpio5_6,
   input wire bus_left_instramp_p_to_analog0,
   input wire bus_left_instramp_p_to_amuxbusA,
   input wire bus_left_instramp_p_to_sio0,
   input wire bus_left_instramp_p_to_tempsense,
   input wire bus_left_instramp_p_to_left_vref,
   input wire bus_left_instramp_p_to_voutref,

   // Right instrumentation amplifier negative input wire enable/disable connections
   input wire bus_right_instramp_n_to_analog1,
   input wire bus_right_instramp_n_to_amuxbusB,
   input wire bus_right_instramp_n_to_sio1,
   input wire bus_right_instramp_n_to_right_vref,
   input wire bus_right_instramp_n_to_vinref,
   input wire [1:0] bus_right_instramp_n_to_gpio2_6,

   // Right instrumentation amplifier positive input wire enable/disable connections
   input wire bus_right_instramp_p_to_analog0,
   input wire bus_right_instramp_p_to_amuxbusA,
   input wire bus_right_instramp_p_to_sio0,
   input wire bus_right_instramp_p_to_tempsense,
   input wire bus_right_instramp_p_to_left_vref,
   input wire bus_right_instramp_p_to_voutref,
   input wire [1:0] bus_right_instramp_p_to_gpio2_7,

   // ULP comparator positive input wire enable/disable connections
   input wire bus_ulpcomp_p_to_dac0,
   input wire bus_ulpcomp_p_to_analog1,
   input wire bus_ulpcomp_p_to_sio0,
   input wire bus_ulpcomp_p_to_vbgtc,
   input wire bus_ulpcomp_p_to_tempsense,
   input wire bus_ulpcomp_p_to_left_vref,
   input wire bus_ulpcomp_p_to_voutref,
   input wire [1:0] bus_ulpcomp_p_to_gpio6_0,
   input wire [1:0] bus_ulpcomp_p_to_gpio1_7,

   // ULP comparator negative input wire enable/disable connections
   input wire bus_ulpcomp_n_to_dac1,
   input wire bus_ulpcomp_n_to_analog0,
   input wire bus_ulpcomp_n_to_sio1,
   input wire bus_ulpcomp_n_to_vbgsc,
   input wire bus_ulpcomp_n_to_right_vref,
   input wire bus_ulpcomp_n_to_vinref,
   input wire [1:0] bus_ulpcomp_n_to_gpio6_1,
   input wire [1:0] bus_ulpcomp_n_to_gpio1_6,

   // Comparator positive input wire enable/disable connections
   input wire bus_comp_p_to_dac0,
   input wire bus_comp_p_to_analog1,
   input wire bus_comp_p_to_sio0,
   input wire bus_comp_p_to_vbgtc,
   input wire bus_comp_p_to_tempsense,
   input wire bus_comp_p_to_left_vref,
   input wire bus_comp_p_to_voutref,
   input wire [1:0] bus_comp_p_to_gpio6_2,
   input wire [1:0] bus_comp_p_to_gpio1_5,

   // Comparator negative input wire enable/disable connections
   input wire bus_comp_n_to_dac1,
   input wire bus_comp_n_to_analog0,
   input wire bus_comp_n_to_sio1,
   input wire bus_comp_n_to_vbgsc,
   input wire bus_comp_n_to_right_vref,
   input wire bus_comp_n_to_vinref,
   input wire [1:0] bus_comp_n_to_gpio6_3,
   input wire [1:0] bus_comp_n_to_gpio1_4,

   // ADC0 input wire enable/disable connections
   input wire bus_adc0_to_dac0,
   input wire bus_adc0_to_analog1,
   input wire bus_adc0_to_vbgtc,
   input wire bus_adc0_to_tempsense,
   input wire bus_adc0_to_left_vref,
   input wire bus_adc0_to_voutref,
   input wire [1:0] bus_adc0_to_gpio6_4,
   input wire [1:0] bus_adc0_to_gpio1_3,

   // ADC1 input wire enable/disable connections
   input wire bus_adc1_to_dac1,
   input wire bus_adc1_to_analog0,
   input wire bus_adc1_to_vbgsc,
   input wire bus_adc1_to_right_vref,
   input wire bus_adc1_to_vinref,
   input wire [1:0] bus_adc1_to_gpio6_5,
   input wire [1:0] bus_adc1_to_gpio1_2,

   // SIO pin enable/disable connections
   input wire [1:0] bus_sio0_connect,
   input wire [1:0] bus_sio1_connect,

   // Analog pin enable/disable connections
   input wire [1:0] bus_analog0_connect,
   input wire [1:0] bus_analog1_connect,

   // User project enable/disable connections
   input wire bus_vbgtc_to_user,
   input wire bus_vbgsc_to_user,
   input wire [1:0] bus_user_to_comp_n,
   input wire [1:0] bus_user_to_comp_p,
   input wire [1:0] bus_user_to_ulpcomp_n,
   input wire [1:0] bus_user_to_ulpcomp_p,
   input wire [1:0] bus_user_to_adc0,
   input wire [1:0] bus_user_to_adc1,
   input wire bus_dac0_to_user,
   input wire bus_dac1_to_user,
   input wire bus_tempsense_to_user,
   input wire bus_right_vref_to_user,
   input wire bus_left_vref_to_user,
   input wire bus_vinref_to_user,
   input wire bus_voutref_to_user,

   input wire bus_dac0_to_analog1,
   input wire bus_dac1_to_analog0,
   input wire [2-1:0] bus_audiodac_out_to_analog1,
   input wire [2-1:0] bus_audiodac_outb_to_analog0,

   input	wire	[1-1:0]	bus_left_instramp_ena,
   input	wire	[5-1:0]	bus_left_instramp_G1,
   input	wire	[5-1:0]	bus_left_instramp_G2,
   input	wire	[1-1:0]	bus_left_hgbw_opamp_ena,
   input	wire	[1-1:0]	bus_left_lp_opamp_ena,
   input	wire	[8-1:0]	bus_left_rheostat1_b,
   input	wire	[8-1:0]	bus_left_rheostat2_b,
   input	wire	[1-1:0]	bus_right_instramp_ena,
   input	wire	[5-1:0]	bus_right_instramp_G1,
   input	wire	[5-1:0]	bus_right_instramp_G2,
   input	wire	[1-1:0]	bus_right_hgbw_opamp_ena,
   input	wire	[1-1:0]	bus_right_lp_opamp_ena,
   input	wire	[8-1:0]	bus_right_rheostat1_b,
   input	wire	[8-1:0]	bus_right_rheostat2_b,
   input	wire	[1-1:0]	bus_comp_ena,
   input	wire	[6-1:0]	bus_comp_trim,
   input	wire	[2-1:0]	bus_comp_hyst,
   input	wire	[1-1:0]	bus_ulpcomp_ena,
   input	wire	[1-1:0]	bus_ulpcomp_clk,
   input	wire	[1-1:0]	bus_bandgap_ena,
   input	wire	[16-1:0] bus_bandgap_trim,
   input	wire	[1-1:0]	bus_bandgap_sel,
   input	wire	[1-1:0]	bus_ldo_ena,
   input	wire	[1-1:0]	bus_overvoltage_ena,
   input	wire	[4-1:0]	bus_overvoltage_trim,
   input	wire	[1-1:0]	bus_ldo_ref_sel,
   input	wire	[1-1:0]	bus_ibias_ena,
   input	wire	[24-1:0]	bus_ibias_src_ena,
   input	wire	[4-1:0]	bus_ibias_snk_ena,
   input	wire	[1-1:0]	bus_ibias_ref_select,
   input	wire	[12-1:0]	bus_idac_value,
   input	wire	[1-1:0]	bus_idac_ena,
   input	wire	[1-1:0]	bus_tempsense_ena,
   input	wire	[1-1:0]	bus_tempsense_sel,
   input	wire	[1-1:0]	bus_rdac0_ena,
   input	wire	[12-1:0]	bus_rdac0_value,
   input	wire	[1-1:0]	bus_rdac1_ena,
   input	wire	[12-1:0]	bus_rdac1_value,

   input	wire	[1-1:0]	bus_brownout_ena,
   input	wire	[3-1:0]	bus_brownout_vtrip,
   input	wire	[3-1:0]	bus_brownout_otrip,
   input	wire	[1-1:0]	bus_brownout_isrc_sel,
   input	wire	[1-1:0]	bus_brownout_oneshot,
   input	wire	[1-1:0]	bus_brownout_rc_ena,
   input	wire	[1-1:0]	bus_brownout_rc_dis,

   output	wire	[1-1:0]	bus_brownout_vunder,
   output	wire	[1-1:0]	bus_brownout_timeout,
   output	wire	[1-1:0]	bus_brownout_filt,
   output	wire	[1-1:0]	bus_brownout_unfilt,

   output	wire	[1-1:0]	bus_comp_out,
   output	wire	[1-1:0]	bus_ulpcomp_out,
   output	wire	[1-1:0]	bus_overvoltage_out,
   output	wire	[1-1:0]	bus_vdda1_pwr_good,
   output	wire	[1-1:0]	bus_vccd1_pwr_good,
   output	wire	[1-1:0]	bus_vdda2_pwr_good,
   output	wire	[1-1:0]	bus_vccd2_pwr_good,

    // Test points enable/disable connections
   output wire [1:0] ibias_test_to_gpio1_2,
   output wire [1:0] vbg_test_to_gpio1_1,

   // iDAC enable/disable connections
   output wire [1:0] idac_to_gpio1_3,
   output wire [1:0] idac_to_gpio1_2,

   // ADC and DAC reference voltage selection enable/disable connections
   output wire [1:0] adc_refh_to_gpio6_6,
   output wire [1:0] dac_refh_to_gpio1_1,
   output wire [1:0] adc_refl_to_gpio6_7,
   output wire [1:0] dac_refl_to_gpio1_0,

   // Right lp op-amp output wire enable/disable connections
   output wire [1:0] right_lp_opamp_to_ulpcomp_p,
   output wire [1:0] right_lp_opamp_to_comp_p,
   output wire [1:0] right_lp_opamp_to_adc0,
   output wire [1:0] right_lp_opamp_to_gpio4_7,
   output wire [1:0] right_lp_opamp_to_gpio4_3,
   output wire [1:0] right_lp_opamp_to_analog1,
   output wire [1:0] right_lp_opamp_to_amuxbusB,
   output wire [1:0] right_lp_opamp_to_gpio3_7,
   output wire [1:0] right_lp_opamp_to_gpio3_3,

   // Right hgbw op-amp output wire enable/disable connections
   output wire [1:0] right_hgbw_opamp_to_ulpcomp_n,
   output wire [1:0] right_hgbw_opamp_to_comp_n,
   output wire [1:0] right_hgbw_opamp_to_adc1,
   output wire [1:0] right_hgbw_opamp_to_gpio4_6,
   output wire [1:0] right_hgbw_opamp_to_gpio4_2,
   output wire [1:0] right_hgbw_opamp_to_analog0,
   output wire [1:0] right_hgbw_opamp_to_amuxbusA,
   output wire [1:0] right_hgbw_opamp_to_gpio3_6,
   output wire [1:0] right_hgbw_opamp_to_gpio3_2,

   // Left hgbw op-amp output wire enable/disable connections
   output wire [1:0] left_hgbw_opamp_to_ulpcomp_p,
   output wire [1:0] left_hgbw_opamp_to_comp_p,
   output wire [1:0] left_hgbw_opamp_to_adc0,
   output wire [1:0] left_hgbw_opamp_to_gpio4_5,
   output wire [1:0] left_hgbw_opamp_to_gpio4_1,
   output wire [1:0] left_hgbw_opamp_to_analog1,
   output wire [1:0] left_hgbw_opamp_to_amuxbusB,
   output wire [1:0] left_hgbw_opamp_to_gpio3_5,
   output wire [1:0] left_hgbw_opamp_to_gpio3_1,

   // Left lp op-amp output wire enable/disable connections
   output wire [1:0] left_lp_opamp_to_ulpcomp_n,
   output wire [1:0] left_lp_opamp_to_comp_n,
   output wire [1:0] left_lp_opamp_to_adc1,
   output wire [1:0] left_lp_opamp_to_gpio4_0,
   output wire [1:0] left_lp_opamp_to_analog0,
   output wire [1:0] left_lp_opamp_to_amuxbusA,
   output wire [1:0] left_lp_opamp_to_gpio3_4,

   // Right lp op-amp positive output wire enable/disable connections
   output wire right_lp_opamp_p_to_dac0,
   output wire right_lp_opamp_p_to_analog0,
   output wire right_lp_opamp_p_to_amuxbusA,
   output wire right_lp_opamp_p_to_rheostat_out,
   output wire right_lp_opamp_p_to_sio0,
   output wire right_lp_opamp_p_to_tempsense,
   output wire right_lp_opamp_p_to_left_vref,
   output wire right_lp_opamp_p_to_voutref,
   output wire [1:0] right_lp_opamp_p_to_gpio2_5,

   // Right lp op-amp negative output wire enable/disable connections
   output wire right_lp_opamp_n_to_dac1,
   output wire right_lp_opamp_n_to_analog1,
   output wire right_lp_opamp_n_to_amuxbusB,
   output wire right_lp_opamp_n_to_rheostat_out,
   output wire right_lp_opamp_n_to_rheostat_tap,
   output wire right_lp_opamp_n_to_sio1,
   output wire right_lp_opamp_n_to_vbgtc,
   output wire right_lp_opamp_n_to_right_vref,
   output wire right_lp_opamp_n_to_vinref,
   output wire [1:0] right_lp_opamp_n_to_gpio2_4,

   // Right hgbw op-amp positive output wire enable/disable connections
   output wire [1:0] right_hgbw_opamp_p_to_gpio5_0,
   output wire right_hgbw_opamp_p_to_dac0,
   output wire right_hgbw_opamp_p_to_analog0,
   output wire right_hgbw_opamp_p_to_amuxbusA,
   output wire right_hgbw_opamp_p_to_rheostat_out,
   output wire right_hgbw_opamp_p_to_sio0,
   output wire right_hgbw_opamp_p_to_left_vref,
   output wire right_hgbw_opamp_p_to_voutref,
   output wire [1:0] right_hgbw_opamp_p_to_gpio2_3,

   // Right hgbw op-amp negative output wire enable/disable connections
   output wire [1:0] right_hgbw_opamp_n_to_gpio5_1,
   output wire right_hgbw_opamp_n_to_dac1,
   output wire right_hgbw_opamp_n_to_analog1,
   output wire right_hgbw_opamp_n_to_amuxbusB,
   output wire right_hgbw_opamp_n_to_rheostat_out,
   output wire right_hgbw_opamp_n_to_rheostat_tap,
   output wire right_hgbw_opamp_n_to_sio1,
   output wire right_hgbw_opamp_n_to_vbgsc,
   output wire right_hgbw_opamp_n_to_right_vref,
   output wire right_hgbw_opamp_n_to_vinref,
   output wire [1:0] right_hgbw_opamp_n_to_gpio2_2,

   // Left hgbw op-amp positive output wire enable/disable connections
   output wire [1:0] left_hgbw_opamp_p_to_gpio5_2,
   output wire left_hgbw_opamp_p_to_dac0,
   output wire left_hgbw_opamp_p_to_analog0,
   output wire left_hgbw_opamp_p_to_amuxbusA,
   output wire left_hgbw_opamp_p_to_rheostat_out,
   output wire left_hgbw_opamp_p_to_sio0,
   output wire left_hgbw_opamp_p_to_tempsense,
   output wire left_hgbw_opamp_p_to_left_vref,
   output wire left_hgbw_opamp_p_to_voutref,
   output wire [1:0] left_hgbw_opamp_p_to_gpio2_1,

   // Left hgbw op-amp negative output wire enable/disable connections
   output wire [1:0] left_hgbw_opamp_n_to_gpio5_3,
   output wire left_hgbw_opamp_n_to_dac1,
   output wire left_hgbw_opamp_n_to_analog1,
   output wire left_hgbw_opamp_n_to_amuxbusB,
   output wire left_hgbw_opamp_n_to_rheostat_out,
   output wire left_hgbw_opamp_n_to_rheostat_tap,
   output wire left_hgbw_opamp_n_to_sio1,
   output wire left_hgbw_opamp_n_to_vbgtc,
   output wire left_hgbw_opamp_n_to_right_vref,
   output wire left_hgbw_opamp_n_to_vinref,
   output wire [1:0] left_hgbw_opamp_n_to_gpio2_0,

   // Left lp op-amp positive output wire enable/disable connections
   output wire [1:0] left_lp_opamp_p_to_gpio5_4,
   output wire left_lp_opamp_p_to_dac0,
   output wire left_lp_opamp_p_to_analog0,
   output wire left_lp_opamp_p_to_amuxbusA,
   output wire left_lp_opamp_p_to_rheostat_out,
   output wire left_lp_opamp_p_to_sio0,
   output wire left_lp_opamp_p_to_left_vref,
   output wire left_lp_opamp_p_to_voutref,

   // Left lp op-amp negative output wire enable/disable connections
   output wire [1:0] left_lp_opamp_n_to_gpio5_5,
   output wire left_lp_opamp_n_to_dac1,
   output wire left_lp_opamp_n_to_analog1,
   output wire left_lp_opamp_n_to_amuxbusB,
   output wire left_lp_opamp_n_to_rheostat_out,
   output wire left_lp_opamp_n_to_rheostat_tap,
   output wire left_lp_opamp_n_to_sio1,
   output wire left_lp_opamp_n_to_vbgsc,
   output wire left_lp_opamp_n_to_right_vref,
   output wire left_lp_opamp_n_to_vinref,

   // Left instrumentation amplifier output wire enable/disable connections
   output wire [1:0] left_instramp_to_ulpcomp_p,
   output wire [1:0] left_instramp_to_comp_p,
   output wire [1:0] left_instramp_to_adc0,
   output wire [1:0] left_instramp_to_gpio4_4,
   output wire [1:0] left_instramp_to_analog1,
   output wire [1:0] left_instramp_to_amuxbusB,

   // Right instrumentation amplifier output wire enable/disable connections
   output wire [1:0] right_instramp_to_ulpcomp_n,
   output wire [1:0] right_instramp_to_comp_n,
   output wire [1:0] right_instramp_to_adc1,
   output wire [1:0] right_instramp_to_analog0,
   output wire [1:0] right_instramp_to_amuxbusA,
   output wire [1:0] right_instramp_to_gpio3_0,

   // Left instrumentation amplifier negative output wire enable/disable connections
   output wire [1:0] left_instramp_n_to_gpio5_7,
   output wire left_instramp_n_to_analog1,
   output wire left_instramp_n_to_amuxbusB,
   output wire left_instramp_n_to_sio1,
   output wire left_instramp_n_to_right_vref,
   output wire left_instramp_n_to_vinref,

   // Left instrumentation amplifier positive output wire enable/disable connections
   output wire [1:0] left_instramp_p_to_gpio5_6,
   output wire left_instramp_p_to_analog0,
   output wire left_instramp_p_to_amuxbusA,
   output wire left_instramp_p_to_sio0,
   output wire left_instramp_p_to_tempsense,
   output wire left_instramp_p_to_left_vref,
   output wire left_instramp_p_to_voutref,

   // Right instrumentation amplifier negative output wire enable/disable connections
   output wire right_instramp_n_to_analog1,
   output wire right_instramp_n_to_amuxbusB,
   output wire right_instramp_n_to_sio1,
   output wire right_instramp_n_to_right_vref,
   output wire right_instramp_n_to_vinref,
   output wire [1:0] right_instramp_n_to_gpio2_6,

   // Right instrumentation amplifier positive output wire enable/disable connections
   output wire right_instramp_p_to_analog0,
   output wire right_instramp_p_to_amuxbusA,
   output wire right_instramp_p_to_sio0,
   output wire right_instramp_p_to_tempsense,
   output wire right_instramp_p_to_left_vref,
   output wire right_instramp_p_to_voutref,
   output wire [1:0] right_instramp_p_to_gpio2_7,

   // ULP comparator positive output wire enable/disable connections
   output wire ulpcomp_p_to_dac0,
   output wire ulpcomp_p_to_analog1,
   output wire ulpcomp_p_to_sio0,
   output wire ulpcomp_p_to_vbgtc,
   output wire ulpcomp_p_to_tempsense,
   output wire ulpcomp_p_to_left_vref,
   output wire ulpcomp_p_to_voutref,
   output wire [1:0] ulpcomp_p_to_gpio6_0,
   output wire [1:0] ulpcomp_p_to_gpio1_7,

   // ULP comparator negative output wire enable/disable connections
   output wire ulpcomp_n_to_dac1,
   output wire ulpcomp_n_to_analog0,
   output wire ulpcomp_n_to_sio1,
   output wire ulpcomp_n_to_vbgsc,
   output wire ulpcomp_n_to_right_vref,
   output wire ulpcomp_n_to_vinref,
   output wire [1:0] ulpcomp_n_to_gpio6_1,
   output wire [1:0] ulpcomp_n_to_gpio1_6,

   // Comparator positive output wire enable/disable connections
   output wire comp_p_to_dac0,
   output wire comp_p_to_analog1,
   output wire comp_p_to_sio0,
   output wire comp_p_to_vbgtc,
   output wire comp_p_to_tempsense,
   output wire comp_p_to_left_vref,
   output wire comp_p_to_voutref,
   output wire [1:0] comp_p_to_gpio6_2,
   output wire [1:0] comp_p_to_gpio1_5,

   // Comparator negative output wire enable/disable connections
   output wire comp_n_to_dac1,
   output wire comp_n_to_analog0,
   output wire comp_n_to_sio1,
   output wire comp_n_to_vbgsc,
   output wire comp_n_to_right_vref,
   output wire comp_n_to_vinref,
   output wire [1:0] comp_n_to_gpio6_3,
   output wire [1:0] comp_n_to_gpio1_4,

   // ADC0 output wire enable/disable connections
   output wire adc0_to_dac0,
   output wire adc0_to_analog1,
   output wire adc0_to_vbgtc,
   output wire adc0_to_tempsense,
   output wire adc0_to_left_vref,
   output wire adc0_to_voutref,
   output wire [1:0] adc0_to_gpio6_4,
   output wire [1:0] adc0_to_gpio1_3,

   // ADC1 output wire enable/disable connections
   output wire adc1_to_dac1,
   output wire adc1_to_analog0,
   output wire adc1_to_vbgsc,
   output wire adc1_to_right_vref,
   output wire adc1_to_vinref,
   output wire [1:0] adc1_to_gpio6_5,
   output wire [1:0] adc1_to_gpio1_2,

   // SIO pin enable/disable connections
   output wire [1:0] sio0_connect,
   output wire [1:0] sio1_connect,

   // Analog pin enable/disable connections
   output wire [1:0] analog0_connect,
   output wire [1:0] analog1_connect,

   // User project enable/disable connections
   output wire vbgtc_to_user,
   output wire vbgsc_to_user,
   output wire [1:0] user_to_comp_n,
   output wire [1:0] user_to_comp_p,
   output wire [1:0] user_to_ulpcomp_n,
   output wire [1:0] user_to_ulpcomp_p,
   output wire [1:0] user_to_adc0,
   output wire [1:0] user_to_adc1,
   output wire dac0_to_user,
   output wire dac1_to_user,
   output wire tempsense_to_user,
   output wire right_vref_to_user,
   output wire left_vref_to_user,
   output wire vinref_to_user,
   output wire voutref_to_user,

   // Audiodac output connections
   output wire dac0_to_analog1,
   output wire dac1_to_analog0,
   output wire [1:0] audiodac_out_to_analog1,
   output wire [1:0] audiodac_outb_to_analog0,

  // Instrumentation amplifier (TBD)
   output wire left_instramp_ena,
   output wire [4:0] left_instramp_G1,	// programmable gain
   output wire [4:0] left_instramp_G2,	// programmable gain

   // High gain-bandwidth operational amplifier
   output wire left_hgbw_opamp_ena,

   // Low power operational amplifier (TBD)
   output wire left_lp_opamp_ena,

   // Rheostat 1
   output wire [7:0] left_rheostat1_b,	// programmable tap

   // Rheostat 2
   output wire [7:0] left_rheostat2_b,	// programmable tap

   // Amplifiers right
   // Instrumentation amplifier (TBD)
   output wire right_instramp_ena,
   output wire [4:0] right_instramp_G1,	// programmable gain
   output wire [4:0] right_instramp_G2,	// programmable gain

   // High gain-bandwidth operational amplifier
   output wire right_hgbw_opamp_ena,

   // Low power operational amplifier (TBD)
   output wire right_lp_opamp_ena,

   // Rheostat 1
   output wire [7:0] right_rheostat1_b,	// programmable tap

   // Rheostat 2
   output wire [7:0] right_rheostat2_b,	// programmable tap

   // Comparator
   output wire  comp_ena,
   output wire [5:0] comp_trim,	// offset trim
   output wire [1:0] comp_hyst,	// hysteresis trim
   input wire      comp_out,	// comparator output wire
   
   // Ultra-low-power comparator
   output wire  ulpcomp_ena,
   output wire ulpcomp_clk,
   input wire  ulpcomp_out,		// comparator output wire

   // Bandgap
   output wire  bandgap_ena,
   output wire [15:0] bandgap_trim,		// bandgap trim
   output wire bandgap_sel,

   // LDO
   output wire  ldo_ena,

   // Bias current generator
   output wire	ibias_ena,		// bias generator master enable
   output wire [23:0] ibias_src_ena,		// bias generator individual source enables
   output wire [3:0]	ibias_snk_ena,		// bias generator individual sink enables
   output wire	ibias_ref_select,	// bias reference voltage selection

   // Overvoltage detector
   output wire overvoltage_ena,
   output wire [3:0] overvoltage_trim,	// overvoltage trip point set
   output wire	ldo_ref_sel,
   input wire overvoltage_out,		// overvoltage alarm

    // 12-bit Current DAC (TBD)
   output wire [11:0] idac_value,
   output wire  idac_ena,

   // Temperature sensor
   output wire tempsense_ena,
   output wire tempsense_sel,

   // Voltage detector 0
   input wire vdda1_pwr_good,		// power good signal
   input wire vccd1_pwr_good,		// power good signal

   // Voltage detector 1
   input wire vdda2_pwr_good,		// power good signal
   input wire vccd2_pwr_good,		// power good signal

   // 12-bit RDAC 0
   output wire rdac0_ena,
   output wire [11:0] rdac0_value,

   // 12-bit RDAC 1
   output wire rdac1_ena,
   output wire [11:0] rdac1_value,

   // Brownout detector
   output brownout_ena,		// brownout detector enable
   output [2:0] brownout_vtrip,	// brownout detector trip point
   output [2:0] brownout_otrip,	// brownout detector trip point
   output brownout_isrc_sel,	// brownout detector select current bias
   output brownout_oneshot,	// brownout detector force short one-shot
   output brownout_rc_ena,	// brownout detector force oscillator enabled
   output brownout_rc_dis,	// brownout detector force oscillator disabled

   input brownout_vunder,	// brownout detector undervoltage alarm
   input brownout_timeout,	// brownout detector timeout
   input brownout_filt,	// brownout detector undervoltage (filtered)
   input brownout_unfilt	// brownout detector undervoltage (unfiltered)

);
 
assign ibias_test_to_gpio1_2 =  bus_ibias_test_to_gpio1_2; 
assign vbg_test_to_gpio1_1 =  bus_vbg_test_to_gpio1_1; 
assign idac_to_gpio1_3 =  bus_idac_to_gpio1_3; 
assign idac_to_gpio1_2 =  bus_idac_to_gpio1_2; 
assign adc_refh_to_gpio6_6 =  bus_adc_refh_to_gpio6_6; 
assign dac_refh_to_gpio1_1 =  bus_dac_refh_to_gpio1_1; 
assign adc_refl_to_gpio6_7 =  bus_adc_refl_to_gpio6_7; 
assign dac_refl_to_gpio1_0 =  bus_dac_refl_to_gpio1_0; 
assign right_lp_opamp_to_ulpcomp_p =  bus_right_lp_opamp_to_ulpcomp_p; 
assign right_lp_opamp_to_comp_p =  bus_right_lp_opamp_to_comp_p; 
assign right_lp_opamp_to_adc0 =  bus_right_lp_opamp_to_adc0; 
assign right_lp_opamp_to_gpio4_7 =  bus_right_lp_opamp_to_gpio4_7; 
assign right_lp_opamp_to_gpio4_3 =  bus_right_lp_opamp_to_gpio4_3; 
assign right_lp_opamp_to_analog1 =  bus_right_lp_opamp_to_analog1; 
assign right_lp_opamp_to_amuxbusB =  bus_right_lp_opamp_to_amuxbusB; 
assign right_lp_opamp_to_gpio3_7 =  bus_right_lp_opamp_to_gpio3_7; 
assign right_lp_opamp_to_gpio3_3 =  bus_right_lp_opamp_to_gpio3_3; 
assign right_hgbw_opamp_to_ulpcomp_n =  bus_right_hgbw_opamp_to_ulpcomp_n; 
assign right_hgbw_opamp_to_comp_n =  bus_right_hgbw_opamp_to_comp_n; 
assign right_hgbw_opamp_to_adc1 =  bus_right_hgbw_opamp_to_adc1; 
assign right_hgbw_opamp_to_gpio4_6 =  bus_right_hgbw_opamp_to_gpio4_6; 
assign right_hgbw_opamp_to_gpio4_2 =  bus_right_hgbw_opamp_to_gpio4_2; 
assign right_hgbw_opamp_to_analog0 =  bus_right_hgbw_opamp_to_analog0; 
assign right_hgbw_opamp_to_amuxbusA =  bus_right_hgbw_opamp_to_amuxbusA; 
assign right_hgbw_opamp_to_gpio3_6 =  bus_right_hgbw_opamp_to_gpio3_6; 
assign right_hgbw_opamp_to_gpio3_2 =  bus_right_hgbw_opamp_to_gpio3_2; 
assign left_hgbw_opamp_to_ulpcomp_p =   bus_left_hgbw_opamp_to_ulpcomp_p;
assign left_hgbw_opamp_to_comp_p =   bus_left_hgbw_opamp_to_comp_p;
assign left_hgbw_opamp_to_adc0 =   bus_left_hgbw_opamp_to_adc0;
assign left_hgbw_opamp_to_gpio4_5 =   bus_left_hgbw_opamp_to_gpio4_5;
assign left_hgbw_opamp_to_gpio4_1 =   bus_left_hgbw_opamp_to_gpio4_1;
assign left_hgbw_opamp_to_analog1 =   bus_left_hgbw_opamp_to_analog1;
assign left_hgbw_opamp_to_amuxbusB =   bus_left_hgbw_opamp_to_amuxbusB;
assign left_hgbw_opamp_to_gpio3_5 =   bus_left_hgbw_opamp_to_gpio3_5;
assign left_hgbw_opamp_to_gpio3_1 =   bus_left_hgbw_opamp_to_gpio3_1;
assign left_lp_opamp_to_ulpcomp_n =  bus_left_lp_opamp_to_ulpcomp_n; 
assign left_lp_opamp_to_comp_n =  bus_left_lp_opamp_to_comp_n; 
assign left_lp_opamp_to_adc1 =  bus_left_lp_opamp_to_adc1; 
assign left_lp_opamp_to_gpio4_0 =  bus_left_lp_opamp_to_gpio4_0; 
assign left_lp_opamp_to_analog0 =  bus_left_lp_opamp_to_analog0; 
assign left_lp_opamp_to_amuxbusA =  bus_left_lp_opamp_to_amuxbusA; 
assign left_lp_opamp_to_gpio3_4 =  bus_left_lp_opamp_to_gpio3_4; 
assign right_lp_opamp_p_to_dac0 =  bus_right_lp_opamp_p_to_dac0; 
assign right_lp_opamp_p_to_analog0 =  bus_right_lp_opamp_p_to_analog0; 
assign right_lp_opamp_p_to_amuxbusA =  bus_right_lp_opamp_p_to_amuxbusA; 
assign right_lp_opamp_p_to_rheostat_out =  bus_right_lp_opamp_p_to_rheostat_out; 
assign right_lp_opamp_p_to_sio0 =  bus_right_lp_opamp_p_to_sio0; 
assign right_lp_opamp_p_to_tempsense =  bus_right_lp_opamp_p_to_tempsense; 
assign right_lp_opamp_p_to_left_vref =  bus_right_lp_opamp_p_to_left_vref; 
assign right_lp_opamp_p_to_voutref =  bus_right_lp_opamp_p_to_voutref; 
assign right_lp_opamp_p_to_gpio2_5 =  bus_right_lp_opamp_p_to_gpio2_5; 
assign right_lp_opamp_n_to_dac1 =  bus_right_lp_opamp_n_to_dac1; 
assign right_lp_opamp_n_to_analog1 =  bus_right_lp_opamp_n_to_analog1; 
assign right_lp_opamp_n_to_amuxbusB =  bus_right_lp_opamp_n_to_amuxbusB; 
assign right_lp_opamp_n_to_rheostat_out =  bus_right_lp_opamp_n_to_rheostat_out; 
assign right_lp_opamp_n_to_rheostat_tap =  bus_right_lp_opamp_n_to_rheostat_tap; 
assign right_lp_opamp_n_to_sio1 =  bus_right_lp_opamp_n_to_sio1; 
assign right_lp_opamp_n_to_vbgtc =  bus_right_lp_opamp_n_to_vbgtc; 
assign right_lp_opamp_n_to_right_vref =  bus_right_lp_opamp_n_to_right_vref; 
assign right_lp_opamp_n_to_vinref =  bus_right_lp_opamp_n_to_vinref; 
assign right_lp_opamp_n_to_gpio2_4 =  bus_right_lp_opamp_n_to_gpio2_4; 
assign right_hgbw_opamp_p_to_gpio5_0 =  bus_right_hgbw_opamp_p_to_gpio5_0; 
assign right_hgbw_opamp_p_to_dac0 =  bus_right_hgbw_opamp_p_to_dac0; 
assign right_hgbw_opamp_p_to_analog0 =  bus_right_hgbw_opamp_p_to_analog0; 
assign right_hgbw_opamp_p_to_amuxbusA =  bus_right_hgbw_opamp_p_to_amuxbusA; 
assign right_hgbw_opamp_p_to_rheostat_out =  bus_right_hgbw_opamp_p_to_rheostat_out; 
assign right_hgbw_opamp_p_to_sio0 =  bus_right_hgbw_opamp_p_to_sio0; 
assign right_hgbw_opamp_p_to_left_vref =  bus_right_hgbw_opamp_p_to_left_vref; 
assign right_hgbw_opamp_p_to_voutref =  bus_right_hgbw_opamp_p_to_voutref; 
assign right_hgbw_opamp_p_to_gpio2_3 =  bus_right_hgbw_opamp_p_to_gpio2_3; 
assign right_hgbw_opamp_n_to_gpio5_1 =  bus_right_hgbw_opamp_n_to_gpio5_1; 
assign right_hgbw_opamp_n_to_dac1 =  bus_right_hgbw_opamp_n_to_dac1; 
assign right_hgbw_opamp_n_to_analog1 =  bus_right_hgbw_opamp_n_to_analog1; 
assign right_hgbw_opamp_n_to_amuxbusB =  bus_right_hgbw_opamp_n_to_amuxbusB; 
assign right_hgbw_opamp_n_to_rheostat_out =  bus_right_hgbw_opamp_n_to_rheostat_out; 
assign right_hgbw_opamp_n_to_rheostat_tap =  bus_right_hgbw_opamp_n_to_rheostat_tap; 
assign right_hgbw_opamp_n_to_sio1 =  bus_right_hgbw_opamp_n_to_sio1; 
assign right_hgbw_opamp_n_to_vbgsc =  bus_right_hgbw_opamp_n_to_vbgsc; 
assign right_hgbw_opamp_n_to_right_vref =  bus_right_hgbw_opamp_n_to_right_vref; 
assign right_hgbw_opamp_n_to_vinref =  bus_right_hgbw_opamp_n_to_vinref; 
assign right_hgbw_opamp_n_to_gpio2_2 =  bus_right_hgbw_opamp_n_to_gpio2_2; 
assign left_hgbw_opamp_p_to_gpio5_2 =   bus_left_hgbw_opamp_p_to_gpio5_2;
assign left_hgbw_opamp_p_to_dac0 =   bus_left_hgbw_opamp_p_to_dac0;
assign left_hgbw_opamp_p_to_analog0 =   bus_left_hgbw_opamp_p_to_analog0;
assign left_hgbw_opamp_p_to_amuxbusA =   bus_left_hgbw_opamp_p_to_amuxbusA;
assign left_hgbw_opamp_p_to_rheostat_out =   bus_left_hgbw_opamp_p_to_rheostat_out;
assign left_hgbw_opamp_p_to_sio0 =   bus_left_hgbw_opamp_p_to_sio0;
assign left_hgbw_opamp_p_to_tempsense =   bus_left_hgbw_opamp_p_to_tempsense;
assign left_hgbw_opamp_p_to_left_vref =   bus_left_hgbw_opamp_p_to_left_vref;
assign left_hgbw_opamp_p_to_voutref =   bus_left_hgbw_opamp_p_to_voutref;
assign left_hgbw_opamp_p_to_gpio2_1 =   bus_left_hgbw_opamp_p_to_gpio2_1;
assign left_hgbw_opamp_n_to_gpio5_3 =   bus_left_hgbw_opamp_n_to_gpio5_3;
assign left_hgbw_opamp_n_to_dac1 =   bus_left_hgbw_opamp_n_to_dac1;
assign left_hgbw_opamp_n_to_analog1 =   bus_left_hgbw_opamp_n_to_analog1;
assign left_hgbw_opamp_n_to_amuxbusB =   bus_left_hgbw_opamp_n_to_amuxbusB;
assign left_hgbw_opamp_n_to_rheostat_out =   bus_left_hgbw_opamp_n_to_rheostat_out;
assign left_hgbw_opamp_n_to_rheostat_tap =   bus_left_hgbw_opamp_n_to_rheostat_tap;
assign left_hgbw_opamp_n_to_sio1 =   bus_left_hgbw_opamp_n_to_sio1;
assign left_hgbw_opamp_n_to_vbgtc =   bus_left_hgbw_opamp_n_to_vbgtc;
assign left_hgbw_opamp_n_to_right_vref =   bus_left_hgbw_opamp_n_to_right_vref;
assign left_hgbw_opamp_n_to_vinref =   bus_left_hgbw_opamp_n_to_vinref;
assign left_hgbw_opamp_n_to_gpio2_0 =   bus_left_hgbw_opamp_n_to_gpio2_0;
assign left_lp_opamp_p_to_gpio5_4 =  bus_left_lp_opamp_p_to_gpio5_4; 
assign left_lp_opamp_p_to_dac0 =  bus_left_lp_opamp_p_to_dac0; 
assign left_lp_opamp_p_to_analog0 =  bus_left_lp_opamp_p_to_analog0; 
assign left_lp_opamp_p_to_amuxbusA =  bus_left_lp_opamp_p_to_amuxbusA; 
assign left_lp_opamp_p_to_rheostat_out =  bus_left_lp_opamp_p_to_rheostat_out; 
assign left_lp_opamp_p_to_sio0 =  bus_left_lp_opamp_p_to_sio0; 
assign left_lp_opamp_p_to_left_vref =  bus_left_lp_opamp_p_to_left_vref; 
assign left_lp_opamp_p_to_voutref =  bus_left_lp_opamp_p_to_voutref; 
assign left_lp_opamp_n_to_gpio5_5 =  bus_left_lp_opamp_n_to_gpio5_5; 
assign left_lp_opamp_n_to_dac1 =  bus_left_lp_opamp_n_to_dac1; 
assign left_lp_opamp_n_to_analog1 =  bus_left_lp_opamp_n_to_analog1; 
assign left_lp_opamp_n_to_amuxbusB =  bus_left_lp_opamp_n_to_amuxbusB; 
assign left_lp_opamp_n_to_rheostat_out =  bus_left_lp_opamp_n_to_rheostat_out; 
assign left_lp_opamp_n_to_rheostat_tap =  bus_left_lp_opamp_n_to_rheostat_tap; 
assign left_lp_opamp_n_to_sio1 =  bus_left_lp_opamp_n_to_sio1; 
assign left_lp_opamp_n_to_vbgsc =  bus_left_lp_opamp_n_to_vbgsc; 
assign left_lp_opamp_n_to_right_vref =  bus_left_lp_opamp_n_to_right_vref; 
assign left_lp_opamp_n_to_vinref =  bus_left_lp_opamp_n_to_vinref; 
assign left_instramp_to_ulpcomp_p =  bus_left_instramp_to_ulpcomp_p; 
assign left_instramp_to_comp_p =  bus_left_instramp_to_comp_p; 
assign left_instramp_to_adc0 =  bus_left_instramp_to_adc0; 
assign left_instramp_to_gpio4_4 =  bus_left_instramp_to_gpio4_4; 
assign left_instramp_to_analog1 =  bus_left_instramp_to_analog1; 
assign left_instramp_to_amuxbusB =  bus_left_instramp_to_amuxbusB; 
assign right_instramp_to_ulpcomp_n =  bus_right_instramp_to_ulpcomp_n; 
assign right_instramp_to_comp_n =  bus_right_instramp_to_comp_n; 
assign right_instramp_to_adc1 =  bus_right_instramp_to_adc1; 
assign right_instramp_to_analog0 =  bus_right_instramp_to_analog0; 
assign right_instramp_to_amuxbusA =  bus_right_instramp_to_amuxbusA; 
assign right_instramp_to_gpio3_0 =  bus_right_instramp_to_gpio3_0; 
assign left_instramp_n_to_gpio5_7 =  bus_left_instramp_n_to_gpio5_7; 
assign left_instramp_n_to_analog1 =  bus_left_instramp_n_to_analog1; 
assign left_instramp_n_to_amuxbusB =  bus_left_instramp_n_to_amuxbusB; 
assign left_instramp_n_to_sio1 =  bus_left_instramp_n_to_sio1; 
assign left_instramp_n_to_right_vref =  bus_left_instramp_n_to_right_vref; 
assign left_instramp_n_to_vinref =  bus_left_instramp_n_to_vinref; 
assign left_instramp_p_to_gpio5_6 =  bus_left_instramp_p_to_gpio5_6; 
assign left_instramp_p_to_analog0 =  bus_left_instramp_p_to_analog0; 
assign left_instramp_p_to_amuxbusA =  bus_left_instramp_p_to_amuxbusA; 
assign left_instramp_p_to_sio0 =  bus_left_instramp_p_to_sio0; 
assign left_instramp_p_to_tempsense =  bus_left_instramp_p_to_tempsense; 
assign left_instramp_p_to_left_vref =  bus_left_instramp_p_to_left_vref; 
assign left_instramp_p_to_voutref =  bus_left_instramp_p_to_voutref; 
assign right_instramp_n_to_analog1 =  bus_right_instramp_n_to_analog1; 
assign right_instramp_n_to_amuxbusB =  bus_right_instramp_n_to_amuxbusB; 
assign right_instramp_n_to_sio1 =  bus_right_instramp_n_to_sio1; 
assign right_instramp_n_to_right_vref =  bus_right_instramp_n_to_right_vref; 
assign right_instramp_n_to_vinref =  bus_right_instramp_n_to_vinref; 
assign right_instramp_n_to_gpio2_6 =  bus_right_instramp_n_to_gpio2_6; 
assign right_instramp_p_to_analog0 =  bus_right_instramp_p_to_analog0; 
assign right_instramp_p_to_amuxbusA =  bus_right_instramp_p_to_amuxbusA; 
assign right_instramp_p_to_sio0 =  bus_right_instramp_p_to_sio0;
assign right_instramp_p_to_tempsense =  bus_right_instramp_p_to_tempsense; 
assign right_instramp_p_to_left_vref =  bus_right_instramp_p_to_left_vref; 
assign right_instramp_p_to_voutref =  bus_right_instramp_p_to_voutref; 
assign right_instramp_p_to_gpio2_7 =  bus_right_instramp_p_to_gpio2_7; 
assign ulpcomp_p_to_dac0 =   bus_ulpcomp_p_to_dac0;
assign ulpcomp_p_to_analog1 =   bus_ulpcomp_p_to_analog1;
assign ulpcomp_p_to_sio0 =   bus_ulpcomp_p_to_sio0;
assign ulpcomp_p_to_vbgtc =   bus_ulpcomp_p_to_vbgtc;
assign ulpcomp_p_to_tempsense =   bus_ulpcomp_p_to_tempsense;
assign ulpcomp_p_to_left_vref =   bus_ulpcomp_p_to_left_vref;
assign ulpcomp_p_to_voutref =   bus_ulpcomp_p_to_voutref;
assign ulpcomp_p_to_gpio6_0 =   bus_ulpcomp_p_to_gpio6_0;
assign ulpcomp_p_to_gpio1_7 =   bus_ulpcomp_p_to_gpio1_7;
assign ulpcomp_n_to_dac1 =   bus_ulpcomp_n_to_dac1;
assign ulpcomp_n_to_analog0 =   bus_ulpcomp_n_to_analog0;
assign ulpcomp_n_to_sio1 =   bus_ulpcomp_n_to_sio1;
assign ulpcomp_n_to_vbgsc =   bus_ulpcomp_n_to_vbgsc;
assign ulpcomp_n_to_right_vref =   bus_ulpcomp_n_to_right_vref;
assign ulpcomp_n_to_vinref =   bus_ulpcomp_n_to_vinref;
assign ulpcomp_n_to_gpio6_1 =   bus_ulpcomp_n_to_gpio6_1;
assign ulpcomp_n_to_gpio1_6 =   bus_ulpcomp_n_to_gpio1_6;
assign comp_p_to_dac0 =   bus_comp_p_to_dac0;
assign comp_p_to_analog1 =   bus_comp_p_to_analog1;
assign comp_p_to_sio0 =   bus_comp_p_to_sio0;
assign comp_p_to_vbgtc =   bus_comp_p_to_vbgtc;
assign comp_p_to_tempsense =   bus_comp_p_to_tempsense;
assign comp_p_to_left_vref =   bus_comp_p_to_left_vref;
assign comp_p_to_voutref =   bus_comp_p_to_voutref;
assign comp_p_to_gpio6_2 =   bus_comp_p_to_gpio6_2;
assign comp_p_to_gpio1_5 =   bus_comp_p_to_gpio1_5;
assign comp_n_to_dac1 =   bus_comp_n_to_dac1;
assign comp_n_to_analog0 =   bus_comp_n_to_analog0;
assign comp_n_to_sio1 =   bus_comp_n_to_sio1;
assign comp_n_to_vbgsc =   bus_comp_n_to_vbgsc;
assign comp_n_to_right_vref =   bus_comp_n_to_right_vref;
assign comp_n_to_vinref =   bus_comp_n_to_vinref;
assign comp_n_to_gpio6_3 =   bus_comp_n_to_gpio6_3;
assign comp_n_to_gpio1_4 =   bus_comp_n_to_gpio1_4;
assign adc0_to_dac0 =  bus_adc0_to_dac0; 
assign adc0_to_analog1 =  bus_adc0_to_analog1; 
assign adc0_to_vbgtc =  bus_adc0_to_vbgtc; 
assign adc0_to_tempsense =  bus_adc0_to_tempsense; 
assign adc0_to_left_vref =  bus_adc0_to_left_vref; 
assign adc0_to_voutref =  bus_adc0_to_voutref; 
assign adc0_to_gpio6_4 =  bus_adc0_to_gpio6_4; 
assign adc0_to_gpio1_3 =  bus_adc0_to_gpio1_3; 
assign adc1_to_dac1 =  bus_adc1_to_dac1; 
assign adc1_to_analog0 =  bus_adc1_to_analog0; 
assign adc1_to_vbgsc =  bus_adc1_to_vbgsc; 
assign adc1_to_right_vref =  bus_adc1_to_right_vref; 
assign adc1_to_vinref =  bus_adc1_to_vinref; 
assign adc1_to_gpio6_5 =  bus_adc1_to_gpio6_5; 
assign adc1_to_gpio1_2 =  bus_adc1_to_gpio1_2; 
assign sio0_connect =  bus_sio0_connect; 
assign sio1_connect =  bus_sio1_connect; 
assign analog0_connect =  bus_analog0_connect; 
assign analog1_connect =  bus_analog1_connect; 
assign vbgtc_to_user =  bus_vbgtc_to_user; 
assign vbgsc_to_user =  bus_vbgsc_to_user; 
assign user_to_comp_n =  bus_user_to_comp_n; 
assign user_to_comp_p =  bus_user_to_comp_p; 
assign user_to_ulpcomp_n =  bus_user_to_ulpcomp_n; 
assign user_to_ulpcomp_p =  bus_user_to_ulpcomp_p; 
assign user_to_adc0 =  bus_user_to_adc0; 
assign user_to_adc1 =  bus_user_to_adc1; 
assign dac0_to_user =  bus_dac0_to_user; 
assign dac1_to_user =  bus_dac1_to_user; 
assign tempsense_to_user =   bus_tempsense_to_user;
assign right_vref_to_user =  bus_right_vref_to_user; 
assign left_vref_to_user =   bus_left_vref_to_user;
assign vinref_to_user =   bus_vinref_to_user;
assign voutref_to_user =  bus_voutref_to_user;  
assign dac0_to_analog1 = bus_dac0_to_analog1;
assign dac1_to_analog0 =  bus_dac1_to_analog0;
assign audiodac_out_to_analog1 = bus_audiodac_out_to_analog1;
assign audiodac_outb_to_analog0 =  bus_audiodac_outb_to_analog0;

assign left_instramp_ena  = bus_left_instramp_ena;
assign left_instramp_G1  = bus_left_instramp_G1;
assign left_instramp_G2  = bus_left_instramp_G2;
assign left_hgbw_opamp_ena  = bus_left_hgbw_opamp_ena;
assign left_lp_opamp_ena  = bus_left_lp_opamp_ena;
assign left_rheostat1_b  = bus_left_rheostat1_b;
assign left_rheostat2_b  = bus_left_rheostat2_b;
assign right_instramp_ena = bus_right_instramp_ena;
assign right_instramp_G1 = bus_right_instramp_G1;
assign right_instramp_G2 = bus_right_instramp_G2;
assign right_hgbw_opamp_ena = bus_right_hgbw_opamp_ena;
assign right_lp_opamp_ena = bus_right_lp_opamp_ena;
assign right_rheostat1_b = bus_right_rheostat1_b;
assign right_rheostat2_b = bus_right_rheostat2_b;
assign comp_ena  = bus_comp_ena;
assign comp_trim  = bus_comp_trim;
assign comp_hyst  = bus_comp_hyst;
assign ulpcomp_ena  = bus_ulpcomp_ena;
assign ulpcomp_clk = bus_ulpcomp_clk;
assign bandgap_ena  = bus_bandgap_ena;
assign bandgap_trim  = bus_bandgap_trim;
assign bandgap_sel = bus_bandgap_sel;
assign ldo_ena  = bus_ldo_ena;
assign overvoltage_ena  = bus_overvoltage_ena;
assign overvoltage_trim  = bus_overvoltage_trim;
assign ldo_ref_sel = bus_ldo_ref_sel;
assign ibias_ena  = bus_ibias_ena;
assign ibias_src_ena  = bus_ibias_src_ena;
assign ibias_snk_ena  = bus_ibias_snk_ena;
assign ibias_ref_select  = bus_ibias_ref_select;
assign idac_value  = bus_idac_value;
assign idac_ena  = bus_idac_ena;
assign tempsense_ena  = bus_tempsense_ena;
assign tempsense_sel = bus_tempsense_sel;
assign rdac0_ena  = bus_rdac0_ena;
assign rdac0_value  = bus_rdac0_value;
assign rdac1_ena  = bus_rdac1_ena;
assign rdac1_value  = bus_rdac1_value; 
assign brownout_ena = bus_brownout_ena;	
assign brownout_vtrip = bus_brownout_vtrip;	
assign brownout_otrip = bus_brownout_otrip;	
assign brownout_isrc_sel = bus_brownout_isrc_sel;
assign brownout_oneshot = bus_brownout_oneshot;
assign brownout_rc_ena = bus_brownout_rc_ena;	
assign brownout_rc_dis = bus_brownout_rc_dis;	

assign bus_brownout_vunder = brownout_vunder;
assign bus_brownout_timeout = brownout_timeout;
assign bus_brownout_filt = brownout_filt;
assign bus_brownout_unfilt = brownout_unfilt;

assign bus_comp_out =   comp_out; 
assign bus_ulpcomp_out =   ulpcomp_out; 
assign bus_overvoltage_out =  	overvoltage_out; 
assign bus_vdda1_pwr_good =  vdda1_pwr_good; 
assign bus_vccd1_pwr_good =  vccd1_pwr_good; 
assign bus_vdda2_pwr_good =  vdda2_pwr_good; 
assign bus_vccd2_pwr_good =  vccd2_pwr_good; 

endmodule 