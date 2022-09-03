.intel_syntax noprefix
.global main

main:
	lea r11, _descriptionText
	push r11
	call print
	pop r11#r11 ni butikonderu noha nantonaku 
	
	lea r11, _jankenStartText
	push r11
	call print
	pop r11

	call getChar#rax will be destroyed
	xor r14, r14
	mov r14,rax
	sub r14, 0x30
checkHand:
	cmp r14, 2
	jle checkHand_1
	jmp exception
checkHand_1:
	cmp r14, 0
	jge checkHand_end
	jmp exception
checkHand_end:
	push r14
	call printHand
	pop r14

	call getRand#RIP rax
	mov r15, rax
	push r15
	call printHand
	pop r15

judge:	
	sub r14, r15
	mov rax, r14
	mov rdx, 0
	add rax, 3
	mov r11,3
	div r11#rdx..0 draw 1 lose 2 win
drawJudge:
	cmp rdx, 0
	jnz loseJudge
	lea r11, _draw
	push r11
	call print
	pop r11
	jmp endJudge
loseJudge:
	cmp rdx, 1
	jnz winJudge
	lea r11, _lose
	push r11
	call print
	pop r11
	jmp endJudge
winJudge:
	cmp rdx, 2
	jnz exception
	lea r11, _win
	push r11
	call print
	pop r11
	jmp endJudge
exception:
	lea r11, _exception
	push r11
	call print
	jmp endJudge
endJudge:
	jmp exit

#end main######################

#print hand
#(int(0~2))
printHand:
	push r15
	push r14
	push rbp
	mov rbp, rsp
	mov r15, [rbp+32]
printHand_case_0:
	cmp r15,0
	jnz printHand_case_1
	lea r14, _GU
	push r14
	call print
	pop r14
	jmp printHand_end
printHand_case_1:
	cmp r15, 1
	jnz printHand_case_2
	lea r14, _CHOKI
	push r14
	call print
	pop r14
	jmp printHand_end
printHand_case_2:
	cmp r15, 2
	jnz printHand_end
	lea r14, _PA
	push r14
	call print
	pop r14
	jmp printHand_end
printHand_end:
	pop rbp
	pop	r14
	pop r15
	ret


#destory rax
getRand:
	push r11
	push rdx
	mov rax, 0
	mov rdx, 0
	rdrand rax
	mov r11,3
	div r11
	mov rax, rdx
	pop rdx
	pop r11
	ret

#destroy rax
#input char to rax
getChar:
	push rcx
	push r11
	mov rax, 0#read
	mov rdi, 0#stdin
	lea r11, [_input]
	mov rsi, r11
	mov rdx, 2 
	syscall
	xor rax,rax
	movb al, _input
	pop r11
	pop rcx
	ret


#print string
#(string_adr)
print:
	push rax
	push r11
	push rcx
	push rbp
	push r15
	push rbp
	mov rbp, rsp
	mov rcx, 0
print_loop:
	mov r11, [rbp+56]
	add r11, rcx
	movb r15b, [r11]
	inc rcx
	cmp r15b, 0x0#\0
	jnz print_loop#
print_loop_end:
	mov rax, 1
	mov rdi, 1
	mov rdx, rcx
	mov rsi, [rbp+56]
	syscall
	pop rbp
	pop r15
	pop rbp
	pop rcx
	pop r11
	pop rax
	ret

#exit
exit:
	mov rax, 60
	mov rdi, 1
	syscall

.data

_input:
	.asciz "00"

_jankenStartText:
	.asciz "JanKen~"

_descriptionText:
	.asciz "0:GU 1:CHOKI 2:PA\n"

_GU:
	.asciz "GU\n"
	
_CHOKI:
	.asciz "CHOKI\n"
	
_PA:
	.asciz "PA\n"

_lose:
	.asciz "YOU LOSE...bye!"

_win:
	.asciz "YOU WIN!!!bye!"

_draw:
	.asciz "DRAW!!WE ARE FRIENDS!!"

_exception:
	.asciz "FU*K YOU!!"
