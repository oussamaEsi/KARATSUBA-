#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     mdm_0_list.do (Wed Oct 03 21:44:20 2018)
#
#  Module   mdm_0_wrapper
#  Instance mdm_0
set binopt {-bin}
set hexopt {-hex}
if { [info exists PathSeparator] } { set ps $PathSeparator } else { set ps "/" }
if { ![info exists tbpath] } { set tbpath "${ps}system_tb${ps}dut" }

# eval add list $binopt $tbpath${ps}mdm_0${ps}Interrupt
  eval add list $binopt $tbpath${ps}mdm_0${ps}Debug_SYS_Rst
  eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_BRK
  eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_NM_BRK
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_ACLK
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_ARESETN
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_AWADDR
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_AWVALID
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_AWREADY
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_WDATA
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_WSTRB
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_WVALID
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_WREADY
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_BRESP
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_BVALID
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_BREADY
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_ARADDR
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_ARVALID
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_ARREADY
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_RDATA
# eval add list $hexopt $tbpath${ps}mdm_0${ps}S_AXI_RRESP
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_RVALID
# eval add list $binopt $tbpath${ps}mdm_0${ps}S_AXI_RREADY
# eval add list $binopt $tbpath${ps}mdm_0${ps}SPLB_Clk
# eval add list $binopt $tbpath${ps}mdm_0${ps}SPLB_Rst
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_ABus
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_UABus
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_PAValid
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_SAValid
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_rdPrim
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_wrPrim
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_masterID
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_abort
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_busLock
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_RNW
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_BE
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_MSize
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_size
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_type
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_lockErr
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_wrDBus
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_wrBurst
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_rdBurst
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_wrPendReq
# eval add list $binopt $tbpath${ps}mdm_0${ps}PLB_rdPendReq
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_wrPendPri
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_rdPendPri
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_reqPri
# eval add list $hexopt $tbpath${ps}mdm_0${ps}PLB_TAttribute
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_addrAck
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_SSize
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_wait
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_rearbitrate
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_wrDAck
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_wrComp
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_wrBTerm
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_rdDBus
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_rdWdAddr
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_rdDAck
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_rdComp
  eval add list $binopt $tbpath${ps}mdm_0${ps}Sl_rdBTerm
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_MBusy
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_MWrErr
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_MRdErr
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Sl_MIRQ
  eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_0
  eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_0
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_0
  eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_0
  eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_0
  eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_0
  eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_0
  eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_0
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_1
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_2
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_2
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_3
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_3
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_4
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_4
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_5
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_5
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_6
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_6
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Clk_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDI_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_TDO_7
# eval add list $hexopt $tbpath${ps}mdm_0${ps}Dbg_Reg_En_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Capture_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Shift_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Update_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}Dbg_Rst_7
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_tdi
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_reset
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_shift
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_update
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_capture
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_sel1
# eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_drck1
  eval add list $binopt $tbpath${ps}mdm_0${ps}bscan_tdo1
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_DRCK
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_RESET
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_SEL
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_CAPTURE
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_SHIFT
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_UPDATE
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_TDI
# eval add list $binopt $tbpath${ps}mdm_0${ps}Ext_JTAG_TDO

