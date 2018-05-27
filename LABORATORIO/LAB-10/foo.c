#include <stdio.h>
#include <stdlib.h>
void foo (int a[], int n);
int main()
{
    int v[3];
    foo(v, 3);
    int i;
    for(i = 0; i < 3; i++)
        printf("%d ", v[i]);

    return 0;
}