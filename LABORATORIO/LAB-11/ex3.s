.data
Sf:    .string "color: %ld\n"
.align 8
Circle:
    .int  0  # x: 0
    .int  0  # y: 4
    .int  0  # r: 8
    .byte 0  # filled: 12
    .zero 3  # padding: 13 ate 16
    .long 0  # col: 16

.text
.globl main
main:

    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp

    movq  %rbx, -8(%rbp) 
    movq  %r12, -16(%rbp)

    movq  $Circle, %r13
    movl  $10, (%r13)
    movl  $20, 4(%r13)
    movl  4(%r13), %ecx
    imull $2, %ecx
    movl  %ecx, 8(%r13)
    movb  $1, 12(%r13)    

INI_IF:
    cmpl $30, 8(%r13)
    jle  ELSE
    movl $2, 16(%r13)
    jmp  FIM_IF
ELSE:
    movl $1, 16(%r13)
FIM_IF:

    movq  $Sf, %rdi
    movq  16(%r13), %rsi
    movl  $0, %eax
    call printf

    movq  -8(%rbp), %rbx
    movq  -16(%rbp), %r12

    leave
    ret
