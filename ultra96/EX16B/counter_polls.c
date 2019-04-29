#include <stdio.h>
#include "mycounter.h"
#include "xparameters.h"
#include "xil_io.h"

unsigned int cnt_val;

int main()
{
	char c;

	while(1) {
		printf("==== Menu Option ====\n\r");
		printf("r. clear counter\n\r");
		printf("s. start counter\n\r");
		printf("t. stop counter\n\r");
		printf("c. read current counter value\n\r");
		printf("x. finish\n\r");
		printf("Select Menu : ");
		c = getchar();

		printf("==> Selected Menu : %c\n\r", c);

		if (c == 'r') {
			MYCOUNTER_mWriteReg(XPAR_MYCOUNTER_0_S00_AXI_BASEADDR, 0, 1);
			MYCOUNTER_mWriteReg(XPAR_MYCOUNTER_0_S00_AXI_BASEADDR, 0, 0);
		} else if (c == 's') {
			MYCOUNTER_mWriteReg(XPAR_MYCOUNTER_0_S00_AXI_BASEADDR, 4, 1);
		} else if (c == 't') {
			MYCOUNTER_mWriteReg(XPAR_MYCOUNTER_0_S00_AXI_BASEADDR, 4, 0);
		} else if (c == 'c') {
			cnt_val = (unsigned int)MYCOUNTER_mReadReg(XPAR_MYCOUNTER_0_S00_AXI_BASEADDR, 8);
			printf("current counter value is %10u\n\r", cnt_val);
		} else if (c == 'x') {
			break;
		} else {
			printf("WRONG COMMAND\n\r");
		}
	}

	printf("program finished\n\r");
    return 0;
}
