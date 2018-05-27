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
  movl %eax, %esi
  movl $0, %edi
  
INI_LOOP:
  cmpl $0, %esi /* esi é o numero */
  jle FIM_LOOP
  
  movl $0, %edx /* edx é minha variável de resto */
  movl %esi, %eax
  movl $10, %ebx
  idivl %ebx
  
  /* Aqui eu havia usado edi no lugar de ecx, e tava impriminto um 1 na frente, apos substituir por ecx deu x */
  imull $10, %edi /* edi é minha variável de inversão */
  addl %edx, %edi

  movl %eax, %esi
  jmp INI_LOOP

FIM_LOOP:
  movl %edi, %eax
  call print_eax_as_int


FIM:

/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  