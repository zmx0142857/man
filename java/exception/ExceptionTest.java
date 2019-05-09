public class ExceptionTest {
	public static void main(String[] args) {
		try {
			throwException();
			System.out.println("You will not see me!");
		} catch (MyException me) {
			System.out.println(me.getMessage());
		}
	}

	public static void throwException() throws MyException {
		throw new MyException("This is an excpetion from zmx.");
	}
}

class MyException extends Exception {
	public MyException() {}

	public MyException(String message) {
		super(message);
	}

	public MyException(Throwable cause) {
		super(cause);
	}

	public MyException(String message, Throwable cause) {
		super(message, cause);
	}
}
