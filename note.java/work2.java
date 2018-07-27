import java.util.Scanner;
import java.util.Random;

public class work2 {
	public static void main (String[] args) {
		Scanner input = new Scanner(System.in);
		System.out.print("input a lower bound number: ");
		long lower = input.nextLong();
		long p1 = prime(lower);
		long p2 = prime(lower);
		while (p1 == p2)
			p2 = prime(lower);
		System.out.printf("%d, %d\n", p1, p2);
	}

	// compute (a^b) % n
	public static long modular_exponentation(long a, long b, long n) {
		long c = 0, d = 1, k = 63;
		for (long i = k; i > -1; i--) {
			c *= 2;
			d = (d * d) % n;
			long bi = b & (1L << i);
			if (bi != 0) {
				c += 1;
				d = (d * a) % n;
			}
			// System.out.printf("i = %d bi = %d c = %d d = %d\n", i, bi, c, d);
		}
		return d;
	}

	public static boolean witness(long a, long n) {
		// suppose n is odd
		// find t >= 1 and u is odd such that n-1 == 2^t * u
		long u = n-1, t;
		for (t = 0; u != 0 && u % 2 == 0; t++) {
			u = u >> 1;
		}

		long x = modular_exponentation(a, u, n);
		for (long i = 1; i <= t; i++) {
			long lastx = x;
			x = (x * x) % n;
			if (x == 1 && lastx != 1 && lastx != n-1)
				return true;
		}
		if (x != 1)
			return true;
		return false;
	}

	public static boolean miller_rabin(long n, long count) {
		Random random = new Random();
		for (long i = 0; i < count; i++) {
			// random number in [1, n-1]
			long a = random.nextLong() % (n-1);
			if (a < 0)
				a = -a + 1;
			else
				a = a + 1;
			if (witness(a, n))
				return false;	// definitely
		}
		return true;			// almost surely
	}

	public static boolean is_prime(long n) {
		return miller_rabin(n, 10);
	}

	// bug: for bigger input value, like 11 digits, this is too slow
	public static long prime(long lower) {
		Random random = new Random();
		// make lower even
		if (lower % 2 == 1)
			lower += 1;
		long p = 2 * random.nextInt(10000) + lower + 1;
		while (true) {
			if (is_prime(p))
				return p;
			p += 2;
		}
	}
}
