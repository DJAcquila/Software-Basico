#include <stdio.h>
#define BLUE 1
#define RED 2
struct Circle{
    int x;
    int y;
    int r;
    char filled;
    long color;
};
struct Circle c1;
int main() {
 c1.x = 10;
 c1.y = 20;
 c1.r = 2 * c1.y;
 c1.filled = 1;
 if (c1.r > 30)
 c1.color = RED;
 else
 c1.color = BLUE;
 printf("color: %ld\n",c1.color);
 return 0;
}