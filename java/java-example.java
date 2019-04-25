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

// Tmp.java
// methods override, attributes don't
public class Tmp {
	public static void main(String[] args) {
		Person p = new Student();
		System.out.println(p.name);			// Bob
		System.out.println(p.getName());	// Alice
	}
}

class Person {
	String name = "Bob";
	String getName() {
		return name;
	}
}

class Student extends Person {
	String name = "Alice";
	String getName() {
		return name;
	}
}
