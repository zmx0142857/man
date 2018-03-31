#include <stdio.h>

int main()
{
	int map[3][2] = {{123, 34}, {2, 96}, {12, 14}};
	int i, j;
	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 2; j++)
			printf("%d ", map[i][j]);
		printf("\n");
	}
	
	/*
	for (i = 0; i < 2; i++)
	{
		for (j = 0; j < 3; j++)
			printf("%d ", map[j][i]);
		printf("\n");
	}
	*/
	return 0;
}
