SYS_EXIT	equ 1
SYS_FORK	equ 2
SYS_READ	equ 3
SYS_WRITE	equ 4
SYS_EXECVE	equ 11
SYS_TIME	equ 13
STDIN		equ 0
STDOUT		equ 1

; exit the program with return value
;	int exit(int)
%macro exit 1
	mov ebx, %1
	mov eax, SYS_EXIT
	int 0x80
%endmacro

%macro push_all 0
	push edx
	push ecx
	push ebx
	push eax
%endmacro

%macro pop_all 0
	pop eax
	pop ebx
	pop ecx
	pop edx
%endmacro

; print string to stdout
;	void strprint(const char*)
%macro strprint 1
	push ecx
	mov ecx, %1
	call _strprint
	pop ecx
%endmacro

; print char to stdout
;	void putchar(const char)
%macro putchar 1
	push eax
	mov eax, %1
	call _putchar
	pop eax
%endmacro

; print string to stdout with linefeed \n
;	void puts(const char*)
%macro puts 1
	push ecx
	mov ecx, %1
	call _puts
	pop ecx
%endmacro

; read string from stdin to buffer
;	void gets(char*, size_t)
%macro gets 2
	push edx
	push ecx
	mov ecx, %1
	mov edx, %2
	call _gets
	pop ecx
	pop edx
%endmacro

%macro intprint 1
	push eax
	mov eax, %1
	call _intprint
	pop eax
%endmacro

%macro atoi 1
	mov eax, %1
	call _atoi
%endmacro

;---------------------------------------------------------------

; calculate length of string
;	input: char *ecx
;	output: size_t edx
_strlen:
	mov edx, ecx

	.nextchar:
		cmp byte [edx], 0
		jz .finished
		inc edx
		jmp .nextchar

	.finished:
		sub edx, ecx
		ret

; print string to stdout
;	input: char *ecx
_strprint:
	push edx
	push ebx
	push eax
	call _strlen

	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80

	pop eax
	pop ebx
	pop edx
	ret

; print char to stdout
;	input: char eax
_putchar:
	push_all

	mov edx, 1
	mov ecx, esp	; esp points to the copy of eax in stack
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	int 0x80

	pop_all
	ret

; print string to stdout with linefeed \n
;	input: char *ecx
_puts:
	call _strprint
	putchar 0xa
	ret

; read string from stdin to buffer
;	input: char *ecx, size_t edx
_gets:
	push ebx
	push eax

	mov ebx, STDIN
	mov eax, SYS_READ
	int 0x80

	dec eax
	mov byte [ecx+eax], 0x0	; replace \n with \0

	pop eax
	pop ebx
	ret

; print int to stdout
;	input: int eax
_intprint:
	push_all

	mov ebx, 10			; divisor
	mov ecx, 0			; counts chars to be print

	.div_loop:
		mov edx, 0		; must clear edx before idiv instruction
		idiv ebx		; eax, edx = eax / 10
		add edx, '0'
		push edx
		inc ecx
		cmp eax, 0
		jnz .div_loop

	.print_loop:
		mov eax, [esp]
		call _putchar	; can be improved?
		pop eax
		loop .print_loop; decrease ecx automatically

	pop_all
	ret

; ascii to int
;	input: char *eax
;	output: int eax
_atoi:
	push ecx
	push ebx
	push esi

	mov esi, eax
	mov eax, 0
	mov ebx, 10

	.ignore_space:
		xor ecx, ecx		; clear ecx
		mov cl, [esi]
		cmp cl, 0x20		; space
		jz .next_char
		cmp cl, 0xa			; linefeed
		jz .next_char
		cmp cl, 0x9			; tab
		jz .next_char
		jmp .mul_loop
	.next_char:
		inc esi
		jmp .ignore_space

	.mul_loop:
		xor ecx, ecx
		mov cl, [esi]
		cmp cl, '0'
		jl .finished
		cmp cl, '9'
		jg .finished
		mul ebx			; eax *= 10; warning: this clears edx to 0
		sub eax, '0'
		add eax, ecx	; eax += ecx
		inc esi
		jmp .mul_loop

	.finished:
		pop esi
		pop ebx
		pop ecx
		ret
