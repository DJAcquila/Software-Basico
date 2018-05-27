.text
.globl add2
add2:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp

IF:
    cmpq  $0, %rdi
    jne   ELSE
    movl  $0, %eax
    jmp   FIM_IF
ELSE:
    movl  (%rdi), %eax
    movl  %eax, -8(%rbp)
    movq  8(%rdi), %rdi
    call  add2
    addl  -8(%rbp), %eax
FIM_IF:

    leave
    ret
    