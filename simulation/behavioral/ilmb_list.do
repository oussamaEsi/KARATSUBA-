#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     ilmb_list.do (Wed Oct 03 21:44:20 2018)
#
#  Module   ilmb_wrapper
#  Instance ilmb
set binopt {-bin}
set hexopt {-hex}
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}system_tb${ps}dut" }

# eval add list $binopt $tbpath${ps}ilmb${ps}LMB_Clk
# eval add list $binopt $tbpath${ps}ilmb${ps}SYS_Rst
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_Rst
# eval add list $hexopt $tbpath${ps}ilmb${ps}M_ABus
# eval add list $binopt $tbpath${ps}ilmb${ps}M_ReadStrobe
# eval add list $binopt $tbpath${ps}ilmb${ps}M_WriteStrobe
# eval add list $binopt $tbpath${ps}ilmb${ps}M_AddrStrobe
# eval add list $hexopt $tbpath${ps}ilmb${ps}M_DBus
# eval add list $hexopt $tbpath${ps}ilmb${ps}M_BE
# eval add list $hexopt $tbpath${ps}ilmb${ps}Sl_DBus
# eval add list $binopt $tbpath${ps}ilmb${ps}Sl_Ready
# eval add list $binopt $tbpath${ps}ilmb${ps}Sl_Wait
# eval add list $binopt $tbpath${ps}ilmb${ps}Sl_UE
# eval add list $binopt $tbpath${ps}ilmb${ps}Sl_CE
  eval add list $hexopt $tbpath${ps}ilmb${ps}LMB_ABus
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_ReadStrobe
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_WriteStrobe
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_AddrStrobe
  eval add list $hexopt $tbpath${ps}ilmb${ps}LMB_ReadDBus
  eval add list $hexopt $tbpath${ps}ilmb${ps}LMB_WriteDBus
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_Ready
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_Wait
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_UE
  eval add list $binopt $tbpath${ps}ilmb${ps}LMB_CE
  eval add list $hexopt $tbpath${ps}ilmb${ps}LMB_BE

