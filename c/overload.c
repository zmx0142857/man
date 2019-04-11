#include <stdio.h>
#include <stdlib.h>

/* 1. simulate function overloading by vargs.
 * can have any type, any number of parameters
 * by need to know the types before hand.
 */

#include <stdarg.h> // ellipsis (aka ...)

// The ellipsis must be the last parameter
// count is how many additional arguments we're passing
double average(int count, ...)
{
	double sum = 0;
	va_list list;

	// va_start(list, last_non_ellipsis_param)
	va_start(list, count);
 
	for (int arg = 0; arg < count; ++arg)
		// va_arg(list, type)
		sum += va_arg(list, int);
 
	// cleanup
	va_end(list);
	return sum / count;
}
 
void overload_by_vargs()
{
	printf("%f\n", average(5, 1, 2, 3, 4, 5));
	printf("%f\n", average(6, 1, 2, 3, 4, 5, 6));
}

/* 2. simulate function overloading by pointer to function.
 * it's hard to use, we would rather use distinct name for the functions,
 * like add_int(), add_double().
 */

typedef struct {
	int first, second;
} INTS;

INTS ints = {10, 20};

typedef struct {
	double first, second;
} DOUBLES;

DOUBLES doubles = {3.33, 6.66};

void int_add_func(void *wParam)
{
	INTS *lParam = wParam;
	int res = lParam->first + lParam->second;
	printf("%d\n", res);
}

void double_add_func(void *wParam)
{
	DOUBLES *lParam = wParam;
	double res = lParam->first + lParam->second;
	printf("%f\n", res);
}

void add(void f(void*), void *wParam)
{
	f(wParam);
}

void overload_by_function_pointer()
{
	add(int_add_func, &ints);
	add(double_add_func, &doubles);
}

/* 3. simulate function overloading by gcc __builtin_choose_expr() */

void display_ints(INTS *p)
{
	printf("%d %d\n", p->first, p->second);
}

void display_doubles(DOUBLES *p)
{
	printf("%f %f\n", p->first, p->second);
}

// warning: dereferencing type-punned pointer will break
// strict-aliasing rules
#define display(x)\
	__builtin_choose_expr(\
		__builtin_types_compatible_p(typeof(x), INTS*),\
		display_ints((INTS*)x),\
	__builtin_choose_expr(\
		__builtin_types_compatible_p(typeof(x), DOUBLES*),\
		display_doubles((DOUBLES*)x), (void) 0))\

void overload_by_gcc_builtin()
{
	display(&ints);
	display(&doubles);
}

#undef display

/* 4. use method 1 with 3, vargs with gcc builtin. */

void display_aux(int typeval, ...)
{
	switch (typeval) 
	{
		case 1: {
			va_list v;
			va_start(v, typeval);
			INTS* p = va_arg(v, INTS*);
			va_end(v);
			display_ints(p);
			break;
		} case 2: {
			va_list v;
			va_start(v, typeval);
			DOUBLES *p = va_arg(v, DOUBLES*);
			va_end(v);
			display_doubles(p);
			break;
		} default: {
			puts("Invalid type to 'display()'");
			exit(1);
		}
	}
}

#define display(x)\
	display_aux(\
		__builtin_types_compatible_p(typeof(x), INTS*) * 1 +\
		__builtin_types_compatible_p(typeof(x), DOUBLES*) * 2, x)

void overload_by_vargs_and_gcc_builtin()
{
	display(&ints);
	display(&doubles);
}
#undef display

void help()
{
	printf(	"usage: overload [option]\n"
			"-v   by vargs\n"
			"-p   by function pointer\n"
			"-g   by gcc builtin\n"
			"-G   by vargs and gcc builtin\n"
	);
	exit(0);
}

int main(int argc, char **argv)
{
	if (argc < 2)
		help();

	switch (argv[1][1]) {
		case 'v':	overload_by_vargs();			break;
		case 'p':	overload_by_function_pointer();	break;
		case 'g':	overload_by_gcc_builtin();		break;
		case 'G':	overload_by_vargs_and_gcc_builtin();break;
		default:	help();
	}
	return 0;
}
