.text

St1:    .string "O NUMERO E DIVISIVEL\n"
St2:    .string "O NUMERO NAO E DIVISIVEL\n"
.globl  main

main:

/*----------------------------------- Inicializacao: não mexa -----------------------------------------*/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
/*------------------------------------------------------------------------------------------------------*/

  movl $0, %eax
  call read_int_to_eax
  movl %eax, %esi
IF1:
  movl $0, %edx
  movl %esi, %eax
  movl $3, %ebx
  idivl %ebx
  cmpl $0, %edx
  jne FIM_ERRO

IF2:
  movl $0, %edx
  movl %esi, %eax
  movl $5, %ebx
  idivl %ebx
  cmpl $0, %edx
  jne FIM_ERRO


FIM_CERTO:
  movq $St1, %rdi
  call printf 
  jmp FIM

FIM_ERRO:
  movq   $St2, %rdi                  
  call  printf


FIM:

/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  