class Chopstick {
	boolean available;
	int n;

	Chopstick(int n) {
		this.available = true;
		this.n = n;
	}

	public synchronized void takeup(String name) {
		while (!available) {
			System.out.println(name + " is waiting for chopstick #" + n);
			try {
				wait();
			} catch (InterruptedException e) {}
		}
		available = false;
	}

	public synchronized void putdown() {
		available = true;
		notify();
	}
}

class Philosopher extends Thread {
	Chopstick left, right;
	String name;

	Philosopher(String name, Chopstick left, Chopstick right) {
		this.name = name;
		this.left = left;
		this.right = right;
	}

	public void think() {
		left.putdown();
		right.putdown();
		System.out.println(name + " is thinking...");
	}

	public void eat() {
		left.takeup(name);
		right.takeup(name);
		System.out.println(name + " is eating...");
	}

	public void run() {
		while (true) {
			eat();
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {}
			think();
		}
	}
}

public class PhilosopherDining {
	static Chopstick chopsticks[] = new Chopstick[5];
	static Philosopher philosophers[] = new Philosopher[5];

	public static void main (String[] args) {
		for (int n = 0; n < 5; ++n)
			chopsticks[n] = new Chopstick(n+1);
		for (int n = 0; n < 5; ++n)
			philosophers[n] = new Philosopher("Philosopher #" + (n+1),
					chopsticks[n], chopsticks[(n+1)%5]);
		for (int n = 0; n < 5; ++n)
			philosophers[n].start();
	}
}
