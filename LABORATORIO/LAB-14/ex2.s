.data
.align 8
Node:
    .long  0  # size
    .zero  4  # padding
    .quad  0  # value
    .quad  0
    .quad  0
    .quad  0
    .quad  0
smp:  .string  "sum: %ld\n"

.text
.globl sum
sum:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp

    movq  %r12, -8(%rbp)

    movq  %rdi, %r12
    movq  $0, %rax  # tmp
.WHILE:
    cmpl  $0, %esi
    jle   .FIM_WHILE
    subl  $1, %esi
    movq  %rsi, %rcx
    imulq $8, %rcx
    addq  %r12, %rcx
    addq  (%rcx), %rax
    jmp .WHILE
.FIM_WHILE:
  
    movq  -8(%rbp), %r12 

    leave
    ret    
.globl main
main:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp

    movq  $Node, %rdi
    movl  $5, (%rdi)
    movl  (%rdi), %esi
    movq  $2, 8(%rdi)
    movq  $2, 16(%rdi)
    movq  $3, 24(%rdi)
    movq  $3, 32(%rdi)
    movq  $4, 40(%rdi)
    leaq  8(%rdi), %rdi
    call sum
    movq   $smp, %rdi          
    movq   %rax, %rsi        
    movl   $0, %eax
    call printf

    leave
    ret
