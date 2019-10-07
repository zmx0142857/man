#include <stdio.h>

int main()
{
	int n;
	while (scanf("%d", &n) == 1) {
		n < 80 && (
			n < 70 && (
				n < 60 && putchar('E')
				|| putchar('D')
			) || putchar('C')
		) || n < 90 && putchar('B')
		|| putchar('A');
		putchar('\n');
	}
	return 0;
}
