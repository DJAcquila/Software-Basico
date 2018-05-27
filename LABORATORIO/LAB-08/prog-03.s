.data

Sf:    .string "%d\n"    /* primeira string de formato para printf */

.text

.globl  main
main:

/*----------------------------------- Inicializacao: não mexa -----------------------------------------*/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
/*------------------------------------------------------------------------------------------------------*/
  
  movl $0, %ebx
  movl $1, %eax

LOOP_INI:
  cmp $10, %ebx
  jge FIM
  
  /*Ideia: Primeiro mover o valor do registrador eax para ecx, 
  multiplicar eax por eax, imprimir eax, 
  mover de volta o valor inicial de eax que estava em ecx*/

  movl     %eax, %ecx
  imull    %eax, %eax
  call print_eax_as_int
  movl     %ecx, %eax

LOOP_FIM:
  incl %ebx
  incl %eax
  jmp LOOP_INI
FIM:
/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  