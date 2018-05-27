.text

St1:    .string "%d^2 = "
St2:    .string "%d\n"
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
  movl $2, %ebx
  
INI_LOOP:
  cmpl %esi, %ebx
  jg FIM
  
  movl $0, %ecx # zera ecx
  movl %ebx, %ecx # ebx recebe ecx
  imull %ecx, %ecx # ecx eh seu quadrado

  movl %ecx, %eax
  call print_eax_as_int

  addl $2, %ebx
  jmp INI_LOOP
FIM:

/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
