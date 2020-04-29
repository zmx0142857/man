# as hello.s -o hello.o
# ld hello.o -o hello
.section .data

.section .text
	.globl _start

_start:
	movl $1, %eax # calls _exit
	movl $0, %ebx # returns 0
	int $0x80
