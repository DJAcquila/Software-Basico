.data
carne:  .string "Carne é a mais cara\n"
leite:  .string "Leite é o mais caro\n"
ovo:    .string "Ovo é o mais caro\n"

.align 8
Produto:
    .short  0  # produto 0
    .zero   6
    .long   0  # preco 8
    # Vai ate 16
.text
.globl mais_caro
mais_caro:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp

    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
    movq  %r14, -24(%rbp)

    movq  %rdi, %rcx # primeiro parametro: struct Produto *ptr
    movl  %esi, %ecx # segundo parametro: int size
    
    movl  $0, %ebx  # i
    movq  $-1, %r8  # preco
    movw  $0, %dx  # produto
WHILE:
    cmp  %esi, %ebx
    jge  FIM_WHILE
    IF1:
        cmpq  %r8, 8(%rcx)
        jle   END_IF1
        movq  8(%rcx), %r8 
        movw  (%rcx), %dx
    END_IF1:
    addq  $16, %rcx 
    addl  $1, %ebx 
    jmp   WHILE
FIM_WHILE:
    movw %dx, %ax
    
    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    movq  -24(%rbp), %r14

    leave
    ret

.globl main
main:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $16, %rsp

    movq  %r12, -8(%rbp)
    movq  %r13, -16(%rbp)
    movq  $Produto, %rdx
    # produtos[0].produto = CARNE;
    movw  $1, (%rdx)
    # produtos[0].preco = 100;
    movq  $100, 8(%rdx)
    # produtos[1].produto = LEITE;
    movw  $2, 16(%rdx)
    # produtos[1].preco = 150;
    movq  $150, 24(%rdx)
    # produtos[2].produto = OVO;
    movw  $3, 32(%rdx)
    # produtos[2].preco = 70;
    movq  $70, 40(%rdx)

    movq  %rdx, %rdi
    movl  $3, %esi
    movw  $0, %ax
    call  mais_caro
    
IF:
    cmpw  $1, %ax
    jne   IF2
    movq  $carne, %rdi
    call printf
IF2:
    cmpw  $2, %ax
    jne   IF3
    movq  $leite, %rdi
    call printf
IF3:
    cmpw  $3, %ax
    jne   END_IF
    movq  $ovo, %rdi
    call printf
END_IF:

    movq  -8(%rbp), %r12
    movq  -16(%rbp), %r13
    leave
    ret
