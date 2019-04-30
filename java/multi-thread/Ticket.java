class TicketThread implements Runnable {
	private int tickets = 10;
	public void run() {
		while (true) {
			try {
				Thread.sleep(10);
			} catch (InterruptedException e) {}
			synchronized (this) {
				if (tickets > 0) {
					System.out.println(Thread.currentThread().getName() +
						" sold out ticket #" + tickets--);
				} else {
					break;
				}
			}
		}
		System.exit(0);
	}
}

public class Ticket {
	public static void main (String[] args) {
		TicketThread t = new TicketThread();
		Thread t1 = new Thread(t, "Booth #1");
		Thread t2 = new Thread(t, "Booth #2");
		Thread t3 = new Thread(t, "Booth #3");
		t1.start();
		t2.start();
		t3.start();
	}
}
