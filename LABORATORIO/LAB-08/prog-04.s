.data

nums:    .int     65, -105, 111, 34

.text

.globl  main

main:

/*----------------------------------- Inicializacao: não mexa -----------------------------------------*/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
/*------------------------------------------------------------------------------------------------------*/
  
  movl    $0, %ebx # i = 0
  movl    $0, %eax # soma = 0
  movq    $nums, %r12  

LOOP_INI:

  cmpl $4, %ebx
  jge FIM

  movl  %ebx, %ecx
  movq  %r12, %r13

  /* addr(A[i]) = addr(A) + i * sizeof(T) */
  imull   $4, %ebx # i*sizeof(T)
  movslq  %ebx, %r14 # extende o resultado da operação para somar com o endereço guardado em r12
  addq    %r14, %r12 # addr(A) + ebx
  addl    (%r12), %eax # soma o valor atual de eax com o valor da posição de memória apontada por r12

  movl  %ecx, %ebx
  movq  %r13, %r12

  
LOOP_FIM:
  addl $1, %ebx
  jmp LOOP_INI

FIM:
  
  call print_eax_as_int
  
/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  