%include 'my.asm'

section .text
	global _start

_start:
	pop ecx		; argc
	mov ebx, 0	; sum = 0

next_arg:
	pop eax		; get argument
	call _atoi
	add ebx, eax
	loop next_arg

	intprint ebx
	putchar 0xa
	exit 0
