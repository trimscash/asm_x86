	.file	"tes.c"
	.text
	.globl	sss
	.bss
	.align 4
	.type	sss, @object
	.size	sss, 4
sss:
	.zero	4
	.section	.rodata
.LC0:
	.string	"aaa"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$4545, sss(%rip)
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Debian 10.3.0-11) 10.3.0"
	.section	.note.GNU-stack,"",@progbits
