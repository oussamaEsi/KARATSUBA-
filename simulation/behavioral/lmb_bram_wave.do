#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     lmb_bram_wave.do (Wed Oct 03 21:44:20 2018)
#
#  Module   lmb_bram_wrapper
#  Instance lmb_bram
set binopt {-logic}
set hexopt {-literal -hex}
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}system_tb${ps}dut" }

  eval add wave -noupdate -divider {"lmb_bram"}
# eval add wave -noupdate $binopt $tbpath${ps}lmb_bram${ps}BRAM_Rst_A
# eval add wave -noupdate $binopt $tbpath${ps}lmb_bram${ps}BRAM_Clk_A
# eval add wave -noupdate $binopt $tbpath${ps}lmb_bram${ps}BRAM_EN_A
# eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_WEN_A
# eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_Addr_A
  eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_Din_A
# eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_Dout_A
# eval add wave -noupdate $binopt $tbpath${ps}lmb_bram${ps}BRAM_Rst_B
# eval add wave -noupdate $binopt $tbpath${ps}lmb_bram${ps}BRAM_Clk_B
# eval add wave -noupdate $binopt $tbpath${ps}lmb_bram${ps}BRAM_EN_B
# eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_WEN_B
# eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_Addr_B
  eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_Din_B
# eval add wave -noupdate $hexopt $tbpath${ps}lmb_bram${ps}BRAM_Dout_B

