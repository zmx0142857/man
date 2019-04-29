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

/* String s = "hello" 是 String s = new String("hello") 的简写
 *
 * 构造函数一般无法继承, 但不论是自己定义的,
 * 还是编译器生成的默认构造函数, 都会被子类继承
 *
 * java 的 protected 成员可以由同一包中的所有成员访问,
 * 而 public 成员可以在不同包之间被访问. 默认情况下是 public.
 */
