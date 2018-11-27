%include 'my.asm'

section .text
	global _start

_start:
	pop ecx		; first value on the stack is the number of args (argc)

nextarg:
	pop eax		; get arguments
	puts eax
	loop nextarg ; dec ecx; jnz nextarg

finished:
	exit 0
