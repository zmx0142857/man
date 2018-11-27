%include 'my.asm'

section .text
	global _start

_start:
	mov ecx, 0

next_number:
	cmp ecx, 101
	jz quit
	intprint ecx
	putchar ' '
	inc ecx
	jmp next_number

quit:
	putchar 0xa
	exit 0
