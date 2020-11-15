#  Simulation Model Generator
#  Xilinx EDK 13.2 EDK_O.61xd
#  Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
#
#  File     system.do (Wed Oct 03 21:44:19 2018)
#
vmap secureip "C:/Xilinx/13.2/ISE_DS/EDK/secureip/"
vmap simprim "C:/Xilinx/13.2/ISE_DS/EDK/simprim/"
vmap simprims_ver "C:/Xilinx/13.2/ISE_DS/EDK/simprims_ver/"
vmap unisim "C:/Xilinx/13.2/ISE_DS/EDK/unisim/"
vmap unisims_ver "C:/Xilinx/13.2/ISE_DS/EDK/unisims_ver/"
vmap xilinxcorelib "C:/Xilinx/13.2/ISE_DS/EDK/xilinxcorelib/"
vmap xilinxcorelib_ver "C:/Xilinx/13.2/ISE_DS/EDK/xilinxcorelib_ver/"
vmap microblaze_v8_20_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/microblaze_v8_20_a/"
vmap proc_common_v3_00_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/proc_common_v3_00_a/"
vmap plb_v46_v1_05_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/plb_v46_v1_05_a/"
vmap lmb_v10_v2_00_b "C:/Xilinx/13.2/ISE_DS/EDK/edk/lmb_v10_v2_00_b/"
vmap lmb_bram_if_cntlr_v3_00_b "C:/Xilinx/13.2/ISE_DS/EDK/edk/lmb_bram_if_cntlr_v3_00_b/"
vlib lmb_bram_elaborate_v1_00_a
vmap lmb_bram_elaborate_v1_00_a lmb_bram_elaborate_v1_00_a
vmap plbv46_slave_single_v1_01_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/plbv46_slave_single_v1_01_a/"
vmap xps_uartlite_v1_02_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/xps_uartlite_v1_02_a/"
vmap clock_generator_v4_02_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/clock_generator_v4_02_a/"
vlib clock_generator_0_v4_02_a
vmap clock_generator_0_v4_02_a clock_generator_0_v4_02_a
vmap axi_lite_ipif_v1_01_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/axi_lite_ipif_v1_01_a/"
vmap mdm_v2_00_b "C:/Xilinx/13.2/ISE_DS/EDK/edk/mdm_v2_00_b/"
vmap proc_sys_reset_v3_00_a "C:/Xilinx/13.2/ISE_DS/EDK/edk/proc_sys_reset_v3_00_a/"
vlib ip_karatsuba2_v1_00_a
vmap ip_karatsuba2_v1_00_a ip_karatsuba2_v1_00_a
vlib work
vmap work work
vcom -novopt -93 -work lmb_bram_elaborate_v1_00_a "elaborate/lmb_bram_elaborate_v1_00_a/hdl/vhdl/lmb_bram_elaborate.vhd"
vcom -novopt -93 -work clock_generator_0_v4_02_a "elaborate/clock_generator_0_v4_02_a/hdl/vhdl/clock_generator.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/user_logic.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/ip_karatsuba2.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/Karatsuba2.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/AddSub_Mod.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/Control_addSub.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/F_adder.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/add_sous_cell.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/bascule32.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/Bascule.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/aig_addr_din.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/stockage_unite.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/control_MMM.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/montgomery_multiplication.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/etage_1.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/etage_2.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/cellule_full_adder.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/FLIP_FLOP_D.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/multiplieur_accumulateur.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/propagate_adder.vhd"
vcom -novopt -93 -work ip_karatsuba2_v1_00_a "E:/Code_Doctorat_Virtex5/Projet_Karatsuba2/Simulation/pcores/ip_karatsuba2_v1_00_a/hdl/vhdl/reg.vhd"
vcom -novopt -93 -work work "microblaze_0_wrapper.vhd"
vcom -novopt -93 -work work "mb_plb_wrapper.vhd"
vcom -novopt -93 -work work "ilmb_wrapper.vhd"
vcom -novopt -93 -work work "dlmb_wrapper.vhd"
vcom -novopt -93 -work work "dlmb_cntlr_wrapper.vhd"
vcom -novopt -93 -work work "ilmb_cntlr_wrapper.vhd"
vcom -novopt -93 -work work "lmb_bram_wrapper.vhd"
vcom -novopt -93 -work work "rs232_uart_0_wrapper.vhd"
vcom -novopt -93 -work work "clock_generator_0_wrapper.vhd"
vcom -novopt -93 -work work "mdm_0_wrapper.vhd"
vcom -novopt -93 -work work "proc_sys_reset_0_wrapper.vhd"
vcom -novopt -93 -work work "ip_karatsuba2_0_wrapper.vhd"
vcom -novopt -93 -work work "system.vhd"
vcom -novopt -93 -work work "system_tb.vhd"
