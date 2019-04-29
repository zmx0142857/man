// compile: javac MyApplet.java
// run: appletviewer MyApplet.html
import java.applet.Applet;
import java.awt.Graphics;
import java.awt.Color;

public class MyApplet extends Applet {
	int squareSize = 50;

	public void init() {
		String squareSizeParam = getParameter("squareSize");
		parseSquareSize(squareSizeParam);
		String colorParam = getParameter("color");
		Color fg = parseColor(colorParam);
		setBackground(Color.black);
		setForeground(fg);
	}

	private void parseSquareSize(String param) {
		if (param == null)
			return;
		try {
			squareSize = Integer.parseInt(param);
		} catch (Exception e) {
			// ...
		}
	}

	private Color parseColor(String param) {
		if (param == "blue")
			return Color.blue;
		return Color.white;
	}

	public void paint(Graphics g) {
		//g.drawString("hello world", 25, 25); // str, to_left, to_top
	}
}
