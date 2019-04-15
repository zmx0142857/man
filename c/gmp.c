// gcc gmp.c -o gmp -lgmp
#include <stdio.h>
#include <gmp.h>

int main()
{
	mpz_t ret;						// big int ret
	mpz_init(ret);
	mpz_add_ui(ret, ret, 1);		// ret += 1
	unsigned long n = 100;
	while (--n)
		mpz_mul_ui(ret, ret, n);	// ret *= 99 * 98 * ... * 1
	gmp_printf("%Zd\n", ret);		// 99!
	mpz_clear(ret);
	return 0;
}

