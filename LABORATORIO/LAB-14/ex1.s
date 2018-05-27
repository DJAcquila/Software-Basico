.data
fmt:    .string "val1 = %d\nval2 = %ld\n"
Value:
    .byte  0
    .zero  7
    .quad  0

.text
.globl swap
swap:
    pushq %rbp
    movq  %rsp, %rbp

    movq  8(%rdi), %r8  # tmp
    movsbq (%rdi), %r9
    movq  %r9, 8(%rdi)
    movb  %r8b, (%rdi)
    leave
    ret

.globl main
main:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp

    movq  %r12, -8(%rbp)
    movq  $127, -16(%rbp)
    movq  $1025, -32(%rbp)

    leaq  -16(%rbp), %rdi
    call swap

    movq  $fmt, %rdi
    movsbl -16(%rbp), %esi
    movq  -8(%rbp), %rdx
    movl  $0, %eax
    call printf

    movl  $0, %eax

    leave
    ret
