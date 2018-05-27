#include <stdio.h>
int odd_ones(unsigned int x) 
{
	int i;
	int cont = i = 1;
	
	while(x >> i)
	{
		if((x >> i) & 0x1)
			cont++;

		
		printf("x = %08x\tx & 0x1 = %08x\n", x >> i, (x & 0x1));
		i++;
		//printf("%08x\n", x);
		
	}
	if(cont & 1) return 1;
	else return 0;

}
int main() 
{
	
	printf("%x tem numero %s de bits\n", 0x01010101,
	odd_ones(0x01010101) ? "impar" : "par");
	printf("%x tem numero %s de bits\n", 0x01030101,
	odd_ones(0x01030101) ? "impar" : "par");
	return 0;
}