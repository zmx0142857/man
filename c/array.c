#include <stdio.h>

int arr[1000];

int main()
{
	int n;
	printf("Enter n: ");
	scanf("%d", &n);

	int i, j;
	for (i = 0; i < n; i++)
	{
		// change something
		for (j = 0; j < i-1; j++)
			arr[i-j-1] = arr[i-j-2] + arr[i-j-1];

		// new element
		arr[i] = 1;

		// just print
		for (j = 0; j < i + 1; j++)
			printf("%d ", arr[j]);
		printf("\n");
	}
	return 0;
}

/*
int main()
{
	int alphabet[4] = {51, 52, 53};

	int i;
	for (i = 0; i < 4; i++)
		printf("%d ", alphabet[i]);
	printf("\n");
	return 0;
}
*/

/* definition
 *		<type> <name>[<size>] = {<list of items>};
 */
