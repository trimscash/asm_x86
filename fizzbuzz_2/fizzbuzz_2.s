.intel_syntax noprefix
.global main
#
#	.text
#	.global buff
##	.bss 
#	.align 32#tabun 32byte bun nop de umeteru
#	.type buff, @object
##	.size buff, 32
#buff:
#	.zero 32
##	.section .rodata
main:
	mov rcx, 0
#	push 4
#	push [_fizz]
#	call print
loop:
	push rcx#index hyouji
	call print_num##
fizz:#3|rcx=>fizz
	mov rdx, 0#joui byte wararerukazu
	mov rax, rcx#kai byte wararerukazu
	mov r15, 3#waru kazu
	div r15#waru rdx ni amari     rax ni shou
	cmp rdx, 0#rcx-0 rdx amari rax shou
	jnz fizzend#
	push 4
	lea r11, _fizz
	push r11
	call print#
	pop r15
	pop r15
fizzend:
buzz:
	mov rdx, 0x0#joui byte wararerukazu
	mov rax, rcx#kai byte wararerukazu
	mov r15, 5#waru kazu
	div r15#waru rcx ni amari     rax ni shou
	cmp rdx, 0x0#rcx-0
	jnz buzzend#
	push 4
	lea r11, _buzz
	push r11
	call print
	pop r15
	pop r15
buzzend:
	inc rcx

	push 1
	lea r11,_newline
	push r11
	call print

	cmp rcx, 0x10
	jnz loop
loopend:
exit:
	mov rax, 60#exit 
	mov rdi, 0x1
	syscall 

#push num/call print_num
#sei no sei suu wo hyoujun shutu ryoku
print_num:
	push rcx
	push r15
	push r14
	push r13
	push r12
	push rdi
	push rbp
	mov rbp, rsp
	mov r15, [rbp+64]#dai 1 hikisuu
	mov rcx, 0
	mov r14, 1
	push 0#null
print_num_loop:
	mov rax, r14
	mov r11, 10
	mul r11
	mov r14, rax 
	mov rdx, 0
	mov rax, r15#wararerukazu
	div r14# rax shou /rdx amari
	mov r13, rdx
	mov r15, rax
	add r13, 48#asciiiiii
	push r13 
#	push 1
#	push [rsp+8] 
#	call print
#	mov rax, r13
#	pop r13
#	pop r13
#	pop r13
#	mov [rdi], r13#1 byte dutu memori ni dainyuu
	inc rcx#ketasuu
#	inc rdi
	cmp r15, 0
	jnz print_num_loop
print_num_loop_end:
#	mov rax, 0x00
#	mov rdi, rax
	
	inc rcx#size ketasuu
	
	mov rax, 12
	mov rdi, 0
	syscall#brk ni 0 wo watasi gennzaino heap seg no address wo shutoku(rax
	mov r12, rax
	
	mov rax, 12
	mov rdi, r12
	add rdi, rcx
	syscall#brk ni rcx wo watasi rcx byte wokakuho senntou address ha rax ni

	mov rcx,0
print_num_loop_write_mem:
	pop r13
	cmp r13, 0
	jz print_num_loop_write_mem_end#null gakitara osimai
	mov r15, r12
	add r15, rcx
	mov [r15], r13 
	inc rcx
	jmp print_num_loop_write_mem
print_num_loop_write_mem_end:
	push rcx
	push r12
	call print
	pop r12
	pop r12
	
	pop rbp
	pop rdi
	pop r12
	pop r13
	pop r14
	pop r15
	pop rcx
	ret
#subrootin end



#push address (not string
#print string      push address
print:
	push rax
	push rcx
	push rbp
	mov rbp, rsp
	mov rcx, 0x0
#print_loop:
#	lea r15, [rbp+32+rcx]
#	cmp r15, 0x1#"\0"
#	inc rcx
#	jnz print_loop
#print_end:
	mov rax, 0x1#write
	mov rdi, 0x1#std 1
	mov rsi, [rbp+32]#mojiretu address
	mov rdx, [rbp+40]#size
	syscall
	pop rbp
	pop rcx
	pop rax
	ret#
#subrootin end

_newline:
	.ascii "\n"
_fizz:
	.ascii "fizz"

_buzz:
	.ascii "buzz"
