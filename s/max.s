.section .data
	# number 0 guards this array
	# .long: 4-byte integer
	nums: .long 3,67,34,222,45,75,54,34,44,33,22,11,66,0 

.section .text
	.globl _start

_start:
	movl $0, %edi				# %edi: index
	movl nums(,%edi,4), %eax	# %eax = nums[%edi]
	movl %eax, %ebx				# %ebx: current max value

loop:
	cmpl $0, %eax				# if %eax == 0
	je end						# goto end
	incl %edi					# ++%edi
	movl nums(,%edi,4), %eax	# %eax = nums[%edi]
	cmpl %ebx, %eax				# if %eax <= %ebx
	jle loop					# goto loop
	movl %eax, %ebx				# %ebx = %eax
	jmp loop

end:
	# now %ebx holds the max value
	movl $1, %eax
	int $0x80					# return %ebx
