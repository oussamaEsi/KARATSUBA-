#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     ilmb_wave.do (Wed Oct 03 21:44:20 2018)
#
#  Module   ilmb_wrapper
#  Instance ilmb
set binopt {-logic}
set hexopt {-literal -hex}
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}system_tb${ps}dut" }

  eval add wave -noupdate -divider {"ilmb"}
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_Clk
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}SYS_Rst
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_Rst
# eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}M_ABus
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}M_ReadStrobe
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}M_WriteStrobe
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}M_AddrStrobe
# eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}M_DBus
# eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}M_BE
# eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}Sl_DBus
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}Sl_Ready
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}Sl_Wait
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}Sl_UE
# eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}Sl_CE
  eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}LMB_ABus
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_ReadStrobe
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_WriteStrobe
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_AddrStrobe
  eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}LMB_ReadDBus
  eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}LMB_WriteDBus
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_Ready
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_Wait
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_UE
  eval add wave -noupdate $binopt $tbpath${ps}ilmb${ps}LMB_CE
  eval add wave -noupdate $hexopt $tbpath${ps}ilmb${ps}LMB_BE

