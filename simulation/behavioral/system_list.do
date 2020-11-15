#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     system_list.do (Wed Oct 03 21:44:20 2018)
#
#  List Window DO Script File
#
#  List Window DO script files setup the ModelSim List window
#  display for viewing results of the simulation in a tabular
#  format. Comment or uncomment commands to change the set of
#  data values viewed.
#
echo  "Setting up List window display ..."

if { ![info exists xcmdc] } {echo "Warning : c compile command was not run"}
if { ![info exists xcmds] } {echo "Warning : s simulate command was not run"}

onerror { resume }

if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}system_tb${ps}dut" }

#
#  Display top-level ports
#
set binopt {-bin}
set hexopt {-hex}
eval add list $binopt $tbpath${ps}fpga_0_RS232_Uart_0_RX_pin
eval add list $binopt $tbpath${ps}fpga_0_RS232_Uart_0_TX_pin
eval add list $binopt $tbpath${ps}fpga_0_clk_1_sys_clk_pin
eval add list $binopt $tbpath${ps}fpga_0_rst_1_sys_rst_pin

#
#  Display bus signal ports
#
do mb_plb_list.do

do ilmb_list.do

do dlmb_list.do

#
#  Display processor ports
#
do microblaze_0_list.do

#
#  Display processor registers
#

#  Processor registers cannot be displayed for:
#  Module   microblaze_0_wrapper
#  Instance microblaze_0
#  Register display support will be added in a future EDK release

#
#  Display IP and peripheral ports
#
do dlmb_cntlr_list.do

do ilmb_cntlr_list.do

do lmb_bram_list.do

do RS232_Uart_0_list.do

do clock_generator_0_list.do

do mdm_0_list.do

do proc_sys_reset_0_list.do

do ip_karatsuba2_0_list.do


#  List window configuration information
#
configure list -delta                 none
configure list -usesignaltriggers     0

#  Define the simulation strobe and period, if used.

configure list -usestrobe             0
configure list -strobestart           {0 ps}  -strobeperiod {0 ps}

configure list -usegating             1

# Configure the gated clock.
# configure list -gateexpr <<signal_name>>

#  List window setup complete
#
echo  "List window display setup done."
