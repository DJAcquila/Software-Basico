	.file	"main.c"
	.text
	.globl	add2
	.type	add2, @function
add2:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$24, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	jne	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movq	-24(%rbp), %rax
	movl	(%rax), %ebx
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	add2
	addl	%ebx, %eax
.L3:
	addq	$24, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	add2, .-add2
	.section	.rodata
.LC0:
	.string	"Resultado de add: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$192, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -180(%rbp)
	jmp	.L5
.L6:
	movl	-180(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	leaq	-176(%rax), %rdx
	movl	-180(%rbp), %eax
	movl	%eax, (%rdx)
	addl	$1, -180(%rbp)
.L5:
	cmpl	$9, -180(%rbp)
	jle	.L6
	movl	$9, -180(%rbp)
	jmp	.L7
.L8:
	movl	-180(%rbp), %eax
	leal	-1(%rax), %edx
	leaq	-176(%rbp), %rax
	movslq	%edx, %rdx
	salq	$4, %rdx
	addq	%rax, %rdx
	movl	-180(%rbp), %eax
	cltq
	salq	$4, %rax
	addq	%rbp, %rax
	subq	$168, %rax
	movq	%rdx, (%rax)
	subl	$1, -180(%rbp)
.L7:
	cmpl	$1, -180(%rbp)
	jg	.L8
	leaq	-176(%rbp), %rax
	addq	$144, %rax
	movq	%rax, -168(%rbp)
	movq	$0, -152(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, %rdi
	call	add2
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
