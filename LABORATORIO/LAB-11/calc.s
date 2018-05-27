.data

.text
.globl sum
.globl calc

calc:
  pushq %rbp
  movq  %rsp, %rbp
  
  subq  $48, %rsp

  movq  %r12, -8(%rbp)
  movq  %r13, -16(%rbp)
  movq  %r14, -24(%rbp)
  movq  %r15, -32(%rbp)

  movl  %edi, %r12d # a
  movl  %esi, %r13d # b
  movl  %edx, %r14d # c
  movl  %ecx, %r15d # d

  addl  $1, %edi
  addl  $2, %edx
  call  sum
  movl  %r12d, %edi # retorna o valor de edi
  movl  %r14d, %edx # retorna o valor de edx

  movl  %eax, %ebx # i

  # ------------------------------ #
  movl  %r13d, %edi # mudei edi
  # ------------------------------ #

  # ------------------------------ #
  addl  $1, %ecx # mudei ecx
  movl  %ecx, %esi # mudei esi
  movl  %r15d, %ecx # voltei o valor de ecx
  # ------------------------------ #

  # ------------------------------ #
  movl  %r12d, %edx # mudei edx
  # ------------------------------ #

  # ------------------------------ #
  movl  %r14d, %r8d
  addl  $2, %r8d
  movl  %r8d, %ecx
  # ------------------------------ #

  call sum
  movl  %r12d, %edi # retorna o valor de a
  movl  %r13d, %esi  # retorna o valor de b
  movl  %r14d, %edx  # retorna o valor de c
  movl  %r15d, %ecx  # retorna o valor de d
  
  movl  %eax, %r8d # j
  
  subl  $1, %edi
  subl  $2, %edx
  call sum
  movl  %r12d, %edi # retorna o valor de edi
  movl  %r14d, %edx # retorna o valor de edx

  addl  %r8d, %eax
  addl  %ebx, %eax


  movq  -8(%rbp), %r12
  movq  -16(%rbp), %r13
  movq  -24(%rbp), %r14
  movq  -32(%rbp), %r15
  
  leave
  ret
