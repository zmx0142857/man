public class MultiThread {
	public static void main(String[] args) {
		if (args.length != 1) {
			help();
		} else switch (args[0]) {
			case "1": useInheritance(); break;
			case "2": useInterface(); break;
			default: help(); break;
		}
	}

	static void help() {
		System.out.print("usage: java MultiThread [number]\n" +
				"1       use inheritance\n" +
				"2       use interface\n"
		);
	}

	static void useInheritance() {
		MyThread t1 = new MyThread("thread1");
		MyThread t2 = new MyThread("thread2");
		t1.start();
		t2.start();
		System.out.println("end main()");
	}

	static void useInterface() {
		Thread t1 = new Thread(new MyThreadImplementation("thread1"));
		Thread t2 = new Thread(new MyThreadImplementation("thread2"));
		t1.start();
		t2.start();
		System.out.println("end main()");
	}
}

class MyThread extends Thread {
	public MyThread(String str) {
		super(str);
	}

	public void run() {
		for (int i = 0; i < 3; ++i) {
			System.out.println("running " + getName());
			try {
				sleep(500);
			} catch (InterruptedException e) {}
		}
		System.out.println("end " + getName());
	}
}

class MyThreadImplementation implements Runnable {
	String name;

	public MyThreadImplementation(String n) {
		this.name = n;
	}

	public void run() {
		for (int i = 0; i < 3; ++i) {
			System.out.println("running " + name);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {}
		}
		System.out.println("end " + name);
	}
}
