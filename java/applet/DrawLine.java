import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class DrawLine extends JApplet {
	int x1 = 0, y1 = 0, x2 = 0, y2 = 0;

	public void init() {
		addMouseListener(new MouseListener() {
			public void mousePressed(MouseEvent e) {
				x1 = e.getX();
				y1 = e.getY();
			}

			public void mouseClicked(MouseEvent e) {}
			public void mouseEntered(MouseEvent e) {}
			public void mouseExited(MouseEvent e) {}
			public void mouseReleased(MouseEvent e) {}

		});
		addMouseMotionListener(new MouseMotionListener() {
			public void mouseDragged(MouseEvent e) {
				x2 = e.getX();
				y2 = e.getY();
				repaint();
			}

			public void mouseMoved(MouseEvent e) {}
		});
	}

	public void paint(Graphics g) {
		Dimension d = getSize();
		g.clearRect(0, 0, d.width, d.height);
		g.drawLine(x1, y1, x2, y2);
	}
}
