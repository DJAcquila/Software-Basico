.text
Sta:    .string "%d,"
Stb:    .string " %d\n"
St1:    .string "DIGITO INVALIDO\n"
.globl  main

main:

/*----------------------------------- Inicializacao: não mexa -----------------------------------------*/
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
/*------------------------------------------------------------------------------------------------------*/

  movl $0, %eax
  call read_int_to_eax
  movl %eax, %ebx

  movl $0, %eax
  call read_int_to_eax
  movl %eax, %ecx

  movl $0, %eax
  call read_int_to_eax
  movl %eax, %edi

IF1:
  cmp $10, %ebx
  jge FIM_ERRO

IF2:
  cmp $10, %ecx
  jge FIM_ERRO

IF3:
  cmp $10, %edi
  jge FIM_ERRO
  
  # Multiplica os dois primeiros digitos para dps somar
  imull $100, %ebx
  imull $10, %ecx

  addl %ebx, %ecx
  addl %ecx, %edi

  movl $0, %eax
  movl %edi, %eax

  movq   $Sta, %rdi              
  movl   %eax, %esi              
  movl    $0, %eax                
  call  printf
  # realizar o quadrado do numero
  movl $0, %eax
  imull %edi, %edi
  movl %edi, %eax

  movq   $Stb, %rdi              
  movl   %eax, %esi              
  movl    $0, %eax           
  call  printf
  jmp FIM
FIM_ERRO:
 
  movq   $St1, %rdi                  
  call  printf


FIM:

/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  