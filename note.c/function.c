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
