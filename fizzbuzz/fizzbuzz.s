.intel_syntax noprefix
.global main

main:
	mov rcx, 0x0
loop:
	mov rdx, 0
	mov rax, rcx
	mov r15, 0x03
	div r15
	cmp rdx, 0
	jnz skip1
	call fizz
skip1:
	mov rdx, 0
	mov rax, rcx
	mov r15, 0x05
	div r15
	cmp rdx, 0
	jnz skip2
	call buzz
skip2:
	inc rcx
	cmp rcx, 0x10
	jz exit
	call newline
	jmp loop
	


exit:
	mov rax, 0x3c
	syscall


newline:
	mov rdx, 0x01 
	lea rsi, [_newline]
	mov rax, 0x01
	push rcx
	syscall
	pop rcx
	ret

fizz:
	mov rdx, 0x04
	lea rsi, [_fizz]
	mov rax, 0x01
	push rcx
	syscall
	pop rcx
	ret
buzz:
	mov rdx, 0x04
	lea rsi, [_buzz]
	mov rax, 0x01
	push rcx
	syscall
	pop rcx
	ret

_fizz:
	.ascii "fizz"
_buzz:
	.ascii "buzz"
_newline:
	.ascii "\n"
