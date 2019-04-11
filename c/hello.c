// ---- hello.c ------------------

#include <stdio.h>

int main()
{
	printf("hello, world!\n");
	return 0;
}

// ---- if-else.c ----------------

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

// ---- for.c --------------------

#include <stdio.h>

int main()
{
	int i, sum = 0;
	for (i = 1; i <= 100; i++)
		sum += i;
	printf("sum = %d\n", sum);
	return 0;
}

// ---- function.c ---------------

#include <stdio.h>

void yell();
double square_root(double);

int main()
{
	double x;
	printf("Enter a non-negative number: ");
	scanf("%lf", &x);
	if (x < 0)
	{
		printf("x must be non-negative!");
		return -1;
	}
	printf("sqrt(%lf) = %lf\n", x, square_root(x));

	return 0;
}

void yell()
{
	printf("WAAAAAAAAAAAAAAAAAAAAAAA!!!!!!!!!!!!!!!!\n");
}

double square_root(double x)
{
	double ret = 1;
	const double tolerance = 1e-6; // this variable is read-only

	while (ret * ret >= x + tolerance || ret * ret <= x - tolerance)
		ret = 0.5 * (ret + x / ret);

	return ret;
}

/* declare
 *		<type> <name>(<list of arguments>);
 * define
 *		<type> <name>(<list of arguments>)
 *		{
 *			// ...
 *		}
 * call
 *		var = <name>(<list of arguments>);	// if this function returns value
 *		<name>(<list of arguments>);		// if this function is void
 *
 * NOTE: Declare function before calling it.
 */

// ---- array.c --------------------------------

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

// ---- hi-dimension-array.c ------------------------

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

// ---- str.c ---------------------------------------

#include <stdio.h>
#include <ctype.h> // isalpha(), tolower()

// returns 1 if str is palindrome, 0 if not.
int is_palindrome(char str[]);

int main()
{
	char str[] = "A man, a plan, a canal, Panama.";
	printf("%d\n", is_palindrome(str));
	return 0;
}

int is_palindrome(char str[])
{
	int i;
	for (i = 0; str[i] != '\0'; i++)
		; // do nothing

	int left = 0, right = i-1;
	char c1, c2;
	while (left < right)
	{
		if (isalpha(str[left]))
			c1 = tolower(str[left]);
		else
		{
			left++;
			continue;
		}

		if (isalpha(str[right]))
			c2 = tolower(str[right]);
		else
		{
			right--;
			continue;
		}

		// now c1, c2 are letters
		if (c1 != c2)
			return 0; // not palindrome

		left++;
		right--;
	}
	return 1;
}

/*
	char s1[] = {'W', 'i', 'n', 't', 'e', 'r', '\0', 'i', 'm', 'e'};
	char s2[] = "Winter";
	printf("%s\n%s\n", s1, s2);
*/

// ---- root-equation.c ------------------------------

#include <stdio.h>
#include <math.h>

int rootEquation(double a, double b, double c, double *pr1, double *pr2);

int main()
{
	double a, b, c;
	double r1, r2;
	int status; // zhuang4 tai4

	// input
	printf("Enter a, b, c for equation ax^2 + bx + c = 0:\n"
			"\ta = ");
	scanf("%lf", &a);
	printf("\tb = ");
	scanf("%lf", &b);
	printf("\tc = ");
	scanf("%lf", &c);
	
	// compute
	status = rootEquation(a, b, c, &r1, &r2);

	// output
	if (status == 0)
		printf("No real solution!\n");
	else if (status == 1)
		printf("One solution: %lf\n", r1);
	else // status == 2
		printf("Two solutions: %lf, %lf\n", r1, r2);
	return 0;
}

int rootEquation(double a, double b, double c, double *pr1, double *pr2)
{
	double delta = b * b - 4.0 * a * c;
	const double epsilon = 1e-8;

	// delta < 0
	if (delta < -epsilon)
		return 0;

	// delta > 0
	else if (delta > epsilon)
	{
		double item1 = -0.5 * b / a;
		double item2 = 0.5 * sqrt(delta) / a;
		*pr1 = item1 + item2;
		*pr2 = item1 - item2;
		return 2;
	}

	// delta == 0
	*pr1 = -0.5 * b / a;
	return 1;

}
