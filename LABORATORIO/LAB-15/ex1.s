.data
stri1:  .string  "%d/%d/%d"
stri2:  .string  "Nome: %s, nascido %s\n"
nome:   .string  "Ernesto"
.text
.globl main
.globl format
format:
	pushq %rbp
	movq  %rsp, %rbp
	subq  $24, %rsp

	movq  %rdi, -8(%rbp)
	movq  %rsi, -16(%rbp)

	movq  -8(%rbp), %rcx # buffer
	movq  -16(%rbp), %r10 # date_t

	movq  $stri1, %rsi
	movzbl 5(%r10), %edx
	movzbl 4(%r10), %ecx
	movl  (%r10), %r8d
	movl  $0, %eax
	call sprintf

	movq  -8(%rbp), %rcx
	movq  -16(%rbp), %r10
	leave
	ret

.globl show
show:
	pushq %rbp
	movq  %rsp, %rbp
	subq  $32, %rsp
	movq  %rdi, -16(%rbp) # salvo endereco da struct na pilha
	leaq  8(%rdi), %rsi  # recupero endereco de memoria da struct, para passar como parametro
	leaq  -32(%rbp), %rdi  # &a
	call format 
	movq  -16(%rbp), %rsi # Recupero o endereco da struct da pilha
	movq  (%rsi), %rsi
	leaq  -32(%rbp), %rdx # Recupero o endereco de memoria do vetor local
	movq  $stri2, %rdi
	movl  $0, %eax
	call printf
	leave
	ret

.globl main
main:

	pushq %rbp
	movq  %rsp, %rbp
	subq  $48, %rsp

	movq  $nome, %rbx
	movq  %rbx, -48(%rbp)
	movl  $2002, -40(%rbp)
	movb  $3, -36(%rbp)
	movb  $15, -35(%rbp)

	leaq  -48(%rbp), %rdi
	call show

	movq  -48(%rbp), %rbx 
	leave
	ret
