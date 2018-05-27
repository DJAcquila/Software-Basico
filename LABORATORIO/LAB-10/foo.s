.data
.text
.globl foo
foo:
  pushq %rbp
  movq  %rsp, %rbp
  subq  $16, %rsp

  movq  %r12, -8(%rbp)
  movq  %r13, -16(%rbp)
  
  movq  %rdi, %r14
  movl  %esi, %r14d
  

  movl  $0, %ebx
  movl  $0, %ecx

ini_for:
  cmpl %esi, %ebx
  jge  fim_for  

  addl %ecx, (%r14)
if:
  cmpl $0, (%r14)
  jne fim_if
  movl %ecx, (%r14)
  movl $0, %ecx
fim_if:
  jmp ini_for
  addl $1, %ebx
  addq $4, %r14
fim_for:
  movq  -8(%rbp), %r12
  movq  -16(%rbp), %r13
  leave
  ret
  