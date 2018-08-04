#include <stdio.h>

int main()
{
	int y;
	scanf("%d", &y);

	if (y % 400 == 0)
		printf("leap year\n");
	else if (y % 100 == 0)
		printf("not leap year\n");
	else if (y % 4 == 0)
		printf("leap year\n");
	else
		printf("not leap year\n");
		
	return 0;
}
