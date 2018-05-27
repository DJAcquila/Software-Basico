.data
.align 8
X:
    .int  0  #  0
    .zero 4  #  4
    .quad 0  #  8

.text

.globl add
add:   
    pushq %rbp
    movq  %rsp, %rbp
    subq  $48,  %rsp

    movq  %r12, -8(%rbp) 
    movq  %r13, -16(%rbp)
    
    movl  $0, %eax
FOR:
    cmpq  $0, %rdi
    je   FIM_FOR
    addl  (%rdi), %eax
    movq  8(%rdi), %rdi 
    jmp FOR  
FIM_FOR:

    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    leave
    ret
    
.globl main
main:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp

    movq  %r12, -8(%rbp) 
    movq  %r13, -16(%rbp)

    movq  $X, %rdi
    movl  $0, %ebx
FOR:
    cmpl  $10, %ebx
    jge   END_FOR

    

    addl $1, %ebx
    jmp   FOR
END_FOR:

    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    leave
    ret
    