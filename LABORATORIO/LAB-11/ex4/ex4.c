#include <stdio.h>
struct Placar {
 int pos;
 int neg;
};
struct Placar placar;
int nums[5] = {4,-9,3,-7,1};
int is_positivo(int a) {
 return (a > 0) ? 1 : 0;
}
int main() {
 int i;
 for (i = 0; i < 5; i++) {
 if (is_positivo(nums[i]))
 placar.pos++;
 else
 placar.neg++;
 }
 printf("Pos: %d\n", placar.pos);
 printf("Neg: %d\n", placar.neg);
 return 0;
 }