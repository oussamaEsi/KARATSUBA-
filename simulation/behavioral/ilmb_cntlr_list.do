#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     ilmb_cntlr_list.do (Wed Oct 03 21:44:20 2018)
#
#  Module   ilmb_cntlr_wrapper
#  Instance ilmb_cntlr
set binopt {-bin}
set hexopt {-hex}
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}system_tb${ps}dut" }

# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}LMB_Clk
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}LMB_Rst
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}LMB_ABus
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}LMB_WriteDBus
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}LMB_AddrStrobe
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}LMB_ReadStrobe
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}LMB_WriteStrobe
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}LMB_BE
  eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}Sl_DBus
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}Sl_Ready
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}Sl_Wait
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}Sl_UE
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}Sl_CE
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}BRAM_Rst_A
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}BRAM_Clk_A
  eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}BRAM_EN_A
  eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}BRAM_WEN_A
  eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}BRAM_Addr_A
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}BRAM_Din_A
  eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}BRAM_Dout_A
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}Interrupt
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_ABus
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_PAValid
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_masterID
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_RNW
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_BE
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_size
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_type
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_wrDBus
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_addrAck
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_SSize
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_wait
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_rearbitrate
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_wrDAck
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_wrComp
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_rdDBus
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_rdDAck
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_rdComp
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_MBusy
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_MWrErr
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_MRdErr
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_UABus
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_SAValid
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_rdPrim
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_wrPrim
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_abort
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_busLock
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_MSize
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_lockErr
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_wrBurst
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_rdBurst
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_wrPendReq
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_rdPendReq
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_wrPendPri
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_rdPendPri
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_reqPri
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_PLB_TAttribute
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_wrBTerm
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_rdWdAddr
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_rdBTerm
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}SPLB_CTRL_Sl_MIRQ
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_ACLK
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_ARESETN
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_AWADDR
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_AWVALID
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_AWREADY
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_WDATA
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_WSTRB
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_WVALID
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_WREADY
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_BRESP
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_BVALID
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_BREADY
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_ARADDR
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_ARVALID
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_ARREADY
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_RDATA
# eval add list $hexopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_RRESP
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_RVALID
# eval add list $binopt $tbpath${ps}ilmb_cntlr${ps}S_AXI_CTRL_RREADY

