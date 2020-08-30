import java.util.Scanner;
import java.util.Arrays;

public class Q1 {
	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		int array[] = new int[9];

		array[0] = input.nextInt();
		for (int i = 1; i < 9; ++i) {
			array[i] = input.nextInt();
			array[i-1] *= array[i];
		}
		array[8] *= input.nextInt();

		Arrays.sort(array);
		for (int i = 6; i < 9; ++i) {
			System.out.println(array[i]);
		}
	}
}
