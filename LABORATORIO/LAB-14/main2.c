#include <stdio.h>
#include <stdlib.h>
#define MAX 5
struct Node {
    int size;
    long values[MAX];
};
long sum(long values[], int size);
int main()
{
struct Node node = {MAX, {2,2,3,3,4}};
long s = sum(node.values, node.size);
printf("sum: %ld\n", s);
return 0;
}