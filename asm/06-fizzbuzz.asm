%include 'my.asm'

section .data
	fizz db 'fizz', 0x0
	buzz db 'buzz', 0x0

section .text
	global _start

_start:
	mov edi, 1
	mov ebx, 3
	mov ecx, 5
	mov esi, 15

loop:
	mov eax, edi
	xor edx, edx
	div esi
	cmp edx, 0
	mov eax, edi
	jz .fizzbuzz

	xor edx, edx
	div ebx
	cmp edx, 0
	mov eax, edi
	jz .fizz

	xor edx, edx
	div ecx
	cmp edx, 0
	mov eax, edi
	jz .buzz

	call _intprint
	jmp .next

	.fizzbuzz:
		strprint fizz

	.buzz:
		strprint buzz
		jmp .next
	
	.fizz:
		strprint fizz
		jmp .next
	
	.next:
		putchar ' '
		inc edi
		cmp edi, 101
		jnz loop

	putchar 0xa
	exit 0
