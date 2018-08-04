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
