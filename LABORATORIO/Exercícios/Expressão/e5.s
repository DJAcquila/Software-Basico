.text
S100:    .string "NOTAS DE 100 = %d\n"
S50:     .string "NOTAS DE 50 = %d\n"
S10:     .string "NOTAS DE 10 = %d\n"
S1:      .string "MOEDAS DE 1 = %d\n"

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
  movl $0, %r10d /* 100 */
  movl $0, %r13d /* 50  */
  movl $0, %r14d /* 10  */
  movl $0, %r15d /* 1   */
INI_LOOP:
  cmpl $0, %esi /* esi é o numero */
  je FIM_LOOP
  
IF1:
  movl %esi, %ebx
  subl $100, %ebx
  cmpl $0, %ebx
  jl IF2
  movl %ebx, %esi
  addl $1, %r10d
  jmp INI_LOOP

IF2:
  movl %esi, %ebx
  subl $50, %ebx
  cmpl $0, %ebx
  jl IF3
  movl %ebx, %esi
  addl $1, %r13d
  jmp INI_LOOP

IF3:
  movl %esi, %ebx
  subl $10, %ebx
  cmpl $0, %ebx
  jl IF4
  movl %ebx, %esi
  addl $1, %r14d
  jmp INI_LOOP

IF4:
  movl %esi, %ebx
  subl $1, %ebx
  cmpl $0, %ebx
  jl INI_LOOP
  movl %ebx, %esi
  addl $1, %r15d
  jmp INI_LOOP

FIM_LOOP:
  
  movq   $S100, %rdi               # primeiro parametro (ponteiro)
  movl   %r10d, %esi               # segundo parametro  (inteiro)
  movl    $0, %r10d                # zera eax
  call  printf                    # chama a funcao da biblioteca

  movq   $S50, %rdi               # primeiro parametro (ponteiro)
  movl   %r13d, %esi               # segundo parametro  (inteiro)
  movl    $0, %r13d                # zera eax
  call  printf                    # chama a funcao da biblioteca

  movq   $S10, %rdi               # primeiro parametro (ponteiro)
  movl   %r14d, %esi               # segundo parametro  (inteiro)
  movl    $0, %r14d                # zera eax
  call  printf                    # chama a funcao da biblioteca

  movq   $S1, %rdi               # primeiro parametro (ponteiro)
  movl   %r15d, %esi               # segundo parametro  (inteiro)
  movl    $0, %r15d                # zera eax
  call  printf                    # chama a funcao da biblioteca


FIM:

/*---------------------------------  Finalizacao: não mexa ---------------------------------------------*/
movl $0, %eax
leave
ret
  