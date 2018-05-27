.data
.text
.globl f
.globl foo
foo:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp
    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
    movq  %r14, -24(%rbp)

    movq  %rdi, %r15
    movl  %esi, %r12d
    movl  %edx, %r13d

    movl  %esi, %ebx
WHILE:
    cmpl  $0, %ebx
    je    FIM_WHILE

    movl  (%r15), %edi
    movl  %r13d,  %esi
    call f
    movl %eax, 4(%r15)

    addq  $8, %r15
    subl  $1, %ebx
    jmp   WHILE
FIM_WHILE:
   

    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    movq  -24(%rbp), %r14
    leave
    ret
    