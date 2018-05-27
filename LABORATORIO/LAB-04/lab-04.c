#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
/*Questão 01*/
/*
a) 1011111101
b) 1001111100110000 = 1001 1111 0011 0000 = 9f30
c) 3462 = 0xc86
d) 0xa73ef9b3 = 10100110001111101111100110110011 = 1010 0110 0011 1110 1111 1001 1011 011
*/
/*Questao 02*/
int is_little(void)
{
	int num = 1;
	if((*(char *) & num) == 1) return 1;
	else return 0;
}
/*Questao 03*/
void reverso(char* s)
{
	int n = strlen(s);
	int i = (n - 1) >> 1;
	int j = n >> 1;
	while(i >= 0 && j < n)
	{
		char aux = s[i];
		s[i] = s[j];
		s[j] = aux;
		i--;
		j++;
	}
}
void num2string(char *s, int num, int base)
{
	int n = num;
	int i = 0;
	while(n > 1)
	{
		n = n/base;
		int resto = (n % base);
		if(resto < 10)
			s[i] = (n % base) + '0';
		else
			s[i] = (n % base) + 'a';
		i++;
	}
	s[i] = '\0';
	reverso(s);
	printf("%s\n", s);

}
int string2num(char* s, int base)
{
	int a = 0;
	for(; *s; s++) 
		a = a*base + (*s - '0');
	return a;
}
/*Questao 04*/
void toggle(int *value, int bit)
{
	*value = ((1 << (bit - 1)) ^ *value);
}

int main()
{
	

	printf("02) ");
	if(is_little()) printf("Little\n");
	else printf("Big\n");
	int value = 4;
	printf("\n");
	printf("04) ");
	toggle(&value, 1);
	printf("%d\n", value);
	
	//printf("%d\n", string2num("2048", 4));
	char* s = (char*)malloc(1024*sizeof(char));
	num2string(s, 28, 16);
	return 0;
}
