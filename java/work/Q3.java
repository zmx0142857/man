import java.lang.Math;

public class Q3 {
	public static void main(String[] args) {
		Triangular t = new Triangular(3, 4, 5, 6);
		t.info();
	}
}

interface Cylinder {
	double calcArea();
	double calcVolume();
}

class Triangular implements Cylinder {

	double a, b, c, h;

	Triangular(double a, double b, double c, double h) {
		this.a = a;
		this.b = b;
		this.c = c;
		this.h = h;
	}

	void info() {
		System.out.println(this.a + " " + this.b + " " + this.c + " " + this.h);
		System.out.println("area: " + this.calcArea() + " volume: " + this.calcVolume());
	}

	double baseArea() {
		double s = (a + b + c) / 2;
		return Math.sqrt(s * (s-a) * (s-b) * (s-c));
	}
	
	public double calcArea() {
		return 2 * baseArea() + (a+b+c) * h;
	}

	public double calcVolume() {
		return baseArea() * h;
	}
}
