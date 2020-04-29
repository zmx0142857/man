#include <stdio.h>

int main()
{
	int a = 10, b;
	__asm__("movl %1, %%eax\n\t"
			"movl %%eax, %0\n\t"
			:"=r"(b) // output, 保存在 %0
			:"r"(a)  // input, 保存在 %1
			:"%eax"  // modified register
	);
	printf("a: %d, %d\n", a, b);
	return 0;
}
