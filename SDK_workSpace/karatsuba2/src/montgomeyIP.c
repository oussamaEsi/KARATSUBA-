#include "opr_code.h"
#include "ip_mmm256_opt.h"

#define MMM_baseadder 0x84418000


Xuint32 i;
void Modular_Mc(int Modulo[ ], int Mc) {
	IP_MMM256_OPT_mWriteSlaveReg0(MMM_baseadder,0,run_write_modulo_mc);
	for(i = 0; i<9; i++ ) {
		IP_MMM256_OPT_mWriteSlaveReg1(MMM_baseadder,0,Modulo[i]);
	}
	IP_MMM256_OPT_mWriteSlaveReg1(MMM_baseadder,0,Mc);

}

void Karatsuba2(int A0[],int A1[], int B0[],int B1[],int res[]) {

	IP_MMM256_OPT_mWriteSlaveReg0(MMM_baseadder,0,run_write_A_B);
	for(i = 0; i<9; i++ ) {
		IP_MMM256_OPT_mWriteSlaveReg1(MMM_baseadder,0,A0[i]);
	}
	for(i = 0; i<9; i++ ) {
		IP_MMM256_OPT_mWriteSlaveReg1(MMM_baseadder,0,A1[i]);
	}
	for(i = 0; i<9; i++ ) {
		IP_MMM256_OPT_mWriteSlaveReg1(MMM_baseadder,0,B0[i]);
	}

	for(i = 0; i<9; i++ ) {
		IP_MMM256_OPT_mWriteSlaveReg1(MMM_baseadder,0,B1[i]);
	}

	int temp;
	IP_MMM256_OPT_mWriteSlaveReg0(MMM_baseadder,0,run_MMM);

	/*temp = IP_MMM256_OPT_mReadSlaveReg2(MMM_baseadder,0);
	while(temp==0xFFFFFFFF) {
		temp = IP_MMM256_OPT_mReadSlaveReg2(MMM_baseadder,0);
	}

	//----------------lecture du résultat
	for(i = 0; i<9; i++ ) {
		res[i]= IP_MMM256_OPT_mReadSlaveReg2(MMM_baseadder,0);
	}

	IP_MMM256_OPT_mWriteSlaveReg0(MMM_baseadder,0,reset_ip_mm);
	*/
}
