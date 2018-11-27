%include 'my.asm'

section .data
	msg db 'hello, world!', 0x0

section .text
	global _start

_start:
	puts msg
	exit 0
