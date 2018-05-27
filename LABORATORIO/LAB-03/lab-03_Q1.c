#include <stdio.h>

int main()
{
	unsigned int x = 0x87654321;
	unsigned int z, y;
	//1000 0111 0101 0011 0100 0011 0010 0001

	z = x & 0x000000ff;
	printf("%08x\n", z);

	y = x | 0xff000000;
	printf("%08x\n", y);
	return 0;
}