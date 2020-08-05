public class Q2 {
	public static void main(String[] args) {
		System.out.println("new Room");
		Room r = new Room(80, 50, 20);
		r.info();

		System.out.println("resize");
		r.setLength(30);
		r.setWidth(20);
		r.setHeight(10);
		r.info();

		System.out.println("new ClassRoom");
		ClassRoom c = new ClassRoom(3, 4, 5, 3, 2);
		c.info();

		System.out.println("new Office");
		new Office(1, 2, 3, "110").info();
	}
}

class Room {

	private int length;
	private int width;
	private int height;

	Room(int l, int w, int h) {
		this.length = l;
		this.width = w;
		this.height = h;
	}

	int getLength() {
		return length;
	}

	int getWidth() {
		return width;
	}

	int getHeight() {
		return height;
	}

	void setLength(int l) {
		this.length = l;
	}

	void setWidth(int w) {
		this.width = w;
	}

	void setHeight(int h) {
		this.height = h;
	}

	void info() {
		System.out.println("size: " + this.length + " " + this.width + " " + this.height);
	}
}

class Office extends Room {

	String phoneNo;

	Office(int l, int w, int h, String p) {
		super(l, w, h);
		this.phoneNo = p;
	}

	void info() {
		super.info();
		System.out.println("phone: " + this.phoneNo);
	}
}

class ClassRoom extends Room {

	int grade;
	int classNo;

	ClassRoom(int l, int w, int h, int g, int c) {
		super(l, w, h);
		this.grade = g;
		this.classNo = c;
	}

	void info() {
		super.info();
		System.out.println("grade: " + this.grade + " class: " + this.classNo);
	}
}
