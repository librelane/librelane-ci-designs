/*
	Copyright 2023 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

/* THIS FILE IS GENERATED, DO NOT EDIT */

`timescale			1ns/1ps
`default_nettype	none


module regs_analog_ctrl_APB (
	input wire          PCLK,
                                        input wire          PRESETn,
                                        input wire          PWRITE,
                                        input wire [31:0]   PWDATA,
                                        input wire [31:0]   PADDR,
                                        input wire          PENABLE,
                                        input wire          PSEL,
                                        output wire         PREADY,
                                        output wire [31:0]  PRDATA,
                                        output wire         IRQ
,
	output	wire	[2-1:0]	ibias_test_to_gpio1_2,
	output	wire	[2-1:0]	vbg_test_to_gpio1_1,
	output	wire	[2-1:0]	idac_to_gpio1_3,
	output	wire	[2-1:0]	idac_to_gpio1_2,
	output	wire	[2-1:0]	adc_refh_to_gpio6_6,
	output	wire	[2-1:0]	dac_refh_to_gpio1_1,
	output	wire	[2-1:0]	adc_refl_to_gpio6_7,
	output	wire	[2-1:0]	dac_refl_to_gpio1_0,
	output	wire	[2-1:0]	right_lp_opamp_to_ulpcomp_p,
	output	wire	[2-1:0]	right_lp_opamp_to_comp_p,
	output	wire	[2-1:0]	right_lp_opamp_to_adc0,
	output	wire	[2-1:0]	right_lp_opamp_to_gpio4_7,
	output	wire	[2-1:0]	right_lp_opamp_to_gpio4_3,
	output	wire	[2-1:0]	right_lp_opamp_to_analog1,
	output	wire	[2-1:0]	right_lp_opamp_to_amuxbusB,
	output	wire	[2-1:0]	right_lp_opamp_to_gpio3_7,
	output	wire	[2-1:0]	right_lp_opamp_to_gpio3_3,
	output	wire	[2-1:0]	right_hgbw_opamp_to_ulpcomp_n,
	output	wire	[2-1:0]	right_hgbw_opamp_to_comp_n,
	output	wire	[2-1:0]	right_hgbw_opamp_to_adc1,
	output	wire	[2-1:0]	right_hgbw_opamp_to_gpio4_6,
	output	wire	[2-1:0]	right_hgbw_opamp_to_gpio4_2,
	output	wire	[2-1:0]	right_hgbw_opamp_to_analog0,
	output	wire	[2-1:0]	right_hgbw_opamp_to_amuxbusA,
	output	wire	[2-1:0]	right_hgbw_opamp_to_gpio3_6,
	output	wire	[2-1:0]	right_hgbw_opamp_to_gpio3_2,
	output	wire	[2-1:0]	left_hgbw_opamp_to_ulpcomp_p,
	output	wire	[2-1:0]	left_hgbw_opamp_to_comp_p,
	output	wire	[2-1:0]	left_hgbw_opamp_to_adc0,
	output	wire	[2-1:0]	left_hgbw_opamp_to_gpio4_5,
	output	wire	[2-1:0]	left_hgbw_opamp_to_gpio4_1,
	output	wire	[2-1:0]	left_hgbw_opamp_to_analog1,
	output	wire	[2-1:0]	left_hgbw_opamp_to_amuxbusB,
	output	wire	[2-1:0]	left_hgbw_opamp_to_gpio3_5,
	output	wire	[2-1:0]	left_hgbw_opamp_to_gpio3_1,
	output	wire	[2-1:0]	left_lp_opamp_to_ulpcomp_n,
	output	wire	[2-1:0]	left_lp_opamp_to_comp_n,
	output	wire	[2-1:0]	left_lp_opamp_to_adc1,
	output	wire	[2-1:0]	left_lp_opamp_to_gpio4_0,
	output	wire	[2-1:0]	left_lp_opamp_to_analog0,
	output	wire	[2-1:0]	left_lp_opamp_to_amuxbusA,
	output	wire	[2-1:0]	left_lp_opamp_to_gpio3_4,
	output	wire	[1-1:0]	right_lp_opamp_p_to_dac0,
	output	wire	[1-1:0]	right_lp_opamp_p_to_analog0,
	output	wire	[1-1:0]	right_lp_opamp_p_to_amuxbusA,
	output	wire	[1-1:0]	right_lp_opamp_p_to_rheostat_out,
	output	wire	[1-1:0]	right_lp_opamp_p_to_sio0,
	output	wire	[1-1:0]	right_lp_opamp_p_to_tempsense,
	output	wire	[1-1:0]	right_lp_opamp_p_to_left_vref,
	output	wire	[1-1:0]	right_lp_opamp_p_to_voutref,
	output	wire	[2-1:0]	right_lp_opamp_p_to_gpio2_5,
	output	wire	[1-1:0]	right_lp_opamp_n_to_dac1,
	output	wire	[1-1:0]	right_lp_opamp_n_to_analog1,
	output	wire	[1-1:0]	right_lp_opamp_n_to_amuxbusB,
	output	wire	[1-1:0]	right_lp_opamp_n_to_rheostat_out,
	output	wire	[1-1:0]	right_lp_opamp_n_to_rheostat_tap,
	output	wire	[1-1:0]	right_lp_opamp_n_to_sio1,
	output	wire	[1-1:0]	right_lp_opamp_n_to_vbgtc,
	output	wire	[1-1:0]	right_lp_opamp_n_to_right_vref,
	output	wire	[1-1:0]	right_lp_opamp_n_to_vinref,
	output	wire	[2-1:0]	right_lp_opamp_n_to_gpio2_4,
	output	wire	[2-1:0]	right_hgbw_opamp_p_to_gpio5_0,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_dac0,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_analog0,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_amuxbusA,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_rheostat_out,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_sio0,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_left_vref,
	output	wire	[1-1:0]	right_hgbw_opamp_p_to_voutref,
	output	wire	[2-1:0]	right_hgbw_opamp_p_to_gpio2_3,
	output	wire	[2-1:0]	right_hgbw_opamp_n_to_gpio5_1,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_dac1,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_analog1,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_amuxbusB,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_rheostat_out,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_rheostat_tap,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_sio1,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_vbgsc,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_right_vref,
	output	wire	[1-1:0]	right_hgbw_opamp_n_to_vinref,
	output	wire	[2-1:0]	right_hgbw_opamp_n_to_gpio2_2,
	output	wire	[2-1:0]	left_hgbw_opamp_p_to_gpio5_2,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_dac0,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_analog0,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_amuxbusA,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_rheostat_out,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_sio0,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_tempsense,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_left_vref,
	output	wire	[1-1:0]	left_hgbw_opamp_p_to_voutref,
	output	wire	[2-1:0]	left_hgbw_opamp_p_to_gpio2_1,
	output	wire	[2-1:0]	left_hgbw_opamp_n_to_gpio5_3,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_dac1,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_analog1,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_amuxbusB,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_rheostat_out,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_rheostat_tap,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_sio1,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_vbgtc,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_right_vref,
	output	wire	[1-1:0]	left_hgbw_opamp_n_to_vinref,
	output	wire	[2-1:0]	left_hgbw_opamp_n_to_gpio2_0,
	output	wire	[2-1:0]	left_lp_opamp_p_to_gpio5_4,
	output	wire	[1-1:0]	left_lp_opamp_p_to_dac0,
	output	wire	[1-1:0]	left_lp_opamp_p_to_analog0,
	output	wire	[1-1:0]	left_lp_opamp_p_to_amuxbusA,
	output	wire	[1-1:0]	left_lp_opamp_p_to_rheostat_out,
	output	wire	[1-1:0]	left_lp_opamp_p_to_sio0,
	output	wire	[1-1:0]	left_lp_opamp_p_to_left_vref,
	output	wire	[1-1:0]	left_lp_opamp_p_to_voutref,
	output	wire	[2-1:0]	left_lp_opamp_n_to_gpio5_5,
	output	wire	[1-1:0]	left_lp_opamp_n_to_dac1,
	output	wire	[1-1:0]	left_lp_opamp_n_to_analog1,
	output	wire	[1-1:0]	left_lp_opamp_n_to_amuxbusB,
	output	wire	[1-1:0]	left_lp_opamp_n_to_rheostat_out,
	output	wire	[1-1:0]	left_lp_opamp_n_to_rheostat_tap,
	output	wire	[1-1:0]	left_lp_opamp_n_to_sio1,
	output	wire	[1-1:0]	left_lp_opamp_n_to_vbgsc,
	output	wire	[1-1:0]	left_lp_opamp_n_to_right_vref,
	output	wire	[1-1:0]	left_lp_opamp_n_to_vinref,
	output	wire	[2-1:0]	left_instramp_to_ulpcomp_p,
	output	wire	[2-1:0]	left_instramp_to_comp_p,
	output	wire	[2-1:0]	left_instramp_to_adc0,
	output	wire	[2-1:0]	left_instramp_to_gpio4_4,
	output	wire	[2-1:0]	left_instramp_to_analog1,
	output	wire	[2-1:0]	left_instramp_to_amuxbusB,
	output	wire	[2-1:0]	right_instramp_to_ulpcomp_n,
	output	wire	[2-1:0]	right_instramp_to_comp_n,
	output	wire	[2-1:0]	right_instramp_to_adc1,
	output	wire	[2-1:0]	right_instramp_to_analog0,
	output	wire	[2-1:0]	right_instramp_to_amuxbusA,
	output	wire	[2-1:0]	right_instramp_to_gpio3_0,
	output	wire	[2-1:0]	left_instramp_n_to_gpio5_7,
	output	wire	[1-1:0]	left_instramp_n_to_analog1,
	output	wire	[1-1:0]	left_instramp_n_to_amuxbusB,
	output	wire	[1-1:0]	left_instramp_n_to_sio1,
	output	wire	[1-1:0]	left_instramp_n_to_right_vref,
	output	wire	[1-1:0]	left_instramp_n_to_vinref,
	output	wire	[2-1:0]	left_instramp_p_to_gpio5_6,
	output	wire	[1-1:0]	left_instramp_p_to_analog0,
	output	wire	[1-1:0]	left_instramp_p_to_amuxbusA,
	output	wire	[1-1:0]	left_instramp_p_to_sio0,
	output	wire	[1-1:0]	left_instramp_p_to_tempsense,
	output	wire	[1-1:0]	left_instramp_p_to_left_vref,
	output	wire	[1-1:0]	left_instramp_p_to_voutref,
	output	wire	[1-1:0]	right_instramp_n_to_analog1,
	output	wire	[1-1:0]	right_instramp_n_to_amuxbusB,
	output	wire	[1-1:0]	right_instramp_n_to_sio1,
	output	wire	[1-1:0]	right_instramp_n_to_right_vref,
	output	wire	[1-1:0]	right_instramp_n_to_vinref,
	output	wire	[2-1:0]	right_instramp_n_to_gpio2_6,
	output	wire	[1-1:0]	right_instramp_p_to_analog0,
	output	wire	[1-1:0]	right_instramp_p_to_amuxbusA,
	output	wire	[1-1:0]	right_instramp_p_to_sio0,
	output	wire	[1-1:0]	right_instramp_p_to_tempsense,
	output	wire	[1-1:0]	right_instramp_p_to_left_vref,
	output	wire	[1-1:0]	right_instramp_p_to_voutref,
	output	wire	[2-1:0]	right_instramp_p_to_gpio2_7,
	output	wire	[1-1:0]	ulpcomp_p_to_dac0,
	output	wire	[1-1:0]	ulpcomp_p_to_analog1,
	output	wire	[1-1:0]	ulpcomp_p_to_sio0,
	output	wire	[1-1:0]	ulpcomp_p_to_vbgtc,
	output	wire	[1-1:0]	ulpcomp_p_to_tempsense,
	output	wire	[1-1:0]	ulpcomp_p_to_left_vref,
	output	wire	[1-1:0]	ulpcomp_p_to_voutref,
	output	wire	[2-1:0]	ulpcomp_p_to_gpio6_0,
	output	wire	[2-1:0]	ulpcomp_p_to_gpio1_7,
	output	wire	[1-1:0]	ulpcomp_n_to_dac1,
	output	wire	[1-1:0]	ulpcomp_n_to_analog0,
	output	wire	[1-1:0]	ulpcomp_n_to_sio1,
	output	wire	[1-1:0]	ulpcomp_n_to_vbgsc,
	output	wire	[1-1:0]	ulpcomp_n_to_right_vref,
	output	wire	[1-1:0]	ulpcomp_n_to_vinref,
	output	wire	[2-1:0]	ulpcomp_n_to_gpio6_1,
	output	wire	[2-1:0]	ulpcomp_n_to_gpio1_6,
	output	wire	[1-1:0]	comp_p_to_dac0,
	output	wire	[1-1:0]	comp_p_to_analog1,
	output	wire	[1-1:0]	comp_p_to_sio0,
	output	wire	[1-1:0]	comp_p_to_vbgtc,
	output	wire	[1-1:0]	comp_p_to_tempsense,
	output	wire	[1-1:0]	comp_p_to_left_vref,
	output	wire	[1-1:0]	comp_p_to_voutref,
	output	wire	[2-1:0]	comp_p_to_gpio6_2,
	output	wire	[2-1:0]	comp_p_to_gpio1_5,
	output	wire	[1-1:0]	comp_n_to_dac1,
	output	wire	[1-1:0]	comp_n_to_analog0,
	output	wire	[1-1:0]	comp_n_to_sio1,
	output	wire	[1-1:0]	comp_n_to_vbgsc,
	output	wire	[1-1:0]	comp_n_to_right_vref,
	output	wire	[1-1:0]	comp_n_to_vinref,
	output	wire	[2-1:0]	comp_n_to_gpio6_3,
	output	wire	[2-1:0]	comp_n_to_gpio1_4,
	output	wire	[1-1:0]	adc0_to_dac0,
	output	wire	[1-1:0]	adc0_to_analog1,
	output	wire	[1-1:0]	adc0_to_vbgtc,
	output	wire	[1-1:0]	adc0_to_tempsense,
	output	wire	[1-1:0]	adc0_to_left_vref,
	output	wire	[1-1:0]	adc0_to_voutref,
	output	wire	[2-1:0]	adc0_to_gpio6_4,
	output	wire	[2-1:0]	adc0_to_gpio1_3,
	output	wire	[1-1:0]	adc1_to_dac1,
	output	wire	[1-1:0]	adc1_to_analog0,
	output	wire	[1-1:0]	adc1_to_vbgsc,
	output	wire	[1-1:0]	adc1_to_right_vref,
	output	wire	[1-1:0]	adc1_to_vinref,
	output	wire	[2-1:0]	adc1_to_gpio6_5,
	output	wire	[2-1:0]	adc1_to_gpio1_2,
	output	wire	[2-1:0]	sio0_connect,
	output	wire	[2-1:0]	sio1_connect,
	output	wire	[2-1:0]	analog0_connect,
	output	wire	[2-1:0]	analog1_connect,
	output	wire	[1-1:0]	vbgtc_to_user,
	output	wire	[1-1:0]	vbgsc_to_user,
	output	wire	[2-1:0]	user_to_comp_n,
	output	wire	[2-1:0]	user_to_comp_p,
	output	wire	[2-1:0]	user_to_ulpcomp_n,
	output	wire	[2-1:0]	user_to_ulpcomp_p,
	output	wire	[2-1:0]	user_to_adc0,
	output	wire	[2-1:0]	user_to_adc1,
	output	wire	[1-1:0]	dac0_to_user,
	output	wire	[1-1:0]	dac1_to_user,
	output	wire	[1-1:0]	tempsense_to_user,
	output	wire	[1-1:0]	right_vref_to_user,
	output	wire	[1-1:0]	left_vref_to_user,
	output	wire	[1-1:0]	vinref_to_user,
	output	wire	[1-1:0]	voutref_to_user,
	output	wire	[1-1:0]	dac0_to_analog1,
	output	wire	[1-1:0]	dac1_to_analog0,
	output	wire	[2-1:0]	audiodac_out_to_analog1,
	output	wire	[2-1:0]	audiodac_outb_to_analog0,
	output	wire	[1-1:0]	left_instramp_ena,
	output	wire	[5-1:0]	left_instramp_G1,
	output	wire	[5-1:0]	left_instramp_G2,
	output	wire	[1-1:0]	left_hgbw_opamp_ena,
	output	wire	[1-1:0]	left_lp_opamp_ena,
	output	wire	[8-1:0]	left_rheostat1_b,
	output	wire	[8-1:0]	left_rheostat2_b,
	output	wire	[1-1:0]	right_instramp_ena,
	output	wire	[5-1:0]	right_instramp_G1,
	output	wire	[5-1:0]	right_instramp_G2,
	output	wire	[1-1:0]	right_hgbw_opamp_ena,
	output	wire	[1-1:0]	right_lp_opamp_ena,
	output	wire	[8-1:0]	right_rheostat1_b,
	output	wire	[8-1:0]	right_rheostat2_b,
	output	wire	[1-1:0]	comp_ena,
	output	wire	[6-1:0]	comp_trim,
	output	wire	[2-1:0]	comp_hyst,
	output	wire	[1-1:0]	ulpcomp_ena,
	output	wire	[1-1:0]	ulpcomp_clk,
	output	wire	[1-1:0]	bandgap_ena,
	output	wire	[16-1:0]	bandgap_trim,
	output	wire	[1-1:0]	bandgap_sel,
	output	wire	[1-1:0]	ldo_ena,
	output	wire	[1-1:0]	overvoltage_ena,
	output	wire	[4-1:0]	overvoltage_trim,
	output	wire	[1-1:0]	ldo_ref_sel,
	output	wire	[1-1:0]	ibias_ena,
	output	wire	[24-1:0]	ibias_src_ena,
	output	wire	[4-1:0]	ibias_snk_ena,
	output	wire	[1-1:0]	ibias_ref_select,
	output	wire	[12-1:0]	idac_value,
	output	wire	[1-1:0]	idac_ena,
	output	wire	[1-1:0]	tempsense_ena,
	output	wire	[1-1:0]	tempsense_sel,
	output	wire	[1-1:0]	rdac0_ena,
	output	wire	[12-1:0]	rdac0_value,
	output	wire	[1-1:0]	rdac1_ena,
	output	wire	[12-1:0]	rdac1_value,
	output	wire	[1-1:0]	brownout_ena,
	output	wire	[3-1:0]	brownout_vtrip,
	output	wire	[3-1:0]	brownout_otrip,
	output	wire	[1-1:0]	brownout_isrc_sel,
	output	wire	[1-1:0]	brownout_oneshot,
	output	wire	[1-1:0]	brownout_rc_ena,
	output	wire	[1-1:0]	brownout_rc_dis,
	input	wire	[1-1:0]	brownout_vunder,
	input	wire	[1-1:0]	brownout_timeout,
	input	wire	[1-1:0]	brownout_filt,
	input	wire	[1-1:0]	brownout_unfilt,
	input	wire	[1-1:0]	comp_out,
	input	wire	[1-1:0]	ulpcomp_out,
	input	wire	[1-1:0]	overvoltage_out,
	input	wire	[1-1:0]	vdda1_pwr_good,
	input	wire	[1-1:0]	vccd1_pwr_good,
	input	wire	[1-1:0]	vdda2_pwr_good,
	input	wire	[1-1:0]	vccd2_pwr_good
);

	localparam	reg_ana_test_REG_OFFSET = 16'h0000;
	localparam	reg_ana_idac_REG_OFFSET = 16'h0004;
	localparam	reg_ana_ref_REG_OFFSET = 16'h0008;
	localparam	reg_ana_amp3_out_REG_OFFSET = 16'h000C;
	localparam	reg_ana_amp2_out_REG_OFFSET = 16'h0010;
	localparam	reg_ana_amp1_out_REG_OFFSET = 16'h0014;
	localparam	reg_ana_amp0_out_REG_OFFSET = 16'h0018;
	localparam	reg_ana_amp3_inp_REG_OFFSET = 16'h001C;
	localparam	reg_ana_amp3_inn_REG_OFFSET = 16'h0020;
	localparam	reg_ana_amp2_inp_REG_OFFSET = 16'h0024;
	localparam	reg_ana_amp2_inn_REG_OFFSET = 16'h0028;
	localparam	reg_ana_amp1_inp_REG_OFFSET = 16'h002C;
	localparam	reg_ana_amp1_inn_REG_OFFSET = 16'h0030;
	localparam	reg_ana_amp0_inp_REG_OFFSET = 16'h0034;
	localparam	reg_ana_amp0_inn_REG_OFFSET = 16'h0038;
	localparam	reg_ana_preamp0_out_REG_OFFSET = 16'h003C;
	localparam	reg_ana_preamp1_out_REG_OFFSET = 16'h0040;
	localparam	reg_ana_preamp0_inn_REG_OFFSET = 16'h0044;
	localparam	reg_ana_preamp0_inp_REG_OFFSET = 16'h0048;
	localparam	reg_ana_preamp1_inn_REG_OFFSET = 16'h004C;
	localparam	reg_ana_preamp1_inp_REG_OFFSET = 16'h0050;
	localparam	reg_ana_comp1_inp_REG_OFFSET = 16'h0054;
	localparam	reg_ana_comp1_inn_REG_OFFSET = 16'h0058;
	localparam	reg_ana_comp0_inp_REG_OFFSET = 16'h005C;
	localparam	reg_ana_comp0_inn_REG_OFFSET = 16'h0060;
	localparam	reg_ana_adc0_in_REG_OFFSET = 16'h0064;
	localparam	reg_ana_adc1_in_REG_OFFSET = 16'h0068;
	localparam	reg_ana_sio_iso_REG_OFFSET = 16'h006C;
	localparam	reg_ana_sio_ana_REG_OFFSET = 16'h0070;
	localparam	reg_ana_uproj_REG_OFFSET = 16'h0074;
	localparam	reg_ana_dac_out_REG_OFFSET = 16'h0078;
	localparam	reg_left_instramp_ctrl_REG_OFFSET = 16'h007C;
	localparam	reg_left_opamp_ctrl_REG_OFFSET = 16'h0080;
	localparam	reg_right_instramp_ctrl_REG_OFFSET = 16'h0084;
	localparam	reg_right_opamp_ctrl_REG_OFFSET = 16'h0088;
	localparam	reg_comparator_ctrl_REG_OFFSET = 16'h008C;
	localparam	reg_bandgap_ctrl_REG_OFFSET = 16'h0090;
	localparam	reg_ibias_ctrl_REG_OFFSET = 16'h0094;
	localparam	reg_idac_ctrl_REG_OFFSET = 16'h0098;
	localparam	reg_tempsense_ctrl_REG_OFFSET = 16'h009C;
	localparam	reg_rdac_ctrl_REG_OFFSET = 16'h00A0;
	localparam	reg_brownout_ctrl_REG_OFFSET = 16'h00A4;
	localparam	reg_brownout_output_REG_OFFSET = 16'h00A8;
	localparam	reg_comparator0_out_REG_OFFSET = 16'h00AC;
	localparam	reg_comparator1_out_REG_OFFSET = 16'h00B0;
	localparam	reg_overvoltage_out_REG_OFFSET = 16'h00B4;
	localparam	reg_vdda1_pwr_good_REG_OFFSET = 16'h00B8;
	localparam	reg_vccd1_pwr_good_REG_OFFSET = 16'h00BC;
	localparam	reg_vdda2_pwr_good_REG_OFFSET = 16'h00C0;
	localparam	reg_vccd2_pwr_good_REG_OFFSET = 16'h00C4;
	wire		clk = PCLK;
	wire		rst_n = PRESETn;


	wire		apb_valid   = PSEL & PENABLE;
                                        wire		apb_we	    = PWRITE & apb_valid;
                                        wire		apb_re	    = ~PWRITE & apb_valid;

	wire [2-1:0]	bus_ibias_test_to_gpio1_2;
	wire [2-1:0]	bus_vbg_test_to_gpio1_1;
	wire [2-1:0]	bus_idac_to_gpio1_3;
	wire [2-1:0]	bus_idac_to_gpio1_2;
	wire [2-1:0]	bus_adc_refh_to_gpio6_6;
	wire [2-1:0]	bus_dac_refh_to_gpio1_1;
	wire [2-1:0]	bus_adc_refl_to_gpio6_7;
	wire [2-1:0]	bus_dac_refl_to_gpio1_0;
	wire [2-1:0]	bus_right_lp_opamp_to_ulpcomp_p;
	wire [2-1:0]	bus_right_lp_opamp_to_comp_p;
	wire [2-1:0]	bus_right_lp_opamp_to_adc0;
	wire [2-1:0]	bus_right_lp_opamp_to_gpio4_7;
	wire [2-1:0]	bus_right_lp_opamp_to_gpio4_3;
	wire [2-1:0]	bus_right_lp_opamp_to_analog1;
	wire [2-1:0]	bus_right_lp_opamp_to_amuxbusB;
	wire [2-1:0]	bus_right_lp_opamp_to_gpio3_7;
	wire [2-1:0]	bus_right_lp_opamp_to_gpio3_3;
	wire [2-1:0]	bus_right_hgbw_opamp_to_ulpcomp_n;
	wire [2-1:0]	bus_right_hgbw_opamp_to_comp_n;
	wire [2-1:0]	bus_right_hgbw_opamp_to_adc1;
	wire [2-1:0]	bus_right_hgbw_opamp_to_gpio4_6;
	wire [2-1:0]	bus_right_hgbw_opamp_to_gpio4_2;
	wire [2-1:0]	bus_right_hgbw_opamp_to_analog0;
	wire [2-1:0]	bus_right_hgbw_opamp_to_amuxbusA;
	wire [2-1:0]	bus_right_hgbw_opamp_to_gpio3_6;
	wire [2-1:0]	bus_right_hgbw_opamp_to_gpio3_2;
	wire [2-1:0]	bus_left_hgbw_opamp_to_ulpcomp_p;
	wire [2-1:0]	bus_left_hgbw_opamp_to_comp_p;
	wire [2-1:0]	bus_left_hgbw_opamp_to_adc0;
	wire [2-1:0]	bus_left_hgbw_opamp_to_gpio4_5;
	wire [2-1:0]	bus_left_hgbw_opamp_to_gpio4_1;
	wire [2-1:0]	bus_left_hgbw_opamp_to_analog1;
	wire [2-1:0]	bus_left_hgbw_opamp_to_amuxbusB;
	wire [2-1:0]	bus_left_hgbw_opamp_to_gpio3_5;
	wire [2-1:0]	bus_left_hgbw_opamp_to_gpio3_1;
	wire [2-1:0]	bus_left_lp_opamp_to_ulpcomp_n;
	wire [2-1:0]	bus_left_lp_opamp_to_comp_n;
	wire [2-1:0]	bus_left_lp_opamp_to_adc1;
	wire [2-1:0]	bus_left_lp_opamp_to_gpio4_0;
	wire [2-1:0]	bus_left_lp_opamp_to_analog0;
	wire [2-1:0]	bus_left_lp_opamp_to_amuxbusA;
	wire [2-1:0]	bus_left_lp_opamp_to_gpio3_4;
	wire [1-1:0]	bus_right_lp_opamp_p_to_dac0;
	wire [1-1:0]	bus_right_lp_opamp_p_to_analog0;
	wire [1-1:0]	bus_right_lp_opamp_p_to_amuxbusA;
	wire [1-1:0]	bus_right_lp_opamp_p_to_rheostat_out;
	wire [1-1:0]	bus_right_lp_opamp_p_to_sio0;
	wire [1-1:0]	bus_right_lp_opamp_p_to_tempsense;
	wire [1-1:0]	bus_right_lp_opamp_p_to_left_vref;
	wire [1-1:0]	bus_right_lp_opamp_p_to_voutref;
	wire [2-1:0]	bus_right_lp_opamp_p_to_gpio2_5;
	wire [1-1:0]	bus_right_lp_opamp_n_to_dac1;
	wire [1-1:0]	bus_right_lp_opamp_n_to_analog1;
	wire [1-1:0]	bus_right_lp_opamp_n_to_amuxbusB;
	wire [1-1:0]	bus_right_lp_opamp_n_to_rheostat_out;
	wire [1-1:0]	bus_right_lp_opamp_n_to_rheostat_tap;
	wire [1-1:0]	bus_right_lp_opamp_n_to_sio1;
	wire [1-1:0]	bus_right_lp_opamp_n_to_vbgtc;
	wire [1-1:0]	bus_right_lp_opamp_n_to_right_vref;
	wire [1-1:0]	bus_right_lp_opamp_n_to_vinref;
	wire [2-1:0]	bus_right_lp_opamp_n_to_gpio2_4;
	wire [2-1:0]	bus_right_hgbw_opamp_p_to_gpio5_0;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_dac0;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_analog0;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_amuxbusA;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_rheostat_out;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_sio0;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_left_vref;
	wire [1-1:0]	bus_right_hgbw_opamp_p_to_voutref;
	wire [2-1:0]	bus_right_hgbw_opamp_p_to_gpio2_3;
	wire [2-1:0]	bus_right_hgbw_opamp_n_to_gpio5_1;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_dac1;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_analog1;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_amuxbusB;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_rheostat_out;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_rheostat_tap;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_sio1;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_vbgsc;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_right_vref;
	wire [1-1:0]	bus_right_hgbw_opamp_n_to_vinref;
	wire [2-1:0]	bus_right_hgbw_opamp_n_to_gpio2_2;
	wire [2-1:0]	bus_left_hgbw_opamp_p_to_gpio5_2;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_dac0;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_analog0;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_amuxbusA;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_rheostat_out;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_sio0;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_tempsense;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_left_vref;
	wire [1-1:0]	bus_left_hgbw_opamp_p_to_voutref;
	wire [2-1:0]	bus_left_hgbw_opamp_p_to_gpio2_1;
	wire [2-1:0]	bus_left_hgbw_opamp_n_to_gpio5_3;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_dac1;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_analog1;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_amuxbusB;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_rheostat_out;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_rheostat_tap;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_sio1;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_vbgtc;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_right_vref;
	wire [1-1:0]	bus_left_hgbw_opamp_n_to_vinref;
	wire [2-1:0]	bus_left_hgbw_opamp_n_to_gpio2_0;
	wire [2-1:0]	bus_left_lp_opamp_p_to_gpio5_4;
	wire [1-1:0]	bus_left_lp_opamp_p_to_dac0;
	wire [1-1:0]	bus_left_lp_opamp_p_to_analog0;
	wire [1-1:0]	bus_left_lp_opamp_p_to_amuxbusA;
	wire [1-1:0]	bus_left_lp_opamp_p_to_rheostat_out;
	wire [1-1:0]	bus_left_lp_opamp_p_to_sio0;
	wire [1-1:0]	bus_left_lp_opamp_p_to_left_vref;
	wire [1-1:0]	bus_left_lp_opamp_p_to_voutref;
	wire [2-1:0]	bus_left_lp_opamp_n_to_gpio5_5;
	wire [1-1:0]	bus_left_lp_opamp_n_to_dac1;
	wire [1-1:0]	bus_left_lp_opamp_n_to_analog1;
	wire [1-1:0]	bus_left_lp_opamp_n_to_amuxbusB;
	wire [1-1:0]	bus_left_lp_opamp_n_to_rheostat_out;
	wire [1-1:0]	bus_left_lp_opamp_n_to_rheostat_tap;
	wire [1-1:0]	bus_left_lp_opamp_n_to_sio1;
	wire [1-1:0]	bus_left_lp_opamp_n_to_vbgsc;
	wire [1-1:0]	bus_left_lp_opamp_n_to_right_vref;
	wire [1-1:0]	bus_left_lp_opamp_n_to_vinref;
	wire [2-1:0]	bus_left_instramp_to_ulpcomp_p;
	wire [2-1:0]	bus_left_instramp_to_comp_p;
	wire [2-1:0]	bus_left_instramp_to_adc0;
	wire [2-1:0]	bus_left_instramp_to_gpio4_4;
	wire [2-1:0]	bus_left_instramp_to_analog1;
	wire [2-1:0]	bus_left_instramp_to_amuxbusB;
	wire [2-1:0]	bus_right_instramp_to_ulpcomp_n;
	wire [2-1:0]	bus_right_instramp_to_comp_n;
	wire [2-1:0]	bus_right_instramp_to_adc1;
	wire [2-1:0]	bus_right_instramp_to_analog0;
	wire [2-1:0]	bus_right_instramp_to_amuxbusA;
	wire [2-1:0]	bus_right_instramp_to_gpio3_0;
	wire [2-1:0]	bus_left_instramp_n_to_gpio5_7;
	wire [1-1:0]	bus_left_instramp_n_to_analog1;
	wire [1-1:0]	bus_left_instramp_n_to_amuxbusB;
	wire [1-1:0]	bus_left_instramp_n_to_sio1;
	wire [1-1:0]	bus_left_instramp_n_to_right_vref;
	wire [1-1:0]	bus_left_instramp_n_to_vinref;
	wire [2-1:0]	bus_left_instramp_p_to_gpio5_6;
	wire [1-1:0]	bus_left_instramp_p_to_analog0;
	wire [1-1:0]	bus_left_instramp_p_to_amuxbusA;
	wire [1-1:0]	bus_left_instramp_p_to_sio0;
	wire [1-1:0]	bus_left_instramp_p_to_tempsense;
	wire [1-1:0]	bus_left_instramp_p_to_left_vref;
	wire [1-1:0]	bus_left_instramp_p_to_voutref;
	wire [1-1:0]	bus_right_instramp_n_to_analog1;
	wire [1-1:0]	bus_right_instramp_n_to_amuxbusB;
	wire [1-1:0]	bus_right_instramp_n_to_sio1;
	wire [1-1:0]	bus_right_instramp_n_to_right_vref;
	wire [1-1:0]	bus_right_instramp_n_to_vinref;
	wire [2-1:0]	bus_right_instramp_n_to_gpio2_6;
	wire [1-1:0]	bus_right_instramp_p_to_analog0;
	wire [1-1:0]	bus_right_instramp_p_to_amuxbusA;
	wire [1-1:0]	bus_right_instramp_p_to_sio0;
	wire [1-1:0]	bus_right_instramp_p_to_tempsense;
	wire [1-1:0]	bus_right_instramp_p_to_left_vref;
	wire [1-1:0]	bus_right_instramp_p_to_voutref;
	wire [2-1:0]	bus_right_instramp_p_to_gpio2_7;
	wire [1-1:0]	bus_ulpcomp_p_to_dac0;
	wire [1-1:0]	bus_ulpcomp_p_to_analog1;
	wire [1-1:0]	bus_ulpcomp_p_to_sio0;
	wire [1-1:0]	bus_ulpcomp_p_to_vbgtc;
	wire [1-1:0]	bus_ulpcomp_p_to_tempsense;
	wire [1-1:0]	bus_ulpcomp_p_to_left_vref;
	wire [1-1:0]	bus_ulpcomp_p_to_voutref;
	wire [2-1:0]	bus_ulpcomp_p_to_gpio6_0;
	wire [2-1:0]	bus_ulpcomp_p_to_gpio1_7;
	wire [1-1:0]	bus_ulpcomp_n_to_dac1;
	wire [1-1:0]	bus_ulpcomp_n_to_analog0;
	wire [1-1:0]	bus_ulpcomp_n_to_sio1;
	wire [1-1:0]	bus_ulpcomp_n_to_vbgsc;
	wire [1-1:0]	bus_ulpcomp_n_to_right_vref;
	wire [1-1:0]	bus_ulpcomp_n_to_vinref;
	wire [2-1:0]	bus_ulpcomp_n_to_gpio6_1;
	wire [2-1:0]	bus_ulpcomp_n_to_gpio1_6;
	wire [1-1:0]	bus_comp_p_to_dac0;
	wire [1-1:0]	bus_comp_p_to_analog1;
	wire [1-1:0]	bus_comp_p_to_sio0;
	wire [1-1:0]	bus_comp_p_to_vbgtc;
	wire [1-1:0]	bus_comp_p_to_tempsense;
	wire [1-1:0]	bus_comp_p_to_left_vref;
	wire [1-1:0]	bus_comp_p_to_voutref;
	wire [2-1:0]	bus_comp_p_to_gpio6_2;
	wire [2-1:0]	bus_comp_p_to_gpio1_5;
	wire [1-1:0]	bus_comp_n_to_dac1;
	wire [1-1:0]	bus_comp_n_to_analog0;
	wire [1-1:0]	bus_comp_n_to_sio1;
	wire [1-1:0]	bus_comp_n_to_vbgsc;
	wire [1-1:0]	bus_comp_n_to_right_vref;
	wire [1-1:0]	bus_comp_n_to_vinref;
	wire [2-1:0]	bus_comp_n_to_gpio6_3;
	wire [2-1:0]	bus_comp_n_to_gpio1_4;
	wire [1-1:0]	bus_adc0_to_dac0;
	wire [1-1:0]	bus_adc0_to_analog1;
	wire [1-1:0]	bus_adc0_to_vbgtc;
	wire [1-1:0]	bus_adc0_to_tempsense;
	wire [1-1:0]	bus_adc0_to_left_vref;
	wire [1-1:0]	bus_adc0_to_voutref;
	wire [2-1:0]	bus_adc0_to_gpio6_4;
	wire [2-1:0]	bus_adc0_to_gpio1_3;
	wire [1-1:0]	bus_adc1_to_dac1;
	wire [1-1:0]	bus_adc1_to_analog0;
	wire [1-1:0]	bus_adc1_to_vbgsc;
	wire [1-1:0]	bus_adc1_to_right_vref;
	wire [1-1:0]	bus_adc1_to_vinref;
	wire [2-1:0]	bus_adc1_to_gpio6_5;
	wire [2-1:0]	bus_adc1_to_gpio1_2;
	wire [2-1:0]	bus_sio0_connect;
	wire [2-1:0]	bus_sio1_connect;
	wire [2-1:0]	bus_analog0_connect;
	wire [2-1:0]	bus_analog1_connect;
	wire [1-1:0]	bus_vbgtc_to_user;
	wire [1-1:0]	bus_vbgsc_to_user;
	wire [2-1:0]	bus_user_to_comp_n;
	wire [2-1:0]	bus_user_to_comp_p;
	wire [2-1:0]	bus_user_to_ulpcomp_n;
	wire [2-1:0]	bus_user_to_ulpcomp_p;
	wire [2-1:0]	bus_user_to_adc0;
	wire [2-1:0]	bus_user_to_adc1;
	wire [1-1:0]	bus_dac0_to_user;
	wire [1-1:0]	bus_dac1_to_user;
	wire [1-1:0]	bus_tempsense_to_user;
	wire [1-1:0]	bus_right_vref_to_user;
	wire [1-1:0]	bus_left_vref_to_user;
	wire [1-1:0]	bus_vinref_to_user;
	wire [1-1:0]	bus_voutref_to_user;
	wire [1-1:0]	bus_dac0_to_analog1;
	wire [1-1:0]	bus_dac1_to_analog0;
	wire [2-1:0]	bus_audiodac_out_to_analog1;
	wire [2-1:0]	bus_audiodac_outb_to_analog0;
	wire [1-1:0]	bus_left_instramp_ena;
	wire [5-1:0]	bus_left_instramp_G1;
	wire [5-1:0]	bus_left_instramp_G2;
	wire [1-1:0]	bus_left_hgbw_opamp_ena;
	wire [1-1:0]	bus_left_lp_opamp_ena;
	wire [8-1:0]	bus_left_rheostat1_b;
	wire [8-1:0]	bus_left_rheostat2_b;
	wire [1-1:0]	bus_right_instramp_ena;
	wire [5-1:0]	bus_right_instramp_G1;
	wire [5-1:0]	bus_right_instramp_G2;
	wire [1-1:0]	bus_right_hgbw_opamp_ena;
	wire [1-1:0]	bus_right_lp_opamp_ena;
	wire [8-1:0]	bus_right_rheostat1_b;
	wire [8-1:0]	bus_right_rheostat2_b;
	wire [1-1:0]	bus_comp_ena;
	wire [6-1:0]	bus_comp_trim;
	wire [2-1:0]	bus_comp_hyst;
	wire [1-1:0]	bus_ulpcomp_ena;
	wire [1-1:0]	bus_ulpcomp_clk;
	wire [1-1:0]	bus_bandgap_ena;
	wire [16-1:0]	bus_bandgap_trim;
	wire [1-1:0]	bus_bandgap_sel;
	wire [1-1:0]	bus_ldo_ena;
	wire [1-1:0]	bus_overvoltage_ena;
	wire [4-1:0]	bus_overvoltage_trim;
	wire [1-1:0]	bus_ldo_ref_sel;
	wire [1-1:0]	bus_ibias_ena;
	wire [24-1:0]	bus_ibias_src_ena;
	wire [4-1:0]	bus_ibias_snk_ena;
	wire [1-1:0]	bus_ibias_ref_select;
	wire [12-1:0]	bus_idac_value;
	wire [1-1:0]	bus_idac_ena;
	wire [1-1:0]	bus_tempsense_ena;
	wire [1-1:0]	bus_tempsense_sel;
	wire [1-1:0]	bus_rdac0_ena;
	wire [12-1:0]	bus_rdac0_value;
	wire [1-1:0]	bus_rdac1_ena;
	wire [12-1:0]	bus_rdac1_value;
	wire [1-1:0]	bus_brownout_ena;
	wire [3-1:0]	bus_brownout_vtrip;
	wire [3-1:0]	bus_brownout_otrip;
	wire [1-1:0]	bus_brownout_isrc_sel;
	wire [1-1:0]	bus_brownout_oneshot;
	wire [1-1:0]	bus_brownout_rc_ena;
	wire [1-1:0]	bus_brownout_rc_dis;
	wire [1-1:0]	bus_brownout_vunder;
	wire [1-1:0]	bus_brownout_timeout;
	wire [1-1:0]	bus_brownout_filt;
	wire [1-1:0]	bus_brownout_unfilt;
	wire [1-1:0]	bus_comp_out;
	wire [1-1:0]	bus_ulpcomp_out;
	wire [1-1:0]	bus_overvoltage_out;
	wire [1-1:0]	bus_vdda1_pwr_good;
	wire [1-1:0]	bus_vccd1_pwr_good;
	wire [1-1:0]	bus_vdda2_pwr_good;
	wire [1-1:0]	bus_vccd2_pwr_good;

	// Register Definitions
	reg [3:0]	reg_ana_test_REG;
	assign	bus_ibias_test_to_gpio1_2	=	reg_ana_test_REG[1 : 0];
	assign	bus_vbg_test_to_gpio1_1	=	reg_ana_test_REG[3 : 2];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_test_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_test_REG_OFFSET))
                                            reg_ana_test_REG <= PWDATA[4-1:0];

	reg [3:0]	reg_ana_idac_REG;
	assign	bus_idac_to_gpio1_3	=	reg_ana_idac_REG[1 : 0];
	assign	bus_idac_to_gpio1_2	=	reg_ana_idac_REG[3 : 2];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_idac_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_idac_REG_OFFSET))
                                            reg_ana_idac_REG <= PWDATA[4-1:0];

	reg [7:0]	reg_ana_ref_REG;
	assign	bus_adc_refh_to_gpio6_6	=	reg_ana_ref_REG[1 : 0];
	assign	bus_dac_refh_to_gpio1_1	=	reg_ana_ref_REG[3 : 2];
	assign	bus_adc_refl_to_gpio6_7	=	reg_ana_ref_REG[5 : 4];
	assign	bus_dac_refl_to_gpio1_0	=	reg_ana_ref_REG[7 : 6];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_ref_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_ref_REG_OFFSET))
                                            reg_ana_ref_REG <= PWDATA[8-1:0];

	reg [17:0]	reg_ana_amp3_out_REG;
	assign	bus_right_lp_opamp_to_ulpcomp_p	=	reg_ana_amp3_out_REG[1 : 0];
	assign	bus_right_lp_opamp_to_comp_p	=	reg_ana_amp3_out_REG[3 : 2];
	assign	bus_right_lp_opamp_to_adc0	=	reg_ana_amp3_out_REG[5 : 4];
	assign	bus_right_lp_opamp_to_gpio4_7	=	reg_ana_amp3_out_REG[7 : 6];
	assign	bus_right_lp_opamp_to_gpio4_3	=	reg_ana_amp3_out_REG[9 : 8];
	assign	bus_right_lp_opamp_to_analog1	=	reg_ana_amp3_out_REG[11 : 10];
	assign	bus_right_lp_opamp_to_amuxbusB	=	reg_ana_amp3_out_REG[13 : 12];
	assign	bus_right_lp_opamp_to_gpio3_7	=	reg_ana_amp3_out_REG[15 : 14];
	assign	bus_right_lp_opamp_to_gpio3_3	=	reg_ana_amp3_out_REG[17 : 16];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp3_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp3_out_REG_OFFSET))
                                            reg_ana_amp3_out_REG <= PWDATA[18-1:0];

	reg [17:0]	reg_ana_amp2_out_REG;
	assign	bus_right_hgbw_opamp_to_ulpcomp_n	=	reg_ana_amp2_out_REG[1 : 0];
	assign	bus_right_hgbw_opamp_to_comp_n	=	reg_ana_amp2_out_REG[3 : 2];
	assign	bus_right_hgbw_opamp_to_adc1	=	reg_ana_amp2_out_REG[5 : 4];
	assign	bus_right_hgbw_opamp_to_gpio4_6	=	reg_ana_amp2_out_REG[7 : 6];
	assign	bus_right_hgbw_opamp_to_gpio4_2	=	reg_ana_amp2_out_REG[9 : 8];
	assign	bus_right_hgbw_opamp_to_analog0	=	reg_ana_amp2_out_REG[11 : 10];
	assign	bus_right_hgbw_opamp_to_amuxbusA	=	reg_ana_amp2_out_REG[13 : 12];
	assign	bus_right_hgbw_opamp_to_gpio3_6	=	reg_ana_amp2_out_REG[15 : 14];
	assign	bus_right_hgbw_opamp_to_gpio3_2	=	reg_ana_amp2_out_REG[17 : 16];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp2_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp2_out_REG_OFFSET))
                                            reg_ana_amp2_out_REG <= PWDATA[18-1:0];

	reg [17:0]	reg_ana_amp1_out_REG;
	assign	bus_left_hgbw_opamp_to_ulpcomp_p	=	reg_ana_amp1_out_REG[1 : 0];
	assign	bus_left_hgbw_opamp_to_comp_p	=	reg_ana_amp1_out_REG[3 : 2];
	assign	bus_left_hgbw_opamp_to_adc0	=	reg_ana_amp1_out_REG[5 : 4];
	assign	bus_left_hgbw_opamp_to_gpio4_5	=	reg_ana_amp1_out_REG[7 : 6];
	assign	bus_left_hgbw_opamp_to_gpio4_1	=	reg_ana_amp1_out_REG[9 : 8];
	assign	bus_left_hgbw_opamp_to_analog1	=	reg_ana_amp1_out_REG[11 : 10];
	assign	bus_left_hgbw_opamp_to_amuxbusB	=	reg_ana_amp1_out_REG[13 : 12];
	assign	bus_left_hgbw_opamp_to_gpio3_5	=	reg_ana_amp1_out_REG[15 : 14];
	assign	bus_left_hgbw_opamp_to_gpio3_1	=	reg_ana_amp1_out_REG[17 : 16];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp1_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp1_out_REG_OFFSET))
                                            reg_ana_amp1_out_REG <= PWDATA[18-1:0];

	reg [13:0]	reg_ana_amp0_out_REG;
	assign	bus_left_lp_opamp_to_ulpcomp_n	=	reg_ana_amp0_out_REG[1 : 0];
	assign	bus_left_lp_opamp_to_comp_n	=	reg_ana_amp0_out_REG[3 : 2];
	assign	bus_left_lp_opamp_to_adc1	=	reg_ana_amp0_out_REG[5 : 4];
	assign	bus_left_lp_opamp_to_gpio4_0	=	reg_ana_amp0_out_REG[7 : 6];
	assign	bus_left_lp_opamp_to_analog0	=	reg_ana_amp0_out_REG[9 : 8];
	assign	bus_left_lp_opamp_to_amuxbusA	=	reg_ana_amp0_out_REG[11 : 10];
	assign	bus_left_lp_opamp_to_gpio3_4	=	reg_ana_amp0_out_REG[13 : 12];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp0_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp0_out_REG_OFFSET))
                                            reg_ana_amp0_out_REG <= PWDATA[14-1:0];

	reg [9:0]	reg_ana_amp3_inp_REG;
	assign	bus_right_lp_opamp_p_to_dac0	=	reg_ana_amp3_inp_REG[0 : 0];
	assign	bus_right_lp_opamp_p_to_analog0	=	reg_ana_amp3_inp_REG[1 : 1];
	assign	bus_right_lp_opamp_p_to_amuxbusA	=	reg_ana_amp3_inp_REG[2 : 2];
	assign	bus_right_lp_opamp_p_to_rheostat_out	=	reg_ana_amp3_inp_REG[3 : 3];
	assign	bus_right_lp_opamp_p_to_sio0	=	reg_ana_amp3_inp_REG[4 : 4];
	assign	bus_right_lp_opamp_p_to_tempsense	=	reg_ana_amp3_inp_REG[5 : 5];
	assign	bus_right_lp_opamp_p_to_left_vref	=	reg_ana_amp3_inp_REG[6 : 6];
	assign	bus_right_lp_opamp_p_to_voutref	=	reg_ana_amp3_inp_REG[7 : 7];
	assign	bus_right_lp_opamp_p_to_gpio2_5	=	reg_ana_amp3_inp_REG[9 : 8];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp3_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp3_inp_REG_OFFSET))
                                            reg_ana_amp3_inp_REG <= PWDATA[10-1:0];

	reg [10:0]	reg_ana_amp3_inn_REG;
	assign	bus_right_lp_opamp_n_to_dac1	=	reg_ana_amp3_inn_REG[0 : 0];
	assign	bus_right_lp_opamp_n_to_analog1	=	reg_ana_amp3_inn_REG[1 : 1];
	assign	bus_right_lp_opamp_n_to_amuxbusB	=	reg_ana_amp3_inn_REG[2 : 2];
	assign	bus_right_lp_opamp_n_to_rheostat_out	=	reg_ana_amp3_inn_REG[3 : 3];
	assign	bus_right_lp_opamp_n_to_rheostat_tap	=	reg_ana_amp3_inn_REG[4 : 4];
	assign	bus_right_lp_opamp_n_to_sio1	=	reg_ana_amp3_inn_REG[5 : 5];
	assign	bus_right_lp_opamp_n_to_vbgtc	=	reg_ana_amp3_inn_REG[6 : 6];
	assign	bus_right_lp_opamp_n_to_right_vref	=	reg_ana_amp3_inn_REG[7 : 7];
	assign	bus_right_lp_opamp_n_to_vinref	=	reg_ana_amp3_inn_REG[8 : 8];
	assign	bus_right_lp_opamp_n_to_gpio2_4	=	reg_ana_amp3_inn_REG[10 : 9];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp3_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp3_inn_REG_OFFSET))
                                            reg_ana_amp3_inn_REG <= PWDATA[11-1:0];

	reg [10:0]	reg_ana_amp2_inp_REG;
	assign	bus_right_hgbw_opamp_p_to_gpio5_0	=	reg_ana_amp2_inp_REG[1 : 0];
	assign	bus_right_hgbw_opamp_p_to_dac0	=	reg_ana_amp2_inp_REG[2 : 2];
	assign	bus_right_hgbw_opamp_p_to_analog0	=	reg_ana_amp2_inp_REG[3 : 3];
	assign	bus_right_hgbw_opamp_p_to_amuxbusA	=	reg_ana_amp2_inp_REG[4 : 4];
	assign	bus_right_hgbw_opamp_p_to_rheostat_out	=	reg_ana_amp2_inp_REG[5 : 5];
	assign	bus_right_hgbw_opamp_p_to_sio0	=	reg_ana_amp2_inp_REG[6 : 6];
	assign	bus_right_hgbw_opamp_p_to_left_vref	=	reg_ana_amp2_inp_REG[7 : 7];
	assign	bus_right_hgbw_opamp_p_to_voutref	=	reg_ana_amp2_inp_REG[8 : 8];
	assign	bus_right_hgbw_opamp_p_to_gpio2_3	=	reg_ana_amp2_inp_REG[10 : 9];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp2_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp2_inp_REG_OFFSET))
                                            reg_ana_amp2_inp_REG <= PWDATA[11-1:0];

	reg [12:0]	reg_ana_amp2_inn_REG;
	assign	bus_right_hgbw_opamp_n_to_gpio5_1	=	reg_ana_amp2_inn_REG[1 : 0];
	assign	bus_right_hgbw_opamp_n_to_dac1	=	reg_ana_amp2_inn_REG[2 : 2];
	assign	bus_right_hgbw_opamp_n_to_analog1	=	reg_ana_amp2_inn_REG[3 : 3];
	assign	bus_right_hgbw_opamp_n_to_amuxbusB	=	reg_ana_amp2_inn_REG[4 : 4];
	assign	bus_right_hgbw_opamp_n_to_rheostat_out	=	reg_ana_amp2_inn_REG[5 : 5];
	assign	bus_right_hgbw_opamp_n_to_rheostat_tap	=	reg_ana_amp2_inn_REG[6 : 6];
	assign	bus_right_hgbw_opamp_n_to_sio1	=	reg_ana_amp2_inn_REG[7 : 7];
	assign	bus_right_hgbw_opamp_n_to_vbgsc	=	reg_ana_amp2_inn_REG[8 : 8];
	assign	bus_right_hgbw_opamp_n_to_right_vref	=	reg_ana_amp2_inn_REG[9 : 9];
	assign	bus_right_hgbw_opamp_n_to_vinref	=	reg_ana_amp2_inn_REG[10 : 10];
	assign	bus_right_hgbw_opamp_n_to_gpio2_2	=	reg_ana_amp2_inn_REG[12 : 11];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp2_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp2_inn_REG_OFFSET))
                                            reg_ana_amp2_inn_REG <= PWDATA[13-1:0];

	reg [11:0]	reg_ana_amp1_inp_REG;
	assign	bus_left_hgbw_opamp_p_to_gpio5_2	=	reg_ana_amp1_inp_REG[1 : 0];
	assign	bus_left_hgbw_opamp_p_to_dac0	=	reg_ana_amp1_inp_REG[2 : 2];
	assign	bus_left_hgbw_opamp_p_to_analog0	=	reg_ana_amp1_inp_REG[3 : 3];
	assign	bus_left_hgbw_opamp_p_to_amuxbusA	=	reg_ana_amp1_inp_REG[4 : 4];
	assign	bus_left_hgbw_opamp_p_to_rheostat_out	=	reg_ana_amp1_inp_REG[5 : 5];
	assign	bus_left_hgbw_opamp_p_to_sio0	=	reg_ana_amp1_inp_REG[6 : 6];
	assign	bus_left_hgbw_opamp_p_to_tempsense	=	reg_ana_amp1_inp_REG[7 : 7];
	assign	bus_left_hgbw_opamp_p_to_left_vref	=	reg_ana_amp1_inp_REG[8 : 8];
	assign	bus_left_hgbw_opamp_p_to_voutref	=	reg_ana_amp1_inp_REG[9 : 9];
	assign	bus_left_hgbw_opamp_p_to_gpio2_1	=	reg_ana_amp1_inp_REG[11 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp1_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp1_inp_REG_OFFSET))
                                            reg_ana_amp1_inp_REG <= PWDATA[12-1:0];

	reg [12:0]	reg_ana_amp1_inn_REG;
	assign	bus_left_hgbw_opamp_n_to_gpio5_3	=	reg_ana_amp1_inn_REG[1 : 0];
	assign	bus_left_hgbw_opamp_n_to_dac1	=	reg_ana_amp1_inn_REG[2 : 2];
	assign	bus_left_hgbw_opamp_n_to_analog1	=	reg_ana_amp1_inn_REG[3 : 3];
	assign	bus_left_hgbw_opamp_n_to_amuxbusB	=	reg_ana_amp1_inn_REG[4 : 4];
	assign	bus_left_hgbw_opamp_n_to_rheostat_out	=	reg_ana_amp1_inn_REG[5 : 5];
	assign	bus_left_hgbw_opamp_n_to_rheostat_tap	=	reg_ana_amp1_inn_REG[6 : 6];
	assign	bus_left_hgbw_opamp_n_to_sio1	=	reg_ana_amp1_inn_REG[7 : 7];
	assign	bus_left_hgbw_opamp_n_to_vbgtc	=	reg_ana_amp1_inn_REG[8 : 8];
	assign	bus_left_hgbw_opamp_n_to_right_vref	=	reg_ana_amp1_inn_REG[9 : 9];
	assign	bus_left_hgbw_opamp_n_to_vinref	=	reg_ana_amp1_inn_REG[10 : 10];
	assign	bus_left_hgbw_opamp_n_to_gpio2_0	=	reg_ana_amp1_inn_REG[12 : 11];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp1_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp1_inn_REG_OFFSET))
                                            reg_ana_amp1_inn_REG <= PWDATA[13-1:0];

	reg [8:0]	reg_ana_amp0_inp_REG;
	assign	bus_left_lp_opamp_p_to_gpio5_4	=	reg_ana_amp0_inp_REG[1 : 0];
	assign	bus_left_lp_opamp_p_to_dac0	=	reg_ana_amp0_inp_REG[2 : 2];
	assign	bus_left_lp_opamp_p_to_analog0	=	reg_ana_amp0_inp_REG[3 : 3];
	assign	bus_left_lp_opamp_p_to_amuxbusA	=	reg_ana_amp0_inp_REG[4 : 4];
	assign	bus_left_lp_opamp_p_to_rheostat_out	=	reg_ana_amp0_inp_REG[5 : 5];
	assign	bus_left_lp_opamp_p_to_sio0	=	reg_ana_amp0_inp_REG[6 : 6];
	assign	bus_left_lp_opamp_p_to_left_vref	=	reg_ana_amp0_inp_REG[7 : 7];
	assign	bus_left_lp_opamp_p_to_voutref	=	reg_ana_amp0_inp_REG[8 : 8];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp0_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp0_inp_REG_OFFSET))
                                            reg_ana_amp0_inp_REG <= PWDATA[9-1:0];

	reg [10:0]	reg_ana_amp0_inn_REG;
	assign	bus_left_lp_opamp_n_to_gpio5_5	=	reg_ana_amp0_inn_REG[1 : 0];
	assign	bus_left_lp_opamp_n_to_dac1	=	reg_ana_amp0_inn_REG[2 : 2];
	assign	bus_left_lp_opamp_n_to_analog1	=	reg_ana_amp0_inn_REG[3 : 3];
	assign	bus_left_lp_opamp_n_to_amuxbusB	=	reg_ana_amp0_inn_REG[4 : 4];
	assign	bus_left_lp_opamp_n_to_rheostat_out	=	reg_ana_amp0_inn_REG[5 : 5];
	assign	bus_left_lp_opamp_n_to_rheostat_tap	=	reg_ana_amp0_inn_REG[6 : 6];
	assign	bus_left_lp_opamp_n_to_sio1	=	reg_ana_amp0_inn_REG[7 : 7];
	assign	bus_left_lp_opamp_n_to_vbgsc	=	reg_ana_amp0_inn_REG[8 : 8];
	assign	bus_left_lp_opamp_n_to_right_vref	=	reg_ana_amp0_inn_REG[9 : 9];
	assign	bus_left_lp_opamp_n_to_vinref	=	reg_ana_amp0_inn_REG[10 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_amp0_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_amp0_inn_REG_OFFSET))
                                            reg_ana_amp0_inn_REG <= PWDATA[11-1:0];

	reg [11:0]	reg_ana_preamp0_out_REG;
	assign	bus_left_instramp_to_ulpcomp_p	=	reg_ana_preamp0_out_REG[1 : 0];
	assign	bus_left_instramp_to_comp_p	=	reg_ana_preamp0_out_REG[3 : 2];
	assign	bus_left_instramp_to_adc0	=	reg_ana_preamp0_out_REG[5 : 4];
	assign	bus_left_instramp_to_gpio4_4	=	reg_ana_preamp0_out_REG[7 : 6];
	assign	bus_left_instramp_to_analog1	=	reg_ana_preamp0_out_REG[9 : 8];
	assign	bus_left_instramp_to_amuxbusB	=	reg_ana_preamp0_out_REG[11 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_preamp0_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_preamp0_out_REG_OFFSET))
                                            reg_ana_preamp0_out_REG <= PWDATA[12-1:0];

	reg [11:0]	reg_ana_preamp1_out_REG;
	assign	bus_right_instramp_to_ulpcomp_n	=	reg_ana_preamp1_out_REG[1 : 0];
	assign	bus_right_instramp_to_comp_n	=	reg_ana_preamp1_out_REG[3 : 2];
	assign	bus_right_instramp_to_adc1	=	reg_ana_preamp1_out_REG[5 : 4];
	assign	bus_right_instramp_to_analog0	=	reg_ana_preamp1_out_REG[7 : 6];
	assign	bus_right_instramp_to_amuxbusA	=	reg_ana_preamp1_out_REG[9 : 8];
	assign	bus_right_instramp_to_gpio3_0	=	reg_ana_preamp1_out_REG[11 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_preamp1_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_preamp1_out_REG_OFFSET))
                                            reg_ana_preamp1_out_REG <= PWDATA[12-1:0];

	reg [6:0]	reg_ana_preamp0_inn_REG;
	assign	bus_left_instramp_n_to_gpio5_7	=	reg_ana_preamp0_inn_REG[1 : 0];
	assign	bus_left_instramp_n_to_analog1	=	reg_ana_preamp0_inn_REG[2 : 2];
	assign	bus_left_instramp_n_to_amuxbusB	=	reg_ana_preamp0_inn_REG[3 : 3];
	assign	bus_left_instramp_n_to_sio1	=	reg_ana_preamp0_inn_REG[4 : 4];
	assign	bus_left_instramp_n_to_right_vref	=	reg_ana_preamp0_inn_REG[5 : 5];
	assign	bus_left_instramp_n_to_vinref	=	reg_ana_preamp0_inn_REG[6 : 6];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_preamp0_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_preamp0_inn_REG_OFFSET))
                                            reg_ana_preamp0_inn_REG <= PWDATA[7-1:0];

	reg [7:0]	reg_ana_preamp0_inp_REG;
	assign	bus_left_instramp_p_to_gpio5_6	=	reg_ana_preamp0_inp_REG[1 : 0];
	assign	bus_left_instramp_p_to_analog0	=	reg_ana_preamp0_inp_REG[2 : 2];
	assign	bus_left_instramp_p_to_amuxbusA	=	reg_ana_preamp0_inp_REG[3 : 3];
	assign	bus_left_instramp_p_to_sio0	=	reg_ana_preamp0_inp_REG[4 : 4];
	assign	bus_left_instramp_p_to_tempsense	=	reg_ana_preamp0_inp_REG[5 : 5];
	assign	bus_left_instramp_p_to_left_vref	=	reg_ana_preamp0_inp_REG[6 : 6];
	assign	bus_left_instramp_p_to_voutref	=	reg_ana_preamp0_inp_REG[7 : 7];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_preamp0_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_preamp0_inp_REG_OFFSET))
                                            reg_ana_preamp0_inp_REG <= PWDATA[8-1:0];

	reg [6:0]	reg_ana_preamp1_inn_REG;
	assign	bus_right_instramp_n_to_analog1	=	reg_ana_preamp1_inn_REG[0 : 0];
	assign	bus_right_instramp_n_to_amuxbusB	=	reg_ana_preamp1_inn_REG[1 : 1];
	assign	bus_right_instramp_n_to_sio1	=	reg_ana_preamp1_inn_REG[2 : 2];
	assign	bus_right_instramp_n_to_right_vref	=	reg_ana_preamp1_inn_REG[3 : 3];
	assign	bus_right_instramp_n_to_vinref	=	reg_ana_preamp1_inn_REG[4 : 4];
	assign	bus_right_instramp_n_to_gpio2_6	=	reg_ana_preamp1_inn_REG[6 : 5];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_preamp1_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_preamp1_inn_REG_OFFSET))
                                            reg_ana_preamp1_inn_REG <= PWDATA[7-1:0];

	reg [7:0]	reg_ana_preamp1_inp_REG;
	assign	bus_right_instramp_p_to_analog0	=	reg_ana_preamp1_inp_REG[0 : 0];
	assign	bus_right_instramp_p_to_amuxbusA	=	reg_ana_preamp1_inp_REG[1 : 1];
	assign	bus_right_instramp_p_to_sio0	=	reg_ana_preamp1_inp_REG[2 : 2];
	assign	bus_right_instramp_p_to_tempsense	=	reg_ana_preamp1_inp_REG[3 : 3];
	assign	bus_right_instramp_p_to_left_vref	=	reg_ana_preamp1_inp_REG[4 : 4];
	assign	bus_right_instramp_p_to_voutref	=	reg_ana_preamp1_inp_REG[5 : 5];
	assign	bus_right_instramp_p_to_gpio2_7	=	reg_ana_preamp1_inp_REG[7 : 6];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_preamp1_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_preamp1_inp_REG_OFFSET))
                                            reg_ana_preamp1_inp_REG <= PWDATA[8-1:0];

	reg [10:0]	reg_ana_comp1_inp_REG;
	assign	bus_ulpcomp_p_to_dac0	=	reg_ana_comp1_inp_REG[0 : 0];
	assign	bus_ulpcomp_p_to_analog1	=	reg_ana_comp1_inp_REG[1 : 1];
	assign	bus_ulpcomp_p_to_sio0	=	reg_ana_comp1_inp_REG[2 : 2];
	assign	bus_ulpcomp_p_to_vbgtc	=	reg_ana_comp1_inp_REG[3 : 3];
	assign	bus_ulpcomp_p_to_tempsense	=	reg_ana_comp1_inp_REG[4 : 4];
	assign	bus_ulpcomp_p_to_left_vref	=	reg_ana_comp1_inp_REG[5 : 5];
	assign	bus_ulpcomp_p_to_voutref	=	reg_ana_comp1_inp_REG[6 : 6];
	assign	bus_ulpcomp_p_to_gpio6_0	=	reg_ana_comp1_inp_REG[8 : 7];
	assign	bus_ulpcomp_p_to_gpio1_7	=	reg_ana_comp1_inp_REG[10 : 9];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_comp1_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_comp1_inp_REG_OFFSET))
                                            reg_ana_comp1_inp_REG <= PWDATA[11-1:0];

	reg [9:0]	reg_ana_comp1_inn_REG;
	assign	bus_ulpcomp_n_to_dac1	=	reg_ana_comp1_inn_REG[0 : 0];
	assign	bus_ulpcomp_n_to_analog0	=	reg_ana_comp1_inn_REG[1 : 1];
	assign	bus_ulpcomp_n_to_sio1	=	reg_ana_comp1_inn_REG[2 : 2];
	assign	bus_ulpcomp_n_to_vbgsc	=	reg_ana_comp1_inn_REG[3 : 3];
	assign	bus_ulpcomp_n_to_right_vref	=	reg_ana_comp1_inn_REG[4 : 4];
	assign	bus_ulpcomp_n_to_vinref	=	reg_ana_comp1_inn_REG[5 : 5];
	assign	bus_ulpcomp_n_to_gpio6_1	=	reg_ana_comp1_inn_REG[7 : 6];
	assign	bus_ulpcomp_n_to_gpio1_6	=	reg_ana_comp1_inn_REG[9 : 8];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_comp1_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_comp1_inn_REG_OFFSET))
                                            reg_ana_comp1_inn_REG <= PWDATA[10-1:0];

	reg [10:0]	reg_ana_comp0_inp_REG;
	assign	bus_comp_p_to_dac0	=	reg_ana_comp0_inp_REG[0 : 0];
	assign	bus_comp_p_to_analog1	=	reg_ana_comp0_inp_REG[1 : 1];
	assign	bus_comp_p_to_sio0	=	reg_ana_comp0_inp_REG[2 : 2];
	assign	bus_comp_p_to_vbgtc	=	reg_ana_comp0_inp_REG[3 : 3];
	assign	bus_comp_p_to_tempsense	=	reg_ana_comp0_inp_REG[4 : 4];
	assign	bus_comp_p_to_left_vref	=	reg_ana_comp0_inp_REG[5 : 5];
	assign	bus_comp_p_to_voutref	=	reg_ana_comp0_inp_REG[6 : 6];
	assign	bus_comp_p_to_gpio6_2	=	reg_ana_comp0_inp_REG[8 : 7];
	assign	bus_comp_p_to_gpio1_5	=	reg_ana_comp0_inp_REG[10 : 9];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_comp0_inp_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_comp0_inp_REG_OFFSET))
                                            reg_ana_comp0_inp_REG <= PWDATA[11-1:0];

	reg [9:0]	reg_ana_comp0_inn_REG;
	assign	bus_comp_n_to_dac1	=	reg_ana_comp0_inn_REG[0 : 0];
	assign	bus_comp_n_to_analog0	=	reg_ana_comp0_inn_REG[1 : 1];
	assign	bus_comp_n_to_sio1	=	reg_ana_comp0_inn_REG[2 : 2];
	assign	bus_comp_n_to_vbgsc	=	reg_ana_comp0_inn_REG[3 : 3];
	assign	bus_comp_n_to_right_vref	=	reg_ana_comp0_inn_REG[4 : 4];
	assign	bus_comp_n_to_vinref	=	reg_ana_comp0_inn_REG[5 : 5];
	assign	bus_comp_n_to_gpio6_3	=	reg_ana_comp0_inn_REG[7 : 6];
	assign	bus_comp_n_to_gpio1_4	=	reg_ana_comp0_inn_REG[9 : 8];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_comp0_inn_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_comp0_inn_REG_OFFSET))
                                            reg_ana_comp0_inn_REG <= PWDATA[10-1:0];

	reg [9:0]	reg_ana_adc0_in_REG;
	assign	bus_adc0_to_dac0	=	reg_ana_adc0_in_REG[0 : 0];
	assign	bus_adc0_to_analog1	=	reg_ana_adc0_in_REG[1 : 1];
	assign	bus_adc0_to_vbgtc	=	reg_ana_adc0_in_REG[2 : 2];
	assign	bus_adc0_to_tempsense	=	reg_ana_adc0_in_REG[3 : 3];
	assign	bus_adc0_to_left_vref	=	reg_ana_adc0_in_REG[4 : 4];
	assign	bus_adc0_to_voutref	=	reg_ana_adc0_in_REG[5 : 5];
	assign	bus_adc0_to_gpio6_4	=	reg_ana_adc0_in_REG[7 : 6];
	assign	bus_adc0_to_gpio1_3	=	reg_ana_adc0_in_REG[9 : 8];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_adc0_in_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_adc0_in_REG_OFFSET))
                                            reg_ana_adc0_in_REG <= PWDATA[10-1:0];

	reg [8:0]	reg_ana_adc1_in_REG;
	assign	bus_adc1_to_dac1	=	reg_ana_adc1_in_REG[0 : 0];
	assign	bus_adc1_to_analog0	=	reg_ana_adc1_in_REG[1 : 1];
	assign	bus_adc1_to_vbgsc	=	reg_ana_adc1_in_REG[2 : 2];
	assign	bus_adc1_to_right_vref	=	reg_ana_adc1_in_REG[3 : 3];
	assign	bus_adc1_to_vinref	=	reg_ana_adc1_in_REG[4 : 4];
	assign	bus_adc1_to_gpio6_5	=	reg_ana_adc1_in_REG[6 : 5];
	assign	bus_adc1_to_gpio1_2	=	reg_ana_adc1_in_REG[8 : 7];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_adc1_in_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_adc1_in_REG_OFFSET))
                                            reg_ana_adc1_in_REG <= PWDATA[9-1:0];

	reg [3:0]	reg_ana_sio_iso_REG;
	assign	bus_sio0_connect	=	reg_ana_sio_iso_REG[1 : 0];
	assign	bus_sio1_connect	=	reg_ana_sio_iso_REG[3 : 2];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_sio_iso_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_sio_iso_REG_OFFSET))
                                            reg_ana_sio_iso_REG <= PWDATA[4-1:0];

	reg [3:0]	reg_ana_sio_ana_REG;
	assign	bus_analog0_connect	=	reg_ana_sio_ana_REG[1 : 0];
	assign	bus_analog1_connect	=	reg_ana_sio_ana_REG[3 : 2];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_sio_ana_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_sio_ana_REG_OFFSET))
                                            reg_ana_sio_ana_REG <= PWDATA[4-1:0];

	reg [20:0]	reg_ana_uproj_REG;
	assign	bus_vbgtc_to_user	=	reg_ana_uproj_REG[0 : 0];
	assign	bus_vbgsc_to_user	=	reg_ana_uproj_REG[1 : 1];
	assign	bus_user_to_comp_n	=	reg_ana_uproj_REG[3 : 2];
	assign	bus_user_to_comp_p	=	reg_ana_uproj_REG[5 : 4];
	assign	bus_user_to_ulpcomp_n	=	reg_ana_uproj_REG[7 : 6];
	assign	bus_user_to_ulpcomp_p	=	reg_ana_uproj_REG[9 : 8];
	assign	bus_user_to_adc0	=	reg_ana_uproj_REG[11 : 10];
	assign	bus_user_to_adc1	=	reg_ana_uproj_REG[13 : 12];
	assign	bus_dac0_to_user	=	reg_ana_uproj_REG[14 : 14];
	assign	bus_dac1_to_user	=	reg_ana_uproj_REG[15 : 15];
	assign	bus_tempsense_to_user	=	reg_ana_uproj_REG[16 : 16];
	assign	bus_right_vref_to_user	=	reg_ana_uproj_REG[17 : 17];
	assign	bus_left_vref_to_user	=	reg_ana_uproj_REG[18 : 18];
	assign	bus_vinref_to_user	=	reg_ana_uproj_REG[19 : 19];
	assign	bus_voutref_to_user	=	reg_ana_uproj_REG[20 : 20];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_uproj_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_uproj_REG_OFFSET))
                                            reg_ana_uproj_REG <= PWDATA[21-1:0];

	reg [5:0]	reg_ana_dac_out_REG;
	assign	bus_dac0_to_analog1	=	reg_ana_dac_out_REG[0 : 0];
	assign	bus_dac1_to_analog0	=	reg_ana_dac_out_REG[1 : 1];
	assign	bus_audiodac_out_to_analog1	=	reg_ana_dac_out_REG[3 : 2];
	assign	bus_audiodac_outb_to_analog0	=	reg_ana_dac_out_REG[5 : 4];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ana_dac_out_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ana_dac_out_REG_OFFSET))
                                            reg_ana_dac_out_REG <= PWDATA[6-1:0];

	reg [10:0]	reg_left_instramp_ctrl_REG;
	assign	bus_left_instramp_ena	=	reg_left_instramp_ctrl_REG[0 : 0];
	assign	bus_left_instramp_G1	=	reg_left_instramp_ctrl_REG[5 : 1];
	assign	bus_left_instramp_G2	=	reg_left_instramp_ctrl_REG[10 : 6];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_left_instramp_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_left_instramp_ctrl_REG_OFFSET))
                                            reg_left_instramp_ctrl_REG <= PWDATA[11-1:0];

	reg [17:0]	reg_left_opamp_ctrl_REG;
	assign	bus_left_hgbw_opamp_ena	=	reg_left_opamp_ctrl_REG[0 : 0];
	assign	bus_left_lp_opamp_ena	=	reg_left_opamp_ctrl_REG[1 : 1];
	assign	bus_left_rheostat1_b	=	reg_left_opamp_ctrl_REG[9 : 2];
	assign	bus_left_rheostat2_b	=	reg_left_opamp_ctrl_REG[17 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_left_opamp_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_left_opamp_ctrl_REG_OFFSET))
                                            reg_left_opamp_ctrl_REG <= PWDATA[18-1:0];

	reg [10:0]	reg_right_instramp_ctrl_REG;
	assign	bus_right_instramp_ena	=	reg_right_instramp_ctrl_REG[0 : 0];
	assign	bus_right_instramp_G1	=	reg_right_instramp_ctrl_REG[5 : 1];
	assign	bus_right_instramp_G2	=	reg_right_instramp_ctrl_REG[10 : 6];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_right_instramp_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_right_instramp_ctrl_REG_OFFSET))
                                            reg_right_instramp_ctrl_REG <= PWDATA[11-1:0];

	reg [17:0]	reg_right_opamp_ctrl_REG;
	assign	bus_right_hgbw_opamp_ena	=	reg_right_opamp_ctrl_REG[0 : 0];
	assign	bus_right_lp_opamp_ena	=	reg_right_opamp_ctrl_REG[1 : 1];
	assign	bus_right_rheostat1_b	=	reg_right_opamp_ctrl_REG[9 : 2];
	assign	bus_right_rheostat2_b	=	reg_right_opamp_ctrl_REG[17 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_right_opamp_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_right_opamp_ctrl_REG_OFFSET))
                                            reg_right_opamp_ctrl_REG <= PWDATA[18-1:0];

	reg [10:0]	reg_comparator_ctrl_REG;
	assign	bus_comp_ena	=	reg_comparator_ctrl_REG[0 : 0];
	assign	bus_comp_trim	=	reg_comparator_ctrl_REG[6 : 1];
	assign	bus_comp_hyst	=	reg_comparator_ctrl_REG[8 : 7];
	assign	bus_ulpcomp_ena	=	reg_comparator_ctrl_REG[9 : 9];
	assign	bus_ulpcomp_clk	=	reg_comparator_ctrl_REG[10 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_comparator_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_comparator_ctrl_REG_OFFSET))
                                            reg_comparator_ctrl_REG <= PWDATA[11-1:0];

	reg [24:0]	reg_bandgap_ctrl_REG;
	assign	bus_bandgap_ena	=	reg_bandgap_ctrl_REG[0 : 0];
	assign	bus_bandgap_trim	=	reg_bandgap_ctrl_REG[16 : 1];
	assign	bus_bandgap_sel	=	reg_bandgap_ctrl_REG[17 : 17];
	assign	bus_ldo_ena	=	reg_bandgap_ctrl_REG[18 : 18];
	assign	bus_overvoltage_ena	=	reg_bandgap_ctrl_REG[19 : 19];
	assign	bus_overvoltage_trim	=	reg_bandgap_ctrl_REG[23 : 20];
	assign	bus_ldo_ref_sel	=	reg_bandgap_ctrl_REG[24 : 24];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_bandgap_ctrl_REG <= 25'h40001;   // bandgap_ena and ldo_ena must be = 1 at power up
                                        else if(apb_we & (PADDR[16-1:0]==reg_bandgap_ctrl_REG_OFFSET))
                                            reg_bandgap_ctrl_REG <= PWDATA[25-1:0];

	reg [29:0]	reg_ibias_ctrl_REG;
	assign	bus_ibias_ena	=	reg_ibias_ctrl_REG[0 : 0];
	assign	bus_ibias_src_ena	=	reg_ibias_ctrl_REG[24 : 1];
	assign	bus_ibias_snk_ena	=	reg_ibias_ctrl_REG[28 : 25];
	assign	bus_ibias_ref_select	=	reg_ibias_ctrl_REG[29 : 29];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_ibias_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_ibias_ctrl_REG_OFFSET))
                                            reg_ibias_ctrl_REG <= PWDATA[30-1:0];

	reg [12:0]	reg_idac_ctrl_REG;
	assign	bus_idac_value	=	reg_idac_ctrl_REG[11 : 0];
	assign	bus_idac_ena	=	reg_idac_ctrl_REG[12 : 12];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_idac_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_idac_ctrl_REG_OFFSET))
                                            reg_idac_ctrl_REG <= PWDATA[13-1:0];

	reg [1:0]	reg_tempsense_ctrl_REG;
	assign	bus_tempsense_ena	=	reg_tempsense_ctrl_REG[0 : 0];
	assign	bus_tempsense_sel	=	reg_tempsense_ctrl_REG[1 : 1];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_tempsense_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_tempsense_ctrl_REG_OFFSET))
                                            reg_tempsense_ctrl_REG <= PWDATA[2-1:0];

	reg [25:0]	reg_rdac_ctrl_REG;
	assign	bus_rdac0_ena	=	reg_rdac_ctrl_REG[0 : 0];
	assign	bus_rdac0_value	=	reg_rdac_ctrl_REG[12 : 1];
	assign	bus_rdac1_ena	=	reg_rdac_ctrl_REG[13 : 13];
	assign	bus_rdac1_value	=	reg_rdac_ctrl_REG[25 : 14];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_rdac_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_rdac_ctrl_REG_OFFSET))
                                            reg_rdac_ctrl_REG <= PWDATA[26-1:0];

	reg [10:0]	reg_brownout_ctrl_REG;
	assign	bus_brownout_ena	=	reg_brownout_ctrl_REG[0 : 0];
	assign	bus_brownout_vtrip	=	reg_brownout_ctrl_REG[3 : 1];
	assign	bus_brownout_otrip	=	reg_brownout_ctrl_REG[6 : 4];
	assign	bus_brownout_isrc_sel	=	reg_brownout_ctrl_REG[7 : 7];
	assign	bus_brownout_oneshot	=	reg_brownout_ctrl_REG[8 : 8];
	assign	bus_brownout_rc_ena	=	reg_brownout_ctrl_REG[9 : 9];
	assign	bus_brownout_rc_dis	=	reg_brownout_ctrl_REG[10 : 10];
	always @(posedge PCLK or negedge PRESETn) if(~PRESETn) reg_brownout_ctrl_REG <= 0;
                                        else if(apb_we & (PADDR[16-1:0]==reg_brownout_ctrl_REG_OFFSET))
                                            reg_brownout_ctrl_REG <= PWDATA[11-1:0];

	wire [4-1:0]	reg_brownout_output_WIRE;
	assign	reg_brownout_output_WIRE[0 : 0] = bus_brownout_vunder;
	assign	reg_brownout_output_WIRE[1 : 1] = bus_brownout_timeout;
	assign	reg_brownout_output_WIRE[2 : 2] = bus_brownout_filt;
	assign	reg_brownout_output_WIRE[3 : 3] = bus_brownout_unfilt;

	wire [1-1:0]	reg_comparator0_out_WIRE;
	assign	reg_comparator0_out_WIRE = bus_comp_out;

	wire [1-1:0]	reg_comparator1_out_WIRE;
	assign	reg_comparator1_out_WIRE = bus_ulpcomp_out;

	wire [1-1:0]	reg_overvoltage_out_WIRE;
	assign	reg_overvoltage_out_WIRE = bus_overvoltage_out;

	wire [1-1:0]	reg_vdda1_pwr_good_WIRE;
	assign	reg_vdda1_pwr_good_WIRE = bus_vdda1_pwr_good;

	wire [1-1:0]	reg_vccd1_pwr_good_WIRE;
	assign	reg_vccd1_pwr_good_WIRE = bus_vccd1_pwr_good;

	wire [1-1:0]	reg_vdda2_pwr_good_WIRE;
	assign	reg_vdda2_pwr_good_WIRE = bus_vdda2_pwr_good;

	wire [1-1:0]	reg_vccd2_pwr_good_WIRE;
	assign	reg_vccd2_pwr_good_WIRE = bus_vccd2_pwr_good;

	regs_analog_ctrl instance_to_wrap (
		.clk(clk),
		.rst_n(rst_n),
		.bus_ibias_test_to_gpio1_2(bus_ibias_test_to_gpio1_2),
		.bus_vbg_test_to_gpio1_1(bus_vbg_test_to_gpio1_1),
		.bus_idac_to_gpio1_3(bus_idac_to_gpio1_3),
		.bus_idac_to_gpio1_2(bus_idac_to_gpio1_2),
		.bus_adc_refh_to_gpio6_6(bus_adc_refh_to_gpio6_6),
		.bus_dac_refh_to_gpio1_1(bus_dac_refh_to_gpio1_1),
		.bus_adc_refl_to_gpio6_7(bus_adc_refl_to_gpio6_7),
		.bus_dac_refl_to_gpio1_0(bus_dac_refl_to_gpio1_0),
		.bus_right_lp_opamp_to_ulpcomp_p(bus_right_lp_opamp_to_ulpcomp_p),
		.bus_right_lp_opamp_to_comp_p(bus_right_lp_opamp_to_comp_p),
		.bus_right_lp_opamp_to_adc0(bus_right_lp_opamp_to_adc0),
		.bus_right_lp_opamp_to_gpio4_7(bus_right_lp_opamp_to_gpio4_7),
		.bus_right_lp_opamp_to_gpio4_3(bus_right_lp_opamp_to_gpio4_3),
		.bus_right_lp_opamp_to_analog1(bus_right_lp_opamp_to_analog1),
		.bus_right_lp_opamp_to_amuxbusB(bus_right_lp_opamp_to_amuxbusB),
		.bus_right_lp_opamp_to_gpio3_7(bus_right_lp_opamp_to_gpio3_7),
		.bus_right_lp_opamp_to_gpio3_3(bus_right_lp_opamp_to_gpio3_3),
		.bus_right_hgbw_opamp_to_ulpcomp_n(bus_right_hgbw_opamp_to_ulpcomp_n),
		.bus_right_hgbw_opamp_to_comp_n(bus_right_hgbw_opamp_to_comp_n),
		.bus_right_hgbw_opamp_to_adc1(bus_right_hgbw_opamp_to_adc1),
		.bus_right_hgbw_opamp_to_gpio4_6(bus_right_hgbw_opamp_to_gpio4_6),
		.bus_right_hgbw_opamp_to_gpio4_2(bus_right_hgbw_opamp_to_gpio4_2),
		.bus_right_hgbw_opamp_to_analog0(bus_right_hgbw_opamp_to_analog0),
		.bus_right_hgbw_opamp_to_amuxbusA(bus_right_hgbw_opamp_to_amuxbusA),
		.bus_right_hgbw_opamp_to_gpio3_6(bus_right_hgbw_opamp_to_gpio3_6),
		.bus_right_hgbw_opamp_to_gpio3_2(bus_right_hgbw_opamp_to_gpio3_2),
		.bus_left_hgbw_opamp_to_ulpcomp_p(bus_left_hgbw_opamp_to_ulpcomp_p),
		.bus_left_hgbw_opamp_to_comp_p(bus_left_hgbw_opamp_to_comp_p),
		.bus_left_hgbw_opamp_to_adc0(bus_left_hgbw_opamp_to_adc0),
		.bus_left_hgbw_opamp_to_gpio4_5(bus_left_hgbw_opamp_to_gpio4_5),
		.bus_left_hgbw_opamp_to_gpio4_1(bus_left_hgbw_opamp_to_gpio4_1),
		.bus_left_hgbw_opamp_to_analog1(bus_left_hgbw_opamp_to_analog1),
		.bus_left_hgbw_opamp_to_amuxbusB(bus_left_hgbw_opamp_to_amuxbusB),
		.bus_left_hgbw_opamp_to_gpio3_5(bus_left_hgbw_opamp_to_gpio3_5),
		.bus_left_hgbw_opamp_to_gpio3_1(bus_left_hgbw_opamp_to_gpio3_1),
		.bus_left_lp_opamp_to_ulpcomp_n(bus_left_lp_opamp_to_ulpcomp_n),
		.bus_left_lp_opamp_to_comp_n(bus_left_lp_opamp_to_comp_n),
		.bus_left_lp_opamp_to_adc1(bus_left_lp_opamp_to_adc1),
		.bus_left_lp_opamp_to_gpio4_0(bus_left_lp_opamp_to_gpio4_0),
		.bus_left_lp_opamp_to_analog0(bus_left_lp_opamp_to_analog0),
		.bus_left_lp_opamp_to_amuxbusA(bus_left_lp_opamp_to_amuxbusA),
		.bus_left_lp_opamp_to_gpio3_4(bus_left_lp_opamp_to_gpio3_4),
		.bus_right_lp_opamp_p_to_dac0(bus_right_lp_opamp_p_to_dac0),
		.bus_right_lp_opamp_p_to_analog0(bus_right_lp_opamp_p_to_analog0),
		.bus_right_lp_opamp_p_to_amuxbusA(bus_right_lp_opamp_p_to_amuxbusA),
		.bus_right_lp_opamp_p_to_rheostat_out(bus_right_lp_opamp_p_to_rheostat_out),
		.bus_right_lp_opamp_p_to_sio0(bus_right_lp_opamp_p_to_sio0),
		.bus_right_lp_opamp_p_to_tempsense(bus_right_lp_opamp_p_to_tempsense),
		.bus_right_lp_opamp_p_to_left_vref(bus_right_lp_opamp_p_to_left_vref),
		.bus_right_lp_opamp_p_to_voutref(bus_right_lp_opamp_p_to_voutref),
		.bus_right_lp_opamp_p_to_gpio2_5(bus_right_lp_opamp_p_to_gpio2_5),
		.bus_right_lp_opamp_n_to_dac1(bus_right_lp_opamp_n_to_dac1),
		.bus_right_lp_opamp_n_to_analog1(bus_right_lp_opamp_n_to_analog1),
		.bus_right_lp_opamp_n_to_amuxbusB(bus_right_lp_opamp_n_to_amuxbusB),
		.bus_right_lp_opamp_n_to_rheostat_out(bus_right_lp_opamp_n_to_rheostat_out),
		.bus_right_lp_opamp_n_to_rheostat_tap(bus_right_lp_opamp_n_to_rheostat_tap),
		.bus_right_lp_opamp_n_to_sio1(bus_right_lp_opamp_n_to_sio1),
		.bus_right_lp_opamp_n_to_vbgtc(bus_right_lp_opamp_n_to_vbgtc),
		.bus_right_lp_opamp_n_to_right_vref(bus_right_lp_opamp_n_to_right_vref),
		.bus_right_lp_opamp_n_to_vinref(bus_right_lp_opamp_n_to_vinref),
		.bus_right_lp_opamp_n_to_gpio2_4(bus_right_lp_opamp_n_to_gpio2_4),
		.bus_right_hgbw_opamp_p_to_gpio5_0(bus_right_hgbw_opamp_p_to_gpio5_0),
		.bus_right_hgbw_opamp_p_to_dac0(bus_right_hgbw_opamp_p_to_dac0),
		.bus_right_hgbw_opamp_p_to_analog0(bus_right_hgbw_opamp_p_to_analog0),
		.bus_right_hgbw_opamp_p_to_amuxbusA(bus_right_hgbw_opamp_p_to_amuxbusA),
		.bus_right_hgbw_opamp_p_to_rheostat_out(bus_right_hgbw_opamp_p_to_rheostat_out),
		.bus_right_hgbw_opamp_p_to_sio0(bus_right_hgbw_opamp_p_to_sio0),
		.bus_right_hgbw_opamp_p_to_left_vref(bus_right_hgbw_opamp_p_to_left_vref),
		.bus_right_hgbw_opamp_p_to_voutref(bus_right_hgbw_opamp_p_to_voutref),
		.bus_right_hgbw_opamp_p_to_gpio2_3(bus_right_hgbw_opamp_p_to_gpio2_3),
		.bus_right_hgbw_opamp_n_to_gpio5_1(bus_right_hgbw_opamp_n_to_gpio5_1),
		.bus_right_hgbw_opamp_n_to_dac1(bus_right_hgbw_opamp_n_to_dac1),
		.bus_right_hgbw_opamp_n_to_analog1(bus_right_hgbw_opamp_n_to_analog1),
		.bus_right_hgbw_opamp_n_to_amuxbusB(bus_right_hgbw_opamp_n_to_amuxbusB),
		.bus_right_hgbw_opamp_n_to_rheostat_out(bus_right_hgbw_opamp_n_to_rheostat_out),
		.bus_right_hgbw_opamp_n_to_rheostat_tap(bus_right_hgbw_opamp_n_to_rheostat_tap),
		.bus_right_hgbw_opamp_n_to_sio1(bus_right_hgbw_opamp_n_to_sio1),
		.bus_right_hgbw_opamp_n_to_vbgsc(bus_right_hgbw_opamp_n_to_vbgsc),
		.bus_right_hgbw_opamp_n_to_right_vref(bus_right_hgbw_opamp_n_to_right_vref),
		.bus_right_hgbw_opamp_n_to_vinref(bus_right_hgbw_opamp_n_to_vinref),
		.bus_right_hgbw_opamp_n_to_gpio2_2(bus_right_hgbw_opamp_n_to_gpio2_2),
		.bus_left_hgbw_opamp_p_to_gpio5_2(bus_left_hgbw_opamp_p_to_gpio5_2),
		.bus_left_hgbw_opamp_p_to_dac0(bus_left_hgbw_opamp_p_to_dac0),
		.bus_left_hgbw_opamp_p_to_analog0(bus_left_hgbw_opamp_p_to_analog0),
		.bus_left_hgbw_opamp_p_to_amuxbusA(bus_left_hgbw_opamp_p_to_amuxbusA),
		.bus_left_hgbw_opamp_p_to_rheostat_out(bus_left_hgbw_opamp_p_to_rheostat_out),
		.bus_left_hgbw_opamp_p_to_sio0(bus_left_hgbw_opamp_p_to_sio0),
		.bus_left_hgbw_opamp_p_to_tempsense(bus_left_hgbw_opamp_p_to_tempsense),
		.bus_left_hgbw_opamp_p_to_left_vref(bus_left_hgbw_opamp_p_to_left_vref),
		.bus_left_hgbw_opamp_p_to_voutref(bus_left_hgbw_opamp_p_to_voutref),
		.bus_left_hgbw_opamp_p_to_gpio2_1(bus_left_hgbw_opamp_p_to_gpio2_1),
		.bus_left_hgbw_opamp_n_to_gpio5_3(bus_left_hgbw_opamp_n_to_gpio5_3),
		.bus_left_hgbw_opamp_n_to_dac1(bus_left_hgbw_opamp_n_to_dac1),
		.bus_left_hgbw_opamp_n_to_analog1(bus_left_hgbw_opamp_n_to_analog1),
		.bus_left_hgbw_opamp_n_to_amuxbusB(bus_left_hgbw_opamp_n_to_amuxbusB),
		.bus_left_hgbw_opamp_n_to_rheostat_out(bus_left_hgbw_opamp_n_to_rheostat_out),
		.bus_left_hgbw_opamp_n_to_rheostat_tap(bus_left_hgbw_opamp_n_to_rheostat_tap),
		.bus_left_hgbw_opamp_n_to_sio1(bus_left_hgbw_opamp_n_to_sio1),
		.bus_left_hgbw_opamp_n_to_vbgtc(bus_left_hgbw_opamp_n_to_vbgtc),
		.bus_left_hgbw_opamp_n_to_right_vref(bus_left_hgbw_opamp_n_to_right_vref),
		.bus_left_hgbw_opamp_n_to_vinref(bus_left_hgbw_opamp_n_to_vinref),
		.bus_left_hgbw_opamp_n_to_gpio2_0(bus_left_hgbw_opamp_n_to_gpio2_0),
		.bus_left_lp_opamp_p_to_gpio5_4(bus_left_lp_opamp_p_to_gpio5_4),
		.bus_left_lp_opamp_p_to_dac0(bus_left_lp_opamp_p_to_dac0),
		.bus_left_lp_opamp_p_to_analog0(bus_left_lp_opamp_p_to_analog0),
		.bus_left_lp_opamp_p_to_amuxbusA(bus_left_lp_opamp_p_to_amuxbusA),
		.bus_left_lp_opamp_p_to_rheostat_out(bus_left_lp_opamp_p_to_rheostat_out),
		.bus_left_lp_opamp_p_to_sio0(bus_left_lp_opamp_p_to_sio0),
		.bus_left_lp_opamp_p_to_left_vref(bus_left_lp_opamp_p_to_left_vref),
		.bus_left_lp_opamp_p_to_voutref(bus_left_lp_opamp_p_to_voutref),
		.bus_left_lp_opamp_n_to_gpio5_5(bus_left_lp_opamp_n_to_gpio5_5),
		.bus_left_lp_opamp_n_to_dac1(bus_left_lp_opamp_n_to_dac1),
		.bus_left_lp_opamp_n_to_analog1(bus_left_lp_opamp_n_to_analog1),
		.bus_left_lp_opamp_n_to_amuxbusB(bus_left_lp_opamp_n_to_amuxbusB),
		.bus_left_lp_opamp_n_to_rheostat_out(bus_left_lp_opamp_n_to_rheostat_out),
		.bus_left_lp_opamp_n_to_rheostat_tap(bus_left_lp_opamp_n_to_rheostat_tap),
		.bus_left_lp_opamp_n_to_sio1(bus_left_lp_opamp_n_to_sio1),
		.bus_left_lp_opamp_n_to_vbgsc(bus_left_lp_opamp_n_to_vbgsc),
		.bus_left_lp_opamp_n_to_right_vref(bus_left_lp_opamp_n_to_right_vref),
		.bus_left_lp_opamp_n_to_vinref(bus_left_lp_opamp_n_to_vinref),
		.bus_left_instramp_to_ulpcomp_p(bus_left_instramp_to_ulpcomp_p),
		.bus_left_instramp_to_comp_p(bus_left_instramp_to_comp_p),
		.bus_left_instramp_to_adc0(bus_left_instramp_to_adc0),
		.bus_left_instramp_to_gpio4_4(bus_left_instramp_to_gpio4_4),
		.bus_left_instramp_to_analog1(bus_left_instramp_to_analog1),
		.bus_left_instramp_to_amuxbusB(bus_left_instramp_to_amuxbusB),
		.bus_right_instramp_to_ulpcomp_n(bus_right_instramp_to_ulpcomp_n),
		.bus_right_instramp_to_comp_n(bus_right_instramp_to_comp_n),
		.bus_right_instramp_to_adc1(bus_right_instramp_to_adc1),
		.bus_right_instramp_to_analog0(bus_right_instramp_to_analog0),
		.bus_right_instramp_to_amuxbusA(bus_right_instramp_to_amuxbusA),
		.bus_right_instramp_to_gpio3_0(bus_right_instramp_to_gpio3_0),
		.bus_left_instramp_n_to_gpio5_7(bus_left_instramp_n_to_gpio5_7),
		.bus_left_instramp_n_to_analog1(bus_left_instramp_n_to_analog1),
		.bus_left_instramp_n_to_amuxbusB(bus_left_instramp_n_to_amuxbusB),
		.bus_left_instramp_n_to_sio1(bus_left_instramp_n_to_sio1),
		.bus_left_instramp_n_to_right_vref(bus_left_instramp_n_to_right_vref),
		.bus_left_instramp_n_to_vinref(bus_left_instramp_n_to_vinref),
		.bus_left_instramp_p_to_gpio5_6(bus_left_instramp_p_to_gpio5_6),
		.bus_left_instramp_p_to_analog0(bus_left_instramp_p_to_analog0),
		.bus_left_instramp_p_to_amuxbusA(bus_left_instramp_p_to_amuxbusA),
		.bus_left_instramp_p_to_sio0(bus_left_instramp_p_to_sio0),
		.bus_left_instramp_p_to_tempsense(bus_left_instramp_p_to_tempsense),
		.bus_left_instramp_p_to_left_vref(bus_left_instramp_p_to_left_vref),
		.bus_left_instramp_p_to_voutref(bus_left_instramp_p_to_voutref),
		.bus_right_instramp_n_to_analog1(bus_right_instramp_n_to_analog1),
		.bus_right_instramp_n_to_amuxbusB(bus_right_instramp_n_to_amuxbusB),
		.bus_right_instramp_n_to_sio1(bus_right_instramp_n_to_sio1),
		.bus_right_instramp_n_to_right_vref(bus_right_instramp_n_to_right_vref),
		.bus_right_instramp_n_to_vinref(bus_right_instramp_n_to_vinref),
		.bus_right_instramp_n_to_gpio2_6(bus_right_instramp_n_to_gpio2_6),
		.bus_right_instramp_p_to_analog0(bus_right_instramp_p_to_analog0),
		.bus_right_instramp_p_to_amuxbusA(bus_right_instramp_p_to_amuxbusA),
		.bus_right_instramp_p_to_sio0(bus_right_instramp_p_to_sio0),
		.bus_right_instramp_p_to_tempsense(bus_right_instramp_p_to_tempsense),
		.bus_right_instramp_p_to_left_vref(bus_right_instramp_p_to_left_vref),
		.bus_right_instramp_p_to_voutref(bus_right_instramp_p_to_voutref),
		.bus_right_instramp_p_to_gpio2_7(bus_right_instramp_p_to_gpio2_7),
		.bus_ulpcomp_p_to_dac0(bus_ulpcomp_p_to_dac0),
		.bus_ulpcomp_p_to_analog1(bus_ulpcomp_p_to_analog1),
		.bus_ulpcomp_p_to_sio0(bus_ulpcomp_p_to_sio0),
		.bus_ulpcomp_p_to_vbgtc(bus_ulpcomp_p_to_vbgtc),
		.bus_ulpcomp_p_to_tempsense(bus_ulpcomp_p_to_tempsense),
		.bus_ulpcomp_p_to_left_vref(bus_ulpcomp_p_to_left_vref),
		.bus_ulpcomp_p_to_voutref(bus_ulpcomp_p_to_voutref),
		.bus_ulpcomp_p_to_gpio6_0(bus_ulpcomp_p_to_gpio6_0),
		.bus_ulpcomp_p_to_gpio1_7(bus_ulpcomp_p_to_gpio1_7),
		.bus_ulpcomp_n_to_dac1(bus_ulpcomp_n_to_dac1),
		.bus_ulpcomp_n_to_analog0(bus_ulpcomp_n_to_analog0),
		.bus_ulpcomp_n_to_sio1(bus_ulpcomp_n_to_sio1),
		.bus_ulpcomp_n_to_vbgsc(bus_ulpcomp_n_to_vbgsc),
		.bus_ulpcomp_n_to_right_vref(bus_ulpcomp_n_to_right_vref),
		.bus_ulpcomp_n_to_vinref(bus_ulpcomp_n_to_vinref),
		.bus_ulpcomp_n_to_gpio6_1(bus_ulpcomp_n_to_gpio6_1),
		.bus_ulpcomp_n_to_gpio1_6(bus_ulpcomp_n_to_gpio1_6),
		.bus_comp_p_to_dac0(bus_comp_p_to_dac0),
		.bus_comp_p_to_analog1(bus_comp_p_to_analog1),
		.bus_comp_p_to_sio0(bus_comp_p_to_sio0),
		.bus_comp_p_to_vbgtc(bus_comp_p_to_vbgtc),
		.bus_comp_p_to_tempsense(bus_comp_p_to_tempsense),
		.bus_comp_p_to_left_vref(bus_comp_p_to_left_vref),
		.bus_comp_p_to_voutref(bus_comp_p_to_voutref),
		.bus_comp_p_to_gpio6_2(bus_comp_p_to_gpio6_2),
		.bus_comp_p_to_gpio1_5(bus_comp_p_to_gpio1_5),
		.bus_comp_n_to_dac1(bus_comp_n_to_dac1),
		.bus_comp_n_to_analog0(bus_comp_n_to_analog0),
		.bus_comp_n_to_sio1(bus_comp_n_to_sio1),
		.bus_comp_n_to_vbgsc(bus_comp_n_to_vbgsc),
		.bus_comp_n_to_right_vref(bus_comp_n_to_right_vref),
		.bus_comp_n_to_vinref(bus_comp_n_to_vinref),
		.bus_comp_n_to_gpio6_3(bus_comp_n_to_gpio6_3),
		.bus_comp_n_to_gpio1_4(bus_comp_n_to_gpio1_4),
		.bus_adc0_to_dac0(bus_adc0_to_dac0),
		.bus_adc0_to_analog1(bus_adc0_to_analog1),
		.bus_adc0_to_vbgtc(bus_adc0_to_vbgtc),
		.bus_adc0_to_tempsense(bus_adc0_to_tempsense),
		.bus_adc0_to_left_vref(bus_adc0_to_left_vref),
		.bus_adc0_to_voutref(bus_adc0_to_voutref),
		.bus_adc0_to_gpio6_4(bus_adc0_to_gpio6_4),
		.bus_adc0_to_gpio1_3(bus_adc0_to_gpio1_3),
		.bus_adc1_to_dac1(bus_adc1_to_dac1),
		.bus_adc1_to_analog0(bus_adc1_to_analog0),
		.bus_adc1_to_vbgsc(bus_adc1_to_vbgsc),
		.bus_adc1_to_right_vref(bus_adc1_to_right_vref),
		.bus_adc1_to_vinref(bus_adc1_to_vinref),
		.bus_adc1_to_gpio6_5(bus_adc1_to_gpio6_5),
		.bus_adc1_to_gpio1_2(bus_adc1_to_gpio1_2),
		.bus_sio0_connect(bus_sio0_connect),
		.bus_sio1_connect(bus_sio1_connect),
		.bus_analog0_connect(bus_analog0_connect),
		.bus_analog1_connect(bus_analog1_connect),
		.bus_vbgtc_to_user(bus_vbgtc_to_user),
		.bus_vbgsc_to_user(bus_vbgsc_to_user),
		.bus_user_to_comp_n(bus_user_to_comp_n),
		.bus_user_to_comp_p(bus_user_to_comp_p),
		.bus_user_to_ulpcomp_n(bus_user_to_ulpcomp_n),
		.bus_user_to_ulpcomp_p(bus_user_to_ulpcomp_p),
		.bus_user_to_adc0(bus_user_to_adc0),
		.bus_user_to_adc1(bus_user_to_adc1),
		.bus_dac0_to_user(bus_dac0_to_user),
		.bus_dac1_to_user(bus_dac1_to_user),
		.bus_tempsense_to_user(bus_tempsense_to_user),
		.bus_right_vref_to_user(bus_right_vref_to_user),
		.bus_left_vref_to_user(bus_left_vref_to_user),
		.bus_vinref_to_user(bus_vinref_to_user),
		.bus_voutref_to_user(bus_voutref_to_user),
		.bus_dac0_to_analog1(bus_dac0_to_analog1),
		.bus_dac1_to_analog0(bus_dac1_to_analog0),
		.bus_audiodac_out_to_analog1(bus_audiodac_out_to_analog1),
		.bus_audiodac_outb_to_analog0(bus_audiodac_outb_to_analog0),
		.bus_left_instramp_ena(bus_left_instramp_ena),
		.bus_left_instramp_G1(bus_left_instramp_G1),
		.bus_left_instramp_G2(bus_left_instramp_G2),
		.bus_left_hgbw_opamp_ena(bus_left_hgbw_opamp_ena),
		.bus_left_lp_opamp_ena(bus_left_lp_opamp_ena),
		.bus_left_rheostat1_b(bus_left_rheostat1_b),
		.bus_left_rheostat2_b(bus_left_rheostat2_b),
		.bus_right_instramp_ena(bus_right_instramp_ena),
		.bus_right_instramp_G1(bus_right_instramp_G1),
		.bus_right_instramp_G2(bus_right_instramp_G2),
		.bus_right_hgbw_opamp_ena(bus_right_hgbw_opamp_ena),
		.bus_right_lp_opamp_ena(bus_right_lp_opamp_ena),
		.bus_right_rheostat1_b(bus_right_rheostat1_b),
		.bus_right_rheostat2_b(bus_right_rheostat2_b),
		.bus_comp_ena(bus_comp_ena),
		.bus_comp_trim(bus_comp_trim),
		.bus_comp_hyst(bus_comp_hyst),
		.bus_ulpcomp_ena(bus_ulpcomp_ena),
		.bus_ulpcomp_clk(bus_ulpcomp_clk),
		.bus_bandgap_ena(bus_bandgap_ena),
		.bus_bandgap_trim(bus_bandgap_trim),
		.bus_bandgap_sel(bus_bandgap_sel),
		.bus_ldo_ena(bus_ldo_ena),
		.bus_overvoltage_ena(bus_overvoltage_ena),
		.bus_overvoltage_trim(bus_overvoltage_trim),
		.bus_ldo_ref_sel(bus_ldo_ref_sel),
		.bus_ibias_ena(bus_ibias_ena),
		.bus_ibias_src_ena(bus_ibias_src_ena),
		.bus_ibias_snk_ena(bus_ibias_snk_ena),
		.bus_ibias_ref_select(bus_ibias_ref_select),
		.bus_idac_value(bus_idac_value),
		.bus_idac_ena(bus_idac_ena),
		.bus_tempsense_ena(bus_tempsense_ena),
		.bus_tempsense_sel(bus_tempsense_sel),
		.bus_rdac0_ena(bus_rdac0_ena),
		.bus_rdac0_value(bus_rdac0_value),
		.bus_rdac1_ena(bus_rdac1_ena),
		.bus_rdac1_value(bus_rdac1_value),
		.bus_brownout_ena(bus_brownout_ena),
		.bus_brownout_vtrip(bus_brownout_vtrip),
		.bus_brownout_otrip(bus_brownout_otrip),
		.bus_brownout_isrc_sel(bus_brownout_isrc_sel),
		.bus_brownout_oneshot(bus_brownout_oneshot),
		.bus_brownout_rc_ena(bus_brownout_rc_ena),
		.bus_brownout_rc_dis(bus_brownout_rc_dis),
		.bus_brownout_vunder(bus_brownout_vunder),
		.bus_brownout_timeout(bus_brownout_timeout),
		.bus_brownout_filt(bus_brownout_filt),
		.bus_brownout_unfilt(bus_brownout_unfilt),
		.bus_comp_out(bus_comp_out),
		.bus_ulpcomp_out(bus_ulpcomp_out),
		.bus_overvoltage_out(bus_overvoltage_out),
		.bus_vdda1_pwr_good(bus_vdda1_pwr_good),
		.bus_vccd1_pwr_good(bus_vccd1_pwr_good),
		.bus_vdda2_pwr_good(bus_vdda2_pwr_good),
		.bus_vccd2_pwr_good(bus_vccd2_pwr_good),
		.ibias_test_to_gpio1_2(ibias_test_to_gpio1_2),
		.vbg_test_to_gpio1_1(vbg_test_to_gpio1_1),
		.idac_to_gpio1_3(idac_to_gpio1_3),
		.idac_to_gpio1_2(idac_to_gpio1_2),
		.adc_refh_to_gpio6_6(adc_refh_to_gpio6_6),
		.dac_refh_to_gpio1_1(dac_refh_to_gpio1_1),
		.adc_refl_to_gpio6_7(adc_refl_to_gpio6_7),
		.dac_refl_to_gpio1_0(dac_refl_to_gpio1_0),
		.right_lp_opamp_to_ulpcomp_p(right_lp_opamp_to_ulpcomp_p),
		.right_lp_opamp_to_comp_p(right_lp_opamp_to_comp_p),
		.right_lp_opamp_to_adc0(right_lp_opamp_to_adc0),
		.right_lp_opamp_to_gpio4_7(right_lp_opamp_to_gpio4_7),
		.right_lp_opamp_to_gpio4_3(right_lp_opamp_to_gpio4_3),
		.right_lp_opamp_to_analog1(right_lp_opamp_to_analog1),
		.right_lp_opamp_to_amuxbusB(right_lp_opamp_to_amuxbusB),
		.right_lp_opamp_to_gpio3_7(right_lp_opamp_to_gpio3_7),
		.right_lp_opamp_to_gpio3_3(right_lp_opamp_to_gpio3_3),
		.right_hgbw_opamp_to_ulpcomp_n(right_hgbw_opamp_to_ulpcomp_n),
		.right_hgbw_opamp_to_comp_n(right_hgbw_opamp_to_comp_n),
		.right_hgbw_opamp_to_adc1(right_hgbw_opamp_to_adc1),
		.right_hgbw_opamp_to_gpio4_6(right_hgbw_opamp_to_gpio4_6),
		.right_hgbw_opamp_to_gpio4_2(right_hgbw_opamp_to_gpio4_2),
		.right_hgbw_opamp_to_analog0(right_hgbw_opamp_to_analog0),
		.right_hgbw_opamp_to_amuxbusA(right_hgbw_opamp_to_amuxbusA),
		.right_hgbw_opamp_to_gpio3_6(right_hgbw_opamp_to_gpio3_6),
		.right_hgbw_opamp_to_gpio3_2(right_hgbw_opamp_to_gpio3_2),
		.left_hgbw_opamp_to_ulpcomp_p(left_hgbw_opamp_to_ulpcomp_p),
		.left_hgbw_opamp_to_comp_p(left_hgbw_opamp_to_comp_p),
		.left_hgbw_opamp_to_adc0(left_hgbw_opamp_to_adc0),
		.left_hgbw_opamp_to_gpio4_5(left_hgbw_opamp_to_gpio4_5),
		.left_hgbw_opamp_to_gpio4_1(left_hgbw_opamp_to_gpio4_1),
		.left_hgbw_opamp_to_analog1(left_hgbw_opamp_to_analog1),
		.left_hgbw_opamp_to_amuxbusB(left_hgbw_opamp_to_amuxbusB),
		.left_hgbw_opamp_to_gpio3_5(left_hgbw_opamp_to_gpio3_5),
		.left_hgbw_opamp_to_gpio3_1(left_hgbw_opamp_to_gpio3_1),
		.left_lp_opamp_to_ulpcomp_n(left_lp_opamp_to_ulpcomp_n),
		.left_lp_opamp_to_comp_n(left_lp_opamp_to_comp_n),
		.left_lp_opamp_to_adc1(left_lp_opamp_to_adc1),
		.left_lp_opamp_to_gpio4_0(left_lp_opamp_to_gpio4_0),
		.left_lp_opamp_to_analog0(left_lp_opamp_to_analog0),
		.left_lp_opamp_to_amuxbusA(left_lp_opamp_to_amuxbusA),
		.left_lp_opamp_to_gpio3_4(left_lp_opamp_to_gpio3_4),
		.right_lp_opamp_p_to_dac0(right_lp_opamp_p_to_dac0),
		.right_lp_opamp_p_to_analog0(right_lp_opamp_p_to_analog0),
		.right_lp_opamp_p_to_amuxbusA(right_lp_opamp_p_to_amuxbusA),
		.right_lp_opamp_p_to_rheostat_out(right_lp_opamp_p_to_rheostat_out),
		.right_lp_opamp_p_to_sio0(right_lp_opamp_p_to_sio0),
		.right_lp_opamp_p_to_tempsense(right_lp_opamp_p_to_tempsense),
		.right_lp_opamp_p_to_left_vref(right_lp_opamp_p_to_left_vref),
		.right_lp_opamp_p_to_voutref(right_lp_opamp_p_to_voutref),
		.right_lp_opamp_p_to_gpio2_5(right_lp_opamp_p_to_gpio2_5),
		.right_lp_opamp_n_to_dac1(right_lp_opamp_n_to_dac1),
		.right_lp_opamp_n_to_analog1(right_lp_opamp_n_to_analog1),
		.right_lp_opamp_n_to_amuxbusB(right_lp_opamp_n_to_amuxbusB),
		.right_lp_opamp_n_to_rheostat_out(right_lp_opamp_n_to_rheostat_out),
		.right_lp_opamp_n_to_rheostat_tap(right_lp_opamp_n_to_rheostat_tap),
		.right_lp_opamp_n_to_sio1(right_lp_opamp_n_to_sio1),
		.right_lp_opamp_n_to_vbgtc(right_lp_opamp_n_to_vbgtc),
		.right_lp_opamp_n_to_right_vref(right_lp_opamp_n_to_right_vref),
		.right_lp_opamp_n_to_vinref(right_lp_opamp_n_to_vinref),
		.right_lp_opamp_n_to_gpio2_4(right_lp_opamp_n_to_gpio2_4),
		.right_hgbw_opamp_p_to_gpio5_0(right_hgbw_opamp_p_to_gpio5_0),
		.right_hgbw_opamp_p_to_dac0(right_hgbw_opamp_p_to_dac0),
		.right_hgbw_opamp_p_to_analog0(right_hgbw_opamp_p_to_analog0),
		.right_hgbw_opamp_p_to_amuxbusA(right_hgbw_opamp_p_to_amuxbusA),
		.right_hgbw_opamp_p_to_rheostat_out(right_hgbw_opamp_p_to_rheostat_out),
		.right_hgbw_opamp_p_to_sio0(right_hgbw_opamp_p_to_sio0),
		.right_hgbw_opamp_p_to_left_vref(right_hgbw_opamp_p_to_left_vref),
		.right_hgbw_opamp_p_to_voutref(right_hgbw_opamp_p_to_voutref),
		.right_hgbw_opamp_p_to_gpio2_3(right_hgbw_opamp_p_to_gpio2_3),
		.right_hgbw_opamp_n_to_gpio5_1(right_hgbw_opamp_n_to_gpio5_1),
		.right_hgbw_opamp_n_to_dac1(right_hgbw_opamp_n_to_dac1),
		.right_hgbw_opamp_n_to_analog1(right_hgbw_opamp_n_to_analog1),
		.right_hgbw_opamp_n_to_amuxbusB(right_hgbw_opamp_n_to_amuxbusB),
		.right_hgbw_opamp_n_to_rheostat_out(right_hgbw_opamp_n_to_rheostat_out),
		.right_hgbw_opamp_n_to_rheostat_tap(right_hgbw_opamp_n_to_rheostat_tap),
		.right_hgbw_opamp_n_to_sio1(right_hgbw_opamp_n_to_sio1),
		.right_hgbw_opamp_n_to_vbgsc(right_hgbw_opamp_n_to_vbgsc),
		.right_hgbw_opamp_n_to_right_vref(right_hgbw_opamp_n_to_right_vref),
		.right_hgbw_opamp_n_to_vinref(right_hgbw_opamp_n_to_vinref),
		.right_hgbw_opamp_n_to_gpio2_2(right_hgbw_opamp_n_to_gpio2_2),
		.left_hgbw_opamp_p_to_gpio5_2(left_hgbw_opamp_p_to_gpio5_2),
		.left_hgbw_opamp_p_to_dac0(left_hgbw_opamp_p_to_dac0),
		.left_hgbw_opamp_p_to_analog0(left_hgbw_opamp_p_to_analog0),
		.left_hgbw_opamp_p_to_amuxbusA(left_hgbw_opamp_p_to_amuxbusA),
		.left_hgbw_opamp_p_to_rheostat_out(left_hgbw_opamp_p_to_rheostat_out),
		.left_hgbw_opamp_p_to_sio0(left_hgbw_opamp_p_to_sio0),
		.left_hgbw_opamp_p_to_tempsense(left_hgbw_opamp_p_to_tempsense),
		.left_hgbw_opamp_p_to_left_vref(left_hgbw_opamp_p_to_left_vref),
		.left_hgbw_opamp_p_to_voutref(left_hgbw_opamp_p_to_voutref),
		.left_hgbw_opamp_p_to_gpio2_1(left_hgbw_opamp_p_to_gpio2_1),
		.left_hgbw_opamp_n_to_gpio5_3(left_hgbw_opamp_n_to_gpio5_3),
		.left_hgbw_opamp_n_to_dac1(left_hgbw_opamp_n_to_dac1),
		.left_hgbw_opamp_n_to_analog1(left_hgbw_opamp_n_to_analog1),
		.left_hgbw_opamp_n_to_amuxbusB(left_hgbw_opamp_n_to_amuxbusB),
		.left_hgbw_opamp_n_to_rheostat_out(left_hgbw_opamp_n_to_rheostat_out),
		.left_hgbw_opamp_n_to_rheostat_tap(left_hgbw_opamp_n_to_rheostat_tap),
		.left_hgbw_opamp_n_to_sio1(left_hgbw_opamp_n_to_sio1),
		.left_hgbw_opamp_n_to_vbgtc(left_hgbw_opamp_n_to_vbgtc),
		.left_hgbw_opamp_n_to_right_vref(left_hgbw_opamp_n_to_right_vref),
		.left_hgbw_opamp_n_to_vinref(left_hgbw_opamp_n_to_vinref),
		.left_hgbw_opamp_n_to_gpio2_0(left_hgbw_opamp_n_to_gpio2_0),
		.left_lp_opamp_p_to_gpio5_4(left_lp_opamp_p_to_gpio5_4),
		.left_lp_opamp_p_to_dac0(left_lp_opamp_p_to_dac0),
		.left_lp_opamp_p_to_analog0(left_lp_opamp_p_to_analog0),
		.left_lp_opamp_p_to_amuxbusA(left_lp_opamp_p_to_amuxbusA),
		.left_lp_opamp_p_to_rheostat_out(left_lp_opamp_p_to_rheostat_out),
		.left_lp_opamp_p_to_sio0(left_lp_opamp_p_to_sio0),
		.left_lp_opamp_p_to_left_vref(left_lp_opamp_p_to_left_vref),
		.left_lp_opamp_p_to_voutref(left_lp_opamp_p_to_voutref),
		.left_lp_opamp_n_to_gpio5_5(left_lp_opamp_n_to_gpio5_5),
		.left_lp_opamp_n_to_dac1(left_lp_opamp_n_to_dac1),
		.left_lp_opamp_n_to_analog1(left_lp_opamp_n_to_analog1),
		.left_lp_opamp_n_to_amuxbusB(left_lp_opamp_n_to_amuxbusB),
		.left_lp_opamp_n_to_rheostat_out(left_lp_opamp_n_to_rheostat_out),
		.left_lp_opamp_n_to_rheostat_tap(left_lp_opamp_n_to_rheostat_tap),
		.left_lp_opamp_n_to_sio1(left_lp_opamp_n_to_sio1),
		.left_lp_opamp_n_to_vbgsc(left_lp_opamp_n_to_vbgsc),
		.left_lp_opamp_n_to_right_vref(left_lp_opamp_n_to_right_vref),
		.left_lp_opamp_n_to_vinref(left_lp_opamp_n_to_vinref),
		.left_instramp_to_ulpcomp_p(left_instramp_to_ulpcomp_p),
		.left_instramp_to_comp_p(left_instramp_to_comp_p),
		.left_instramp_to_adc0(left_instramp_to_adc0),
		.left_instramp_to_gpio4_4(left_instramp_to_gpio4_4),
		.left_instramp_to_analog1(left_instramp_to_analog1),
		.left_instramp_to_amuxbusB(left_instramp_to_amuxbusB),
		.right_instramp_to_ulpcomp_n(right_instramp_to_ulpcomp_n),
		.right_instramp_to_comp_n(right_instramp_to_comp_n),
		.right_instramp_to_adc1(right_instramp_to_adc1),
		.right_instramp_to_analog0(right_instramp_to_analog0),
		.right_instramp_to_amuxbusA(right_instramp_to_amuxbusA),
		.right_instramp_to_gpio3_0(right_instramp_to_gpio3_0),
		.left_instramp_n_to_gpio5_7(left_instramp_n_to_gpio5_7),
		.left_instramp_n_to_analog1(left_instramp_n_to_analog1),
		.left_instramp_n_to_amuxbusB(left_instramp_n_to_amuxbusB),
		.left_instramp_n_to_sio1(left_instramp_n_to_sio1),
		.left_instramp_n_to_right_vref(left_instramp_n_to_right_vref),
		.left_instramp_n_to_vinref(left_instramp_n_to_vinref),
		.left_instramp_p_to_gpio5_6(left_instramp_p_to_gpio5_6),
		.left_instramp_p_to_analog0(left_instramp_p_to_analog0),
		.left_instramp_p_to_amuxbusA(left_instramp_p_to_amuxbusA),
		.left_instramp_p_to_sio0(left_instramp_p_to_sio0),
		.left_instramp_p_to_tempsense(left_instramp_p_to_tempsense),
		.left_instramp_p_to_left_vref(left_instramp_p_to_left_vref),
		.left_instramp_p_to_voutref(left_instramp_p_to_voutref),
		.right_instramp_n_to_analog1(right_instramp_n_to_analog1),
		.right_instramp_n_to_amuxbusB(right_instramp_n_to_amuxbusB),
		.right_instramp_n_to_sio1(right_instramp_n_to_sio1),
		.right_instramp_n_to_right_vref(right_instramp_n_to_right_vref),
		.right_instramp_n_to_vinref(right_instramp_n_to_vinref),
		.right_instramp_n_to_gpio2_6(right_instramp_n_to_gpio2_6),
		.right_instramp_p_to_analog0(right_instramp_p_to_analog0),
		.right_instramp_p_to_amuxbusA(right_instramp_p_to_amuxbusA),
		.right_instramp_p_to_sio0(right_instramp_p_to_sio0),
		.right_instramp_p_to_tempsense(right_instramp_p_to_tempsense),
		.right_instramp_p_to_left_vref(right_instramp_p_to_left_vref),
		.right_instramp_p_to_voutref(right_instramp_p_to_voutref),
		.right_instramp_p_to_gpio2_7(right_instramp_p_to_gpio2_7),
		.ulpcomp_p_to_dac0(ulpcomp_p_to_dac0),
		.ulpcomp_p_to_analog1(ulpcomp_p_to_analog1),
		.ulpcomp_p_to_sio0(ulpcomp_p_to_sio0),
		.ulpcomp_p_to_vbgtc(ulpcomp_p_to_vbgtc),
		.ulpcomp_p_to_tempsense(ulpcomp_p_to_tempsense),
		.ulpcomp_p_to_left_vref(ulpcomp_p_to_left_vref),
		.ulpcomp_p_to_voutref(ulpcomp_p_to_voutref),
		.ulpcomp_p_to_gpio6_0(ulpcomp_p_to_gpio6_0),
		.ulpcomp_p_to_gpio1_7(ulpcomp_p_to_gpio1_7),
		.ulpcomp_n_to_dac1(ulpcomp_n_to_dac1),
		.ulpcomp_n_to_analog0(ulpcomp_n_to_analog0),
		.ulpcomp_n_to_sio1(ulpcomp_n_to_sio1),
		.ulpcomp_n_to_vbgsc(ulpcomp_n_to_vbgsc),
		.ulpcomp_n_to_right_vref(ulpcomp_n_to_right_vref),
		.ulpcomp_n_to_vinref(ulpcomp_n_to_vinref),
		.ulpcomp_n_to_gpio6_1(ulpcomp_n_to_gpio6_1),
		.ulpcomp_n_to_gpio1_6(ulpcomp_n_to_gpio1_6),
		.comp_p_to_dac0(comp_p_to_dac0),
		.comp_p_to_analog1(comp_p_to_analog1),
		.comp_p_to_sio0(comp_p_to_sio0),
		.comp_p_to_vbgtc(comp_p_to_vbgtc),
		.comp_p_to_tempsense(comp_p_to_tempsense),
		.comp_p_to_left_vref(comp_p_to_left_vref),
		.comp_p_to_voutref(comp_p_to_voutref),
		.comp_p_to_gpio6_2(comp_p_to_gpio6_2),
		.comp_p_to_gpio1_5(comp_p_to_gpio1_5),
		.comp_n_to_dac1(comp_n_to_dac1),
		.comp_n_to_analog0(comp_n_to_analog0),
		.comp_n_to_sio1(comp_n_to_sio1),
		.comp_n_to_vbgsc(comp_n_to_vbgsc),
		.comp_n_to_right_vref(comp_n_to_right_vref),
		.comp_n_to_vinref(comp_n_to_vinref),
		.comp_n_to_gpio6_3(comp_n_to_gpio6_3),
		.comp_n_to_gpio1_4(comp_n_to_gpio1_4),
		.adc0_to_dac0(adc0_to_dac0),
		.adc0_to_analog1(adc0_to_analog1),
		.adc0_to_vbgtc(adc0_to_vbgtc),
		.adc0_to_tempsense(adc0_to_tempsense),
		.adc0_to_left_vref(adc0_to_left_vref),
		.adc0_to_voutref(adc0_to_voutref),
		.adc0_to_gpio6_4(adc0_to_gpio6_4),
		.adc0_to_gpio1_3(adc0_to_gpio1_3),
		.adc1_to_dac1(adc1_to_dac1),
		.adc1_to_analog0(adc1_to_analog0),
		.adc1_to_vbgsc(adc1_to_vbgsc),
		.adc1_to_right_vref(adc1_to_right_vref),
		.adc1_to_vinref(adc1_to_vinref),
		.adc1_to_gpio6_5(adc1_to_gpio6_5),
		.adc1_to_gpio1_2(adc1_to_gpio1_2),
		.sio0_connect(sio0_connect),
		.sio1_connect(sio1_connect),
		.analog0_connect(analog0_connect),
		.analog1_connect(analog1_connect),
		.vbgtc_to_user(vbgtc_to_user),
		.vbgsc_to_user(vbgsc_to_user),
		.user_to_comp_n(user_to_comp_n),
		.user_to_comp_p(user_to_comp_p),
		.user_to_ulpcomp_n(user_to_ulpcomp_n),
		.user_to_ulpcomp_p(user_to_ulpcomp_p),
		.user_to_adc0(user_to_adc0),
		.user_to_adc1(user_to_adc1),
		.dac0_to_user(dac0_to_user),
		.dac1_to_user(dac1_to_user),
		.tempsense_to_user(tempsense_to_user),
		.right_vref_to_user(right_vref_to_user),
		.left_vref_to_user(left_vref_to_user),
		.vinref_to_user(vinref_to_user),
		.voutref_to_user(voutref_to_user),
		.dac0_to_analog1(dac0_to_analog1),
		.dac1_to_analog0(dac1_to_analog0),
		.audiodac_out_to_analog1(audiodac_out_to_analog1),
		.audiodac_outb_to_analog0(audiodac_outb_to_analog0),
		.left_instramp_ena(left_instramp_ena),
		.left_instramp_G1(left_instramp_G1),
		.left_instramp_G2(left_instramp_G2),
		.left_hgbw_opamp_ena(left_hgbw_opamp_ena),
		.left_lp_opamp_ena(left_lp_opamp_ena),
		.left_rheostat1_b(left_rheostat1_b),
		.left_rheostat2_b(left_rheostat2_b),
		.right_instramp_ena(right_instramp_ena),
		.right_instramp_G1(right_instramp_G1),
		.right_instramp_G2(right_instramp_G2),
		.right_hgbw_opamp_ena(right_hgbw_opamp_ena),
		.right_lp_opamp_ena(right_lp_opamp_ena),
		.right_rheostat1_b(right_rheostat1_b),
		.right_rheostat2_b(right_rheostat2_b),
		.comp_ena(comp_ena),
		.comp_trim(comp_trim),
		.comp_hyst(comp_hyst),
		.ulpcomp_ena(ulpcomp_ena),
		.ulpcomp_clk(ulpcomp_clk),
		.bandgap_ena(bandgap_ena),
		.bandgap_trim(bandgap_trim),
		.bandgap_sel(bandgap_sel),
		.ldo_ena(ldo_ena),
		.overvoltage_ena(overvoltage_ena),
		.overvoltage_trim(overvoltage_trim),
		.ldo_ref_sel(ldo_ref_sel),
		.ibias_ena(ibias_ena),
		.ibias_src_ena(ibias_src_ena),
		.ibias_snk_ena(ibias_snk_ena),
		.ibias_ref_select(ibias_ref_select),
		.idac_value(idac_value),
		.idac_ena(idac_ena),
		.tempsense_ena(tempsense_ena),
		.tempsense_sel(tempsense_sel),
		.rdac0_ena(rdac0_ena),
		.rdac0_value(rdac0_value),
		.rdac1_ena(rdac1_ena),
		.rdac1_value(rdac1_value),
		.brownout_ena(brownout_ena),
		.brownout_vtrip(brownout_vtrip),
		.brownout_otrip(brownout_otrip),
		.brownout_isrc_sel(brownout_isrc_sel),
		.brownout_oneshot(brownout_oneshot),
		.brownout_rc_ena(brownout_rc_ena),
		.brownout_rc_dis(brownout_rc_dis),
		.brownout_vunder(brownout_vunder),
		.brownout_timeout(brownout_timeout),
		.brownout_filt(brownout_filt),
		.brownout_unfilt(brownout_unfilt),
		.comp_out(comp_out),
		.ulpcomp_out(ulpcomp_out),
		.overvoltage_out(overvoltage_out),
		.vdda1_pwr_good(vdda1_pwr_good),
		.vccd1_pwr_good(vccd1_pwr_good),
		.vdda2_pwr_good(vdda2_pwr_good),
		.vccd2_pwr_good(vccd2_pwr_good)
	);

	assign	PRDATA = 
			(PADDR[16-1:0] == reg_ana_test_REG_OFFSET)	? reg_ana_test_REG :
			(PADDR[16-1:0] == reg_ana_idac_REG_OFFSET)	? reg_ana_idac_REG :
			(PADDR[16-1:0] == reg_ana_ref_REG_OFFSET)	? reg_ana_ref_REG :
			(PADDR[16-1:0] == reg_ana_amp3_out_REG_OFFSET)	? reg_ana_amp3_out_REG :
			(PADDR[16-1:0] == reg_ana_amp2_out_REG_OFFSET)	? reg_ana_amp2_out_REG :
			(PADDR[16-1:0] == reg_ana_amp1_out_REG_OFFSET)	? reg_ana_amp1_out_REG :
			(PADDR[16-1:0] == reg_ana_amp0_out_REG_OFFSET)	? reg_ana_amp0_out_REG :
			(PADDR[16-1:0] == reg_ana_amp3_inp_REG_OFFSET)	? reg_ana_amp3_inp_REG :
			(PADDR[16-1:0] == reg_ana_amp3_inn_REG_OFFSET)	? reg_ana_amp3_inn_REG :
			(PADDR[16-1:0] == reg_ana_amp2_inp_REG_OFFSET)	? reg_ana_amp2_inp_REG :
			(PADDR[16-1:0] == reg_ana_amp2_inn_REG_OFFSET)	? reg_ana_amp2_inn_REG :
			(PADDR[16-1:0] == reg_ana_amp1_inp_REG_OFFSET)	? reg_ana_amp1_inp_REG :
			(PADDR[16-1:0] == reg_ana_amp1_inn_REG_OFFSET)	? reg_ana_amp1_inn_REG :
			(PADDR[16-1:0] == reg_ana_amp0_inp_REG_OFFSET)	? reg_ana_amp0_inp_REG :
			(PADDR[16-1:0] == reg_ana_amp0_inn_REG_OFFSET)	? reg_ana_amp0_inn_REG :
			(PADDR[16-1:0] == reg_ana_preamp0_out_REG_OFFSET)	? reg_ana_preamp0_out_REG :
			(PADDR[16-1:0] == reg_ana_preamp1_out_REG_OFFSET)	? reg_ana_preamp1_out_REG :
			(PADDR[16-1:0] == reg_ana_preamp0_inn_REG_OFFSET)	? reg_ana_preamp0_inn_REG :
			(PADDR[16-1:0] == reg_ana_preamp0_inp_REG_OFFSET)	? reg_ana_preamp0_inp_REG :
			(PADDR[16-1:0] == reg_ana_preamp1_inn_REG_OFFSET)	? reg_ana_preamp1_inn_REG :
			(PADDR[16-1:0] == reg_ana_preamp1_inp_REG_OFFSET)	? reg_ana_preamp1_inp_REG :
			(PADDR[16-1:0] == reg_ana_comp1_inp_REG_OFFSET)	? reg_ana_comp1_inp_REG :
			(PADDR[16-1:0] == reg_ana_comp1_inn_REG_OFFSET)	? reg_ana_comp1_inn_REG :
			(PADDR[16-1:0] == reg_ana_comp0_inp_REG_OFFSET)	? reg_ana_comp0_inp_REG :
			(PADDR[16-1:0] == reg_ana_comp0_inn_REG_OFFSET)	? reg_ana_comp0_inn_REG :
			(PADDR[16-1:0] == reg_ana_adc0_in_REG_OFFSET)	? reg_ana_adc0_in_REG :
			(PADDR[16-1:0] == reg_ana_adc1_in_REG_OFFSET)	? reg_ana_adc1_in_REG :
			(PADDR[16-1:0] == reg_ana_sio_iso_REG_OFFSET)	? reg_ana_sio_iso_REG :
			(PADDR[16-1:0] == reg_ana_sio_ana_REG_OFFSET)	? reg_ana_sio_ana_REG :
			(PADDR[16-1:0] == reg_ana_uproj_REG_OFFSET)	? reg_ana_uproj_REG :
			(PADDR[16-1:0] == reg_ana_dac_out_REG_OFFSET)	? reg_ana_dac_out_REG :
			(PADDR[16-1:0] == reg_left_instramp_ctrl_REG_OFFSET)	? reg_left_instramp_ctrl_REG :
			(PADDR[16-1:0] == reg_left_opamp_ctrl_REG_OFFSET)	? reg_left_opamp_ctrl_REG :
			(PADDR[16-1:0] == reg_right_instramp_ctrl_REG_OFFSET)	? reg_right_instramp_ctrl_REG :
			(PADDR[16-1:0] == reg_right_opamp_ctrl_REG_OFFSET)	? reg_right_opamp_ctrl_REG :
			(PADDR[16-1:0] == reg_comparator_ctrl_REG_OFFSET)	? reg_comparator_ctrl_REG :
			(PADDR[16-1:0] == reg_bandgap_ctrl_REG_OFFSET)	? reg_bandgap_ctrl_REG :
			(PADDR[16-1:0] == reg_ibias_ctrl_REG_OFFSET)	? reg_ibias_ctrl_REG :
			(PADDR[16-1:0] == reg_idac_ctrl_REG_OFFSET)	? reg_idac_ctrl_REG :
			(PADDR[16-1:0] == reg_tempsense_ctrl_REG_OFFSET)	? reg_tempsense_ctrl_REG :
			(PADDR[16-1:0] == reg_rdac_ctrl_REG_OFFSET)	? reg_rdac_ctrl_REG :
			(PADDR[16-1:0] == reg_brownout_ctrl_REG_OFFSET)	? reg_brownout_ctrl_REG :
			(PADDR[16-1:0] == reg_brownout_output_REG_OFFSET)	? reg_brownout_output_WIRE :
			(PADDR[16-1:0] == reg_comparator0_out_REG_OFFSET)	? reg_comparator0_out_WIRE :
			(PADDR[16-1:0] == reg_comparator1_out_REG_OFFSET)	? reg_comparator1_out_WIRE :
			(PADDR[16-1:0] == reg_overvoltage_out_REG_OFFSET)	? reg_overvoltage_out_WIRE :
			(PADDR[16-1:0] == reg_vdda1_pwr_good_REG_OFFSET)	? reg_vdda1_pwr_good_WIRE :
			(PADDR[16-1:0] == reg_vccd1_pwr_good_REG_OFFSET)	? reg_vccd1_pwr_good_WIRE :
			(PADDR[16-1:0] == reg_vdda2_pwr_good_REG_OFFSET)	? reg_vdda2_pwr_good_WIRE :
			(PADDR[16-1:0] == reg_vccd2_pwr_good_REG_OFFSET)	? reg_vccd2_pwr_good_WIRE :
			32'hDEADBEEF;

	assign	PREADY = 1'b1;

endmodule
