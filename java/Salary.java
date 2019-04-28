import javax.swing.JOptionPane;
import java.text.*;

abstract class Employee {
	private String firstName, lastName;

	public Employee(String first, String last) {
		this.firstName = first;
		this.lastName = last;
	}

	public String toString() {
		return firstName + ' ' + lastName;
	}

	public abstract double earnings();
}

final class Boss extends Employee {
	private double weeklySalary;

	public Boss(String first, String last, double s) {
		super(first, last);
		setWeeklySalary(s);
	}

	public void setWeeklySalary(double s) {
		this.weeklySalary = (s > 0 ? s : 0);
	}

	public double earnings() {
		return weeklySalary;
	}

	public String toString() {
		return "[Boss] " + super.toString();
	}
}

final class PieceWorker extends Employee {
	private double wagePerPiece;
	private int quantity;

	public PieceWorker(String first, String last, double w, int q) {
		super(first, last);
		setWage(w);
		setQuantity(q);
	}

	public void setWage(double w) {
		this.wagePerPiece = (w > 0 ? w : 0);
	}

	public void setQuantity(int q) {
		this.quantity = (q > 0 ? q : 0);
	}

	public double earnings() {
		return quantity * wagePerPiece;
	}

	public String toString() {
		return "[Piece Worker] " + super.toString();
	}
}

public class Salary {
	public static void main (String[] args) {
		String firstName, lastName;
		int n;
		double d;

		JOptionPane.showMessageDialog(null, "Welcome to salary!",
				"Welcome!", JOptionPane.INFORMATION_MESSAGE);

		while (true) {
			n = Integer.parseInt(JOptionPane.showInputDialog(
					"Your position:\n" +
					"1. Boss\n" +
					"2. Piece Worker\n" +
					"3. Exit"));
			if (n != 1 && n != 2)
				break;
			firstName = JOptionPane.showInputDialog("Your first name:\n");
			lastName = JOptionPane.showInputDialog("Your last name:\n");
			if (n == 1) {
				d = Double.parseDouble(JOptionPane.showInputDialog(
					"Your weekly salary:\n"));
				output(new Boss(firstName, lastName, d));
			} else if (n == 2) {
				d = Double.parseDouble(JOptionPane.showInputDialog(
					"Your wage per peice:\n"));
				n = Integer.parseInt(JOptionPane.showInputDialog(
					"Quantity:\n"));
				output(new PieceWorker(firstName, lastName, d, n));
			}

		}
		System.exit(0);
	}

	static void output(Employee em) {
		DecimalFormat precision2 = new DecimalFormat("0.00");
		String res = em.toString() + " earned $"
			+ precision2.format(em.earnings()) + "\n";
		JOptionPane.showMessageDialog(null, res, "Result",
				JOptionPane.INFORMATION_MESSAGE);
	}
}
