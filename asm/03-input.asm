%include 'my.asm'

section .data
	msg1 db 'what is your name? ', 0x0
	msg2 db 'hello, ', 0x0
	len equ 255

section .bss
	buffer resb len

section .text
	global _start

_start:
	strprint msg1
	gets buffer, len
	strprint msg2
	puts buffer
	exit 0
