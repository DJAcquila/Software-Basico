.data
.text
.globl f
.globl map2
map2:
    pushq %rbp
    movq  %rbp, %rsp
    subq  $48, %rsp

    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
    movq  %r14, -24(%rbp)
    movq  %r15, -32(%rbp)

    movq  %rdi, %r12
    movq  %rsi, %r13
    movq  %rdx, %r14

    movl  $0, %r15d # i
FOR:
    cmpl  %r14d, %r15d
    jge   END_FOR

    movq  %r15, %rcx
    movq  $4, %rcx
    addq  %r12, %rcx
    movl  (%rcx), %edi
    
    call f

    movq  %r15, %rcx
    imulq $4,  %rcx
    addq  %r13, %rcx
    movl  %eax, (%rcx)
    
    
    incl %r15d
    jmp  FOR
END_FOR:

    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    movq  -24(%rbp), %r14
    movq  -32(%rbp), %r15
    leave 
    ret
    