.data

nums:    .int     10, -21, -30, 45

.text

.globl  main

main:

/*----------------------------------- Inicializacao: não mexa -----------------------------------------*/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
/*------------------------------------------------------------------------------------------------------*/
  
  movl    $0, %ebx # i = 0
  movq    $nums, %r12  

LOOP_INI:

  cmp $4, %ebx
  je FIM

RESTO:
  movl  $0, %edx
  movl  (%r12), %ecx
  movl  $2, %r13d
  idiv %r13d
IF:
  cmpl  $0, %edx
  jne FIM
  cmpl  $0, (%r12)
  jle FIM
  
  movl (%r12), %eax 
  
PRINT:
  call print_eax_as_int
  
LOOP_FIM:
  addl $1, %ebx
  addq $4, %r12
  jmp LOOP_INI

  

FIM:
  
/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  