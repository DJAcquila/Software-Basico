#include <stdio.h>
#include <stdlib.h>

int main()
{
    int i;
    int numero = 1;
    for(i = 0; i < 10; i++, numero++)
    {
        printf("%d\n", numero*numero);
    }
    return 0;
}