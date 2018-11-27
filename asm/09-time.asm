%include 'my.asm'

section .data
	msg db 'Seconds since Unix Epoch (Jan 01 1970): ', 0x0

section .text
	global _start

_start:
	puts msg
	mov eax, SYS_TIME
	int 0x80
	call _intprint
	putchar 0xa
	exit 0
