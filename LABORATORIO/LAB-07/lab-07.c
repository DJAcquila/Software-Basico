#include <stdio.h>
#include <stdlib.h>

int nums[] = {10, -21, -30, 45};

int main() {

	int i, *p;
	for (i = 0, p = nums; i != 4; i++, p++)
	printf("%d\n", *p);
	return 0;
}
