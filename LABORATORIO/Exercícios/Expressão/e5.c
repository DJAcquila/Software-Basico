#include <stdio.h>
#include <stdlib.h>

int main()
{
    int valor;
    scanf("%d",&valor);

    int i;
    int acumulo = 0;
    int m100 = 0;
    int m50 = 0;
    int m10 = 0;
    int m1 = 0;

    while(valor != 0)
    {
        if(valor - 100 >= 0)
        {
            valor = valor - 100;
            m100++;
        }
        else if(valor - 50 >= 0)
        {
            valor = valor - 50;
            m50++;
        }
        else if(valor - 10 >= 0)
        {
            valor = valor - 10;
            m10++;
        }
        else if(valor - 1 >= 0)
        {
            valor = valor - 1;
            m1++;
        }
    }

    printf("NOTAS DE 100: %d\nNOTAS DE 50: %d\nNOTAS DE 10: %d\nNOTAS DE 1: %d\n",m100,m50,m10,m1);

    return 0;
}