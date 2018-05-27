#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n);

int main()
{
	unsigned char x = rotate_left(0x61, 2);
	printf("%x\n", x);
	return 0;
}

unsigned char rotate_left(unsigned char x, int n)
{
	//unsigned char y = (x >> (8 - n));
	return (x >> (8 - n)) | (x << n);
	//1010 1011 
}