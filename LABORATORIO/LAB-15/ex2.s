/*
struct date_t{
    int ano   0 +4
    char mes  4 +1 
    char dia  5 +1
    padding:  2 +2
};
    Tamanho:  8
*/
/*
struct pessoa_t{
    char *nome;  0 +8
    struct date_t nascimento;  +8 
    padding:  0
};
    Tamanho: 
*/
.data
.Lstring1:   .string "Ernesto"
.Lstring2:   .string "Borges"
.Lstring3:   .string "Cecilia"
.Lprintf:    .string "%s nasceu no mesmo dia de %s\n"
.text
.globl compare
compare:
    pushq %rbp
    movq  %rsp, %rbp

    movl  $0, %eax  # resp

.LIF1:   
    movb  5(%rsi), %cl
    cmpb  5(%rdi), %cl
    jne   .LFINAL
.LIF2:
    movb  4(%rsi), %cl
    cmpb  4(%rdi), %cl
    jne   .LFINAL
.LIF3:
    movb  (%rsi), %cl
    cmpb  (%rdi), %cl
    jne   .LFINAL
.LIF_INSIDE:
    movl  $1, %eax
.LFINAL:
    leave
    ret

.globl main
main:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $64, %rsp

    movq  $.Lstring1, -48(%rbp)
    movl  $2002, -40(%rbp)
    movb  $3, -36(%rbp)
    movb  $15, -35(%rbp)
    # padding 2
    movq  $.Lstring2, -32(%rbp)
    movl  $2002, -24(%rbp)
    movb  $3, -20(%rbp)
    movb  $15, -19(%rbp)
    # padding 2
    movq  $.Lstring3, -16(%rbp)
    movl  $2001, -8(%rbp)
    movb  $8, -4(%rbp)
    movb  $2, -3(%rbp)

    movq  %r14, -64(%rbp)
    movq  %r15, -56(%rbp)
    movl  $0, %r14d

.L_ini_for_1:
    cmpl  $3, %r14d
    jge   .L_fim_for_1
    movl  $0, %r15d
    .L_ini_for_2:
        cmpl  $3, %r15d
        jge   .L_fim_for_2
        .L_if1:
            cmpl  %r14d, %r15d
            je .L_endif2
        .L_endif1:
        .L_if2:
            leaq  -40(%rbp), %rdi
            movl  %r14d, %r12d
            imull $16, %r12d
            addq  %r12, %rdi

            leaq  -40(%rbp), %rsi
            movl  %r15d, %r13d 
            imull $16, %r13d
            addq  %r13, %rsi

            call  compare
            cmpl  $0, %eax
            je    .L_endif2

            movq  $.Lprintf, %rdi

            leaq  -48(%rbp), %r8
            movl  %r14d, %r12d
            imull $16, %r12d
            addq  %r12, %r8
            movq  (%r8), %rsi

            leaq  -48(%rbp), %r9
            movl  %r15d, %r12d
            imull $16, %r12d
            addq  %r12, %r9
            movq  (%r9), %rdx

            movl  $0, %eax
            call printf
        .L_endif2:
        addl  $1, %r15d
        jmp  .L_ini_for_2
    .L_fim_for_2:
    addl  $1, %r14d
    jmp  .L_fim_for_1
.L_fim_for_1:
    movq  -64(%rbp), %r14
    movq  -56(%rbp), %r15
    leave
    ret
