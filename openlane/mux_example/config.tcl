# SPDX-FileCopyrightText: 2020 Efabless Corporation
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
# SPDX-License-Identifier: Apache-2.0
set script_dir [file dirname [file normalize [info script]]]
set ::env(DESIGN_NAME) mux_example

set ::env(PDK) "gf180mcuC"
set ::env(STD_CELL_LIBRARY) "gf180mcu_fd_sc_mcu7t5v0"



set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/../../verilog/rtl/mux_example.v"
	#$::env(CARAVEL_ROOT)/verilog/rtl/defines.v 

set ::env(DIE_AREA) "0 0 900 600"
set ::env(FP_SIZING) absolute

set ::env(FP_CORE_UTIL) 40
set ::env(PL_TARGET_DENSITY) [ expr ($::env(FP_CORE_UTIL)+5) / 100.0 ]

set ::env(SYNTH_DEFINES) "MPRJ_IO_PADS=38"

set ::env(CLOCK_PERIOD) "30.0"
set ::env(CLOCK_PORT) "wb_clk_i"
# set ::env(CLOCK_NET) "counter.clk"

# macro needs to work inside Caravel, so can't be core and can't use metal 5
set ::env(DESIGN_IS_CORE) 0
set ::env(RT_MAX_LAYER) {Metal4}

# define power straps so the macro works inside Caravel's PDN
set ::env(VDD_NETS) [list {vdd}]
set ::env(GND_NETS) [list {vss}]

# regular pin order seems to help with aggregating all the macros for the group project
#set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

set ::env(FP_IO_VTHICKNESS_MULT) 4
set ::env(FP_IO_HTHICKNESS_MULT) 4


