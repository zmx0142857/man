%include 'my.asm'

section .data
	cmd db '/bin/echo', 0x0
	arg1 db 'Hello, world!', 0x0
	args dd cmd, arg1, 0x0
	env dd 0x0

section .text
	global _start

_start:
	mov edx, env
	mov ecx, args
	mov ebx, cmd
	mov eax, SYS_EXECVE
	int 0x80
	exit 0
