#include <stdio.h>
#include <stdlib.h>

unsigned long p[9];
unsigned long m;//N(-1)

unsigned long redFp[9];
unsigned long a0[9], a1[9], b0[9], b1[9];

unsigned long resultat[9];

int main() {

    /// 2370fb04 9d410fbe 4e761a98 86e50241 7d023f40 18000001 7e806000 00000001
	p[0]=1;
	p[1]=0x7e806000;
	p[2]=0x18000001;
	p[3]=0x7d023f40;
	p[4]=0x86e50241;
	p[5]=0x4e761a98;
	p[6]=0x9d410fbe;
	p[7]=0x2370fb04;
	p[8]=0x0;

	m=0xffffffff;


    // a0 + a1 + b0 + b1
    a0[0]=0x967909b5;
    a0[1]=0xe81962ed;
    a0[2]=0xc6f8a536;
    a0[3]=0xf430b471;
    a0[4]=0x33da38a9;
    a0[5]=0xda93cc35;
    a0[6]=0xafe4c330;
    a0[7]=0x19b0bea4;
    a0[8]=0x0;

    a1[0]=0xe45c3f72;
    a1[1]=0x1e1de1a2;
    a1[2]=0x238fa634;
    a1[3]=0x7d906fff;
    a1[4]=0x2a5c539f;
    a1[5]=0xe9880b1f;
    a1[6]=0x585a61c6;
    a1[7]=0xa1cf585;
    a1[8]=0x0;

    b0[0]=0x384d2627;
    b0[1]=0xdcc91731;
    b0[2]=0x9b3990ee;
    b0[3]=0xd24adf1b;
    b0[4]=0xa80a0cf6;
    b0[5]=0x3e49c711;
    b0[6]=0xebbd6533;
    b0[7]=0x17abd366;
    b0[8]=0x0;

    b1[0]=0xa32d345;
    b1[1]=0x2f5bf9fd;
    b1[2]=0x9be960c3;
    b1[3]=0x863bc9aa;
    b1[4]=0x32a78700;
    b1[5]=0xd00e9522;
    b1[6]=0xe9902a27;
    b1[7]=0xee97d6d;
    b1[8]=0x0;

    Modular_Mc(p, m);// M , N'

    Karatsuba2(a0,a1,b0,b1,resultat);

}
