public class work8 {
	public static void main (String[] args) {
		int[] array = {1, 2, 3, 4, 5, 6, 7, 8, 9};
		System.out.println(lookup(array, 4));
		System.out.println(lookup(array, 0));
	}

	public static int lookup(int[] array, int target) {
		int beg = 0;
		int end = array.length;
		while (beg < end) {
			int mid = (beg + end)/2;
			if (array[mid] == target) {
				return mid;
			} else if (array[mid] < target) {
				beg = mid + 1;
			} else { // array[mid] > text
				end = mid;
			}
		}
		return -1;
	}
}
