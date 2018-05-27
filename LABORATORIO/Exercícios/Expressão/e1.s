.text

.globl  main

main:

/*----------------------------------- Inicializacao: não mexa -----------------------------------------*/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
/*------------------------------------------------------------------------------------------------------*/
  movl $0, %eax
  call read_int_to_eax
  movl %eax, %ebx /*ebx é a*/

  movl $0, %eax
  call read_int_to_eax
  movl %eax, %ecx /*ecx é b*/

  movl $0, %eax
  call read_int_to_eax
  movl %eax, %edx /*edx é c*/

  /*Salvar valores iniciais de ebx, ecx edx*/
  
  /*Multiplicação de 4ac*/
  imull $4, %ebx, %eax
  imull %edx, %eax

  /*Multiplicação b*b*/
  imull %ecx, %ecx
  /*Subtração* b*b - 4ac*/
  subl  %eax, %ecx

  movl %ecx, %eax
  call print_eax_as_int


FIM:
  
/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  