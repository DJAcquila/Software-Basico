.data

.text

.globl add
add:
  pushq %rbp
  movq  %rsp, %rbp
  subq  $32, %rsp

  movq  %r12, -8(%rbp)
  movq  %r13, -16(%rbp)
  movq  %r14, -24(%rbp) 
  
  movl  %edi, %r12d  # a
  movl  %esi, %r13d  # b
  movl  %edx, %r14d  # c

  movl  $0, %eax

  addl  %r12d, %eax
  addl  %r13d, %eax
  addl  %r14d, %eax  

  movq  -8(%rbp), %r12
  movq  -16(%rbp), %r13
  movq  -24(%rbp), %r14
  leave
  ret
