.data
Sf:    .string "Pos: %d\n"
Sf1:   .string "Neg: %d\n"
nums:  .int  4, -9, 3, -7, 1
.align 8
Placar:
    .int  0  # pos: 0
    .int  0  # neg: 4
.text
.globl is_positivo
is_positivo:

    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp

    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
INI_IF:
    cmpl  $0, %edi
    jle   ELSE1
    movl  $1, %eax
    jmp   END_IF1
ELSE1:
    movl  $0, %eax
END_IF1:
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
    
    movl  $0, %r8d # i
    movq  $nums, %r14
    movq  $Placar, %r15
INI_FOR:
    cmpl  $5, %r8d
    jge   END_FOR

    IF:
        movl  (%r14), %edi
        call  is_positivo
        cmpl  $1, %eax    
        jne   ELSE
        addl  $1, (%r15)
        jmp   END_IF
    ELSE:
        addl  $1, 4(%r15)
    END_IF:
    addl  $1, %r8d
    addq  $4, %r14
    jmp   INI_FOR
END_FOR:

    movq  $Sf, %rdi
    movl  (%r15), %esi
    movl  $0, %eax
    call printf

    movq  $Sf1, %rdi
    movl  4(%r15), %esi
    movl  $0, %eax
    call  printf

    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    leave
    ret
