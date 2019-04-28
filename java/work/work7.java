public class work7 {
	public static void main (String[] args) {
		int[] array = {9, 8, 7, 6, 5, 4, 3, 2, 1};
		quick_sort(array);
		for (int i = 0; i < array.length; i++) {
			System.out.printf("%d ", array[i]);
		}
		System.out.printf("\n");
	}

	public static void quick_sort(int[] a) {
		do_quick_sort(a, 0, a.length);
	}

	public static void do_quick_sort(int[] a, int beg, int end) {
		if (beg + 1 >= end) return;
		int pivot = a[beg]; 
		int i = beg, j = end;
		while (true)
		{
			// in each iteration,
			// elements in range[beg+1,i) <= pivot
			// elements in range (j, end) >= pivot
			while (i+1 < end && a[++i] < pivot) {}
			while (j > beg && a[--j] > pivot) {}
			if (i < j) {
				int tmp = a[i];
				a[i] = a[j];
				a[j] = tmp;
			} else {
				break;
			}
		}
		int tmp = a[j];
		a[j] = a[beg];
		a[beg] = tmp;
		// invariant: a[j] <= a[i] <= a[k] for beg <= j < i < k < end
		do_quick_sort(a, beg, j);
		do_quick_sort(a, j+1, end);
	}
}
