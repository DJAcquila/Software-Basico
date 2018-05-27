#include <stdio.h>
#include <stdlib.h>
#define CARNE 1
#define LEITE 2
#define OVO 3
struct Produto {
 short produto;
 long preco;
};
struct Produto produtos[3];
short mais_caro(struct Produto *ptr, int size) {
 int i = 0;
 long preco = -1;
 short produto = 0;
 while (i < size) {
 if (ptr->preco > preco) {
 preco = ptr->preco;
 produto = ptr->produto;
 }
 ptr++;
 i++;
 }
 return produto;
}
int main() {
 produtos[0].produto = CARNE;
 produtos[0].preco = 100;
 produtos[1].produto = LEITE;
 produtos[1].preco = 150;
 produtos[2].produto = OVO;
 produtos[2].preco = 70;
 short p = mais_caro(produtos, 3);
 if (p == CARNE) printf("Carne é a mais cara\n");
 if (p == LEITE) printf("Leite é o mais caro\n");
 if (p == OVO) printf("Ovo é o mais caro\n");
 return 0;
}