##############################################################################
## Filename:          E:\Code_Doctorat_Virtex5\Projet_Karatsuba2\Simulation/drivers/ip_karatsuba2_v1_00_a/data/ip_karatsuba2_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Sun Feb 11 11:18:51 2018 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "ip_karatsuba2" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
