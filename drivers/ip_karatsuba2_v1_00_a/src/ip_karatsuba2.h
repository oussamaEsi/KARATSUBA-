/*****************************************************************************
* Filename:          E:\Code_Doctorat_Virtex5\Projet_Karatsuba2\Simulation/drivers/ip_karatsuba2_v1_00_a/src/ip_karatsuba2.h
* Version:           1.00.a
* Description:       ip_karatsuba2 Driver Header File
* Date:              Sun Feb 11 11:18:51 2018 (by Create and Import Peripheral Wizard)
*****************************************************************************/

#ifndef IP_KARATSUBA2_H
#define IP_KARATSUBA2_H

/***************************** Include Files *******************************/

#include "xbasic_types.h"
#include "xstatus.h"
#include "xil_io.h"

/************************** Constant Definitions ***************************/


/**
 * User Logic Slave Space Offsets
 * -- SLV_REG0 : user logic slave module register 0
 * -- SLV_REG1 : user logic slave module register 1
 * -- SLV_REG2 : user logic slave module register 2
 */
#define IP_KARATSUBA2_USER_SLV_SPACE_OFFSET (0x00000000)
#define IP_KARATSUBA2_SLV_REG0_OFFSET (IP_KARATSUBA2_USER_SLV_SPACE_OFFSET + 0x00000000)
#define IP_KARATSUBA2_SLV_REG1_OFFSET (IP_KARATSUBA2_USER_SLV_SPACE_OFFSET + 0x00000004)
#define IP_KARATSUBA2_SLV_REG2_OFFSET (IP_KARATSUBA2_USER_SLV_SPACE_OFFSET + 0x00000008)

/**************************** Type Definitions *****************************/


/***************** Macros (Inline Functions) Definitions *******************/

/**
 *
 * Write a value to a IP_KARATSUBA2 register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the IP_KARATSUBA2 device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void IP_KARATSUBA2_mWriteReg(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Data)
 *
 */
#define IP_KARATSUBA2_mWriteReg(BaseAddress, RegOffset, Data) \
 	Xil_Out32((BaseAddress) + (RegOffset), (Xuint32)(Data))

/**
 *
 * Read a value from a IP_KARATSUBA2 register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the IP_KARATSUBA2 device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	Xuint32 IP_KARATSUBA2_mReadReg(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define IP_KARATSUBA2_mReadReg(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (RegOffset))


/**
 *
 * Write/Read 32 bit value to/from IP_KARATSUBA2 user logic slave registers.
 *
 * @param   BaseAddress is the base address of the IP_KARATSUBA2 device.
 * @param   RegOffset is the offset from the slave register to write to or read from.
 * @param   Value is the data written to the register.
 *
 * @return  Data is the data from the user logic slave register.
 *
 * @note
 * C-style signature:
 * 	void IP_KARATSUBA2_mWriteSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset, Xuint32 Value)
 * 	Xuint32 IP_KARATSUBA2_mReadSlaveRegn(Xuint32 BaseAddress, unsigned RegOffset)
 *
 */
#define IP_KARATSUBA2_mWriteSlaveReg0(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (IP_KARATSUBA2_SLV_REG0_OFFSET) + (RegOffset), (Xuint32)(Value))
#define IP_KARATSUBA2_mWriteSlaveReg1(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (IP_KARATSUBA2_SLV_REG1_OFFSET) + (RegOffset), (Xuint32)(Value))
#define IP_KARATSUBA2_mWriteSlaveReg2(BaseAddress, RegOffset, Value) \
 	Xil_Out32((BaseAddress) + (IP_KARATSUBA2_SLV_REG2_OFFSET) + (RegOffset), (Xuint32)(Value))

#define IP_KARATSUBA2_mReadSlaveReg0(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (IP_KARATSUBA2_SLV_REG0_OFFSET) + (RegOffset))
#define IP_KARATSUBA2_mReadSlaveReg1(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (IP_KARATSUBA2_SLV_REG1_OFFSET) + (RegOffset))
#define IP_KARATSUBA2_mReadSlaveReg2(BaseAddress, RegOffset) \
 	Xil_In32((BaseAddress) + (IP_KARATSUBA2_SLV_REG2_OFFSET) + (RegOffset))

/************************** Function Prototypes ****************************/


/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the IP_KARATSUBA2 instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus IP_KARATSUBA2_SelfTest(void * baseaddr_p);

#endif /** IP_KARATSUBA2_H */
