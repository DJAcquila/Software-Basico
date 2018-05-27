	.file	"ex2-test.c"
	.comm	produtos,48,32
	.text
	.globl	mais_caro
	.type	mais_caro, @function
mais_caro:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -12(%rbp)
	movq	$-1, -8(%rbp)
	movw	$0, -14(%rbp)
	jmp	.L2
.L4:
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	cmpq	%rax, -8(%rbp)
	jge	.L3
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-24(%rbp), %rax
	movzwl	(%rax), %eax
	movw	%ax, -14(%rbp)
.L3:
	addq	$16, -24(%rbp)
	addl	$1, -12(%rbp)
.L2:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L4
	movzwl	-14(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	mais_caro, .-mais_caro
	.section	.rodata
.LC0:
	.string	"Carne \303\251 a mais cara"
.LC1:
	.string	"Leite \303\251 o mais caro"
.LC2:
	.string	"Ovo \303\251 o mais caro"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movw	$1, produtos(%rip)
	movq	$100, 8+produtos(%rip)
	movw	$2, 16+produtos(%rip)
	movq	$150, 24+produtos(%rip)
	movw	$3, 32+produtos(%rip)
	movq	$70, 40+produtos(%rip)
	movl	$3, %esi
	leaq	produtos(%rip), %rdi
	call	mais_caro
	movw	%ax, -2(%rbp)
	cmpw	$1, -2(%rbp)
	jne	.L7
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
.L7:
	cmpw	$2, -2(%rbp)
	jne	.L8
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L8:
	cmpw	$3, -2(%rbp)
	jne	.L9
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
.L9:
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
