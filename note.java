// Hello.java
//   - use 'javac Hello.java' to compile, 'java Hello' to run
public class Hello {
	public static void main(String[] args) {
		System.out.println("hello world");
	}
}

// FreshJuiceApp.java
//   - example on the use of enum
class FreshJuice {
	enum FreshJuiceSize {SMALL, MEDIUM, LARGE}
	FreshJuiceSize size;
}

public class FreshJuiceApp {
	public static void main (String[] args) {
		FreshJuice juice = new FreshJuice();
		juice.size = FreshJuice.FreshJuiceSize.MEDIUM;
		System.out.println("Size: " + juice.size);
	}
}

// Puppy.java
//   - create an object
public class Puppy {
	public Puppy(String name) {
		System.out.println("Passed Name is: " + name);
	}

	public static void main (String[] args) {
		Puppy myPuppy = new Puppy("tommy");
	}
} 
