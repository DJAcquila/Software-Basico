#include <stdio.h>

/*
Questão 01:
*/
void dump (void *p, int n) {
	unsigned char *p1 = p;
	while (n--) {
		printf("%p - %02x\n", p1, *p1);
		p1++;
	}
}

struct X {
	int a;
	short b;
	int c;
};
struct X1 {
char c1;
int i;
char c2;
};
typedef struct X x;
int main() {
	int i,j;
	short a[2][3];
	int b[2];
	for (i = 0; i < 2; i++) {
		b[i] = i;
		for (j = 0; j < 3; j++)
			a[i][j] = 3*i+j;
	}
	printf("b: \n");
	dump(b, sizeof(b));
	printf("a: \n");
	dump(a, sizeof(a));
	x s = {0xa1a2a3a4, 0xb1b2, 0xc1c2c3c4};
	printf("Questao 02-a\n");
	printf("%ld\n",sizeof(s));
	printf("\nQuestao 02-b\n");
	dump(&s, sizeof(s));
	/*No resultado o compilador deixou um espaço (padding) preenchidos com 0x00*/
	
	return 0;
}

