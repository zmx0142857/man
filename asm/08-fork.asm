%include 'my.asm'

section .data
	child_msg db 'child process', 0x0
	parent_msg db 'parent process', 0x0

section .text
	global _start

_start:
	mov eax, SYS_FORK
	int 0x80

	cmp eax, 0
	jz child

parent:
	puts parent_msg
	exit 0

child:
	puts child_msg
	exit 0
