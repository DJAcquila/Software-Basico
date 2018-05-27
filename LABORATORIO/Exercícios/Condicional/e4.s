.text

SP:     .string "PALINDROMO\n"
SNI:    .string "NUMERO INVALIDO\n"
SNP:    .string "NAO E PALINDROMO\n"
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
  movl $0, %edi
INI_LOOP:
  cmpl $0, %eax
  jle FIM_LOOP

  movl $0, %edx
  movl $10, %ebx
  idivl %ebx

  imul $10, %edi
  addl %edx, %edi
  jmp INI_LOOP

FIM_LOOP:

IF3:
  cmpl $9999, %esi
  jg PRINT_NI

IF1:
  cmpl %esi, %edi
  je PRINT_PAL

IF2:
  cmpl %esi, %edi
  jne PRINT_NPAL


PRINT_PAL:
  movq $SP, %rdi
  call printf 
  jmp FIM
PRINT_NPAL:
  movq $SNP, %rdi
  call printf 
  jmp FIM
PRINT_NI:
  movq   $SNI, %rdi                  
  call  printf

FIM:

/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  