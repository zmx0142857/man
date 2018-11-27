; compile and link----------------------------------------------

; $ nasm -f elf hello.asm
; $ ld -m elf_i386 -s -o hello hello.o

; hello.asm-----------------------------------------------------

section .data
	msg db 'Hello, world!', 0xa ; string to be printed, 0xa is newline
	len equ $-msg               ; length of the string

section .text
    global _start               ; must be declared for linker (ld)

_start:                         ; tells linker entry point
	; write msg
    mov eax, 4                  ; system call number (sys_write)
    mov ebx, 1                  ; file descriptor (stdout)
    mov ecx, msg                ; message to write
    mov edx, len                ; message length
    int 0x80                    ; call kernel

	; exit
    mov eax, 1                  ; system call number (sys_exit)
	mov ebx, 0                  ; return value
    int 0x80                    ; call kernel

; debug.exe-----------------------------------------------------

; -r        show and modify the registers
; -d        show what's in memory
; -e        modify memory by hex code
; -a        modify memory by using assembly
; -u        translate memory to assembly
; -t        execute current command

; registers-----------------------------------------------------

; data registers:

	; 32-bits:

		eax, ebx, ecx, edx.

	; 16-bits (lower parts of 32-bit ones):

		ax; accumulator, used in arithmetic
		bx; base, used in addressing
		cx; count, stores loop count
		dx; data, used with ax for arithmetic

	; 8-bits (higher and lower parts of 16-bit ones):

		ah, bh, ch, dh, al, bl, cl, dl.

; pointer registers:

	; 32-bits:

	eip, esp, ebp.

	; 16-bits (lower parts of 32-bit ones):

		ip; instruction pointer, cs:ip addresses current instruction
		sp; stack pointer, ss:sp addresses current position of program
			stack
		bp; base pointer, addresses the parameters passed to a subroutine.

; index registers:

	; 32-bits:

		esi, edi.

	; 16-bits (lower parts of 32-bit ones):

		si; source index for string operations
		di; destination index for string operations

; control registers:

	flag	             O  D  I  T  S  Z     A     P     C
	bit		15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0

	of; overflow flag.
	df; direction flag. 0 = left to right, 1 = right to left
	if; interrupt flag. 0 = disable, 1 = enable
	tf; trap flag. execute instructions step by step
	sf; sign flag. 0 = positive, 1 = negative
	zf; zero flag. 0 = nonzero, 1 = zero
	af; auxiliary carry flag, AF is set when a 1-byte arithmetic operation
	  ; causes a carry from bit 3 into bit 4
	pf; parity flag. 0 = even count of 1-bits, 1 = odd count of 1-bits
	cf; carry flag. contains the carry bit from the highest

; segment registers:

	cs; code segment
	ds; data segment
	ss; stack segment
	es; extra segment
	fs;
	gs;

; system call---------------------------------------------------

; 1. put the system call number in eax: /usr/include/asm/unistd.h
; 2. store arguments in ebx, ecx, edx, esi, edi, ebp; if there are
;    more than 6 arguments then the memory location of the first
;    argument is stored in ebx.
; 3. call the interrupt 0x80
; 4. result usually returned in eax

; name		eax	ebx						ecx				edx
; sys_exit	1	int val
; sys_fork	2	struct pt_regs ???
; sys_read	3	unsigned int filep		char* str		size_t len
; sys_write	4	unsigned int filep		const char* str	size_t len
; sys_open	5	const char*	filename	int mode		int permissions
; sys_close	6	unsigned int filep
; sys_creat	8	const char* filename	int permissions
; sys_lseek	19	const char* filename	size_t offset	int reference_pos
; sys_brk	45	size_t address

	; open modes
	; 0 read-only
	; 1 write-only
	; 2 read-write

	; reference positions
	; 0 begin of file
	; 1 current position
	; 2 end of fil

; definition----------------------------------------------------

variable_name directive value[, ...]

	; directive := d size | res size
	;	d - define
	;	res - reserve

	; size := b | w | d | q | t
	;	b - byte
	;	w - word (2 bytes)
	;	d - double word
	;	q - quad word
	;	t - ten word

	byte_value db 150
	word_value dw 300
	byte_array db 14, 15, 22, 45
	word_array dw 134, 345, 564, 123
	zero_array times 10	dw 0
	str_hello db 'hello world', 0xa
	str_stars times 10 db '*'

constant_name equ expr

	sys_exit equ 1
	len equ $-msg

%assign constant_name expr

	; this directive allows re-define
	; this directive is case-sensitive
	%assign TOTAL 10
	%assign TOTAL 20

%define constant_name expr

	; similar to #define in C
	; this directive allows re-define
	; this directive is case-sensitive
	%define PTR [ebp+4]

; instructions--------------------------------------------------

mov dest, src

	; destination and source should be of same size
	; the value of source remains unchanged
	; destination cannot be immediate literals
	; cannot move memory to memory directly

inc dest
dec dest
add dest, src
sub dest, src
mul/imul multiplier

	; imul is for signed integer

	; 2 bytes: 	[AL] x [byte] = [AX] = [AH][AL]
	; 2 words:	[AX] x [word] = [DX][AX]
	; 2 dwords:	[EAX] x [dword] = [EDX][EAX]

div/idiv divisor

	; idiv is for signed integer

	; word / byte:		[ax] / [byte] = [al] ... [ah]
	; dword / word:		[dx][ax] / [word] = [ax] ... [dx]
	; qword / dword:	[edx][eax] / [dword] = [eax] ... [edx]

and dest, src
or dest, src
xor dest, src
test dest, src
not dest

cmp dest, src
jmp label
j<condition> label

	jz/je	; jump if lhs == rhs
	jnz/jne	; jump if lhs != rhs
	jl/jnge	; jump if lhs < rhs
	jle/jng	; jump if lhs <= rhs
	jg/jnle	; jump if lhs > rhs
	jge/jnl	; jump if lhs >= rhs

	; replace l for b (below), g for a (above) in signed case

shl dest, offset
shr dest, offset

loop label

	; assumes that the ecx register contains the loop count
	; the ecx decrements when executing loop
	; loop ends when ecx has value 0

aaa ; ascii adjust after addition
aas ; ascii adjust after subtraction
aam ; ascii adjust after multiplication
aad ; ascii adjust before division
daa ; decimal adjust after addition
das ; decimal adjust after subtraction

	; assume the operand be in al register

movsb/movsw/movsd; move data from memory to memory
lodsb/lodsw/lodsd; load data from memory to al/ax/eax
stosb/stosw/stosd; store data from al/ax/eax to memory
cmpsb/cmpsw/cmpsd; compare data in memory
scasb/scasw/scasd; compare data in al/ax/eax with data in memory

	; for 32-bit segments, assume the esi register is point to source
	; and the edi register is point to destination
	; esi = ds:si, edi = es:di
	; for 16-bit segments, use si and di respectively

rep ; set before a str instruction, repeat the instruction ecx times
repe/repz ; stop repeat when zero flag is unset or cx is zero
repne/repnz ; the opposite

	; df (direction flag) determines the direction of the operation
	; cld to clear df, std to set df

push operand
pop address/register

	; stack saves only words or d-words
	; stack grows toward lower memory address
	; top of stack points to the lower byte of the last inserted word

; procedures & macros-------------------------------------------

; procedure

	procedure_name:
		<body>
		ret

	...

	call procedure_name

; macro

	%macro macro_name number_of_params
		<body>
	%endmacro
