public class work6 {
	public static void main (String[] args) {
		for (int i = 0; i < 20; i++) {
			System.out.printf("%d ", fibonacci(i));
		}
		System.out.printf("\n");
	}

	public static long fibonacci (long n) {
		if (n == 0 || n == 1) {
			return 1;
		}
		return fibonacci(n-2) + fibonacci(n-1);
	}
}
