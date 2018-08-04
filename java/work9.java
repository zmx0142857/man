public class work9 {
	public static void main (String[] args) {
		print_yanghui(10);
	}

	public static void print_yanghui(int n) {
		int c[] = new int[n];
		c[0] = 1;
		for (int i = 0; i < n; i++)
		{
			int j = 0;
			for (; j <= i; j++)
				System.out.printf("%d\t", c[j]);
			System.out.printf("\n");
			if (j == n)
				break;
			for (; j > 0; j--)
				c[j] += c[j-1];
		}
	}
}

