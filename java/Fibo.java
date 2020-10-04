import java.util.function.LongSupplier;
import java.util.stream.LongStream;

public class Fibo {
	public static void main(String[] args) {
		LongStream fibo = LongStream.generate(new FiboSupplier());
		fibo.limit(20).forEach(System.out::println);
	}
}

class FiboSupplier implements LongSupplier {
	long a = 1;
	long b = 1;
	boolean toggle = true;
	public long getAsLong() {
		long ret;
		if (toggle) {
			ret = a;
			a += b;
		} else {
			ret = b;
			b += a;
		}
		toggle = !toggle;
		return ret;
	}
}
