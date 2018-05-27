#include <stdio.h>

unsigned char switch_byte(unsigned char x);

int main()
{
	unsigned char x = 0xab;
	
	printf("%x\n", switch_byte(x));
	return 0;
}

unsigned char switch_byte(unsigned char x)
{
	x = ((x & 0x0f) << 4) | ((x & 0xf0) >> 4);
	return x;
}