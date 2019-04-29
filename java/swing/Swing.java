import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

/* import java.awt;
 * class Frame {
 *   Frame();
 *   Frame(String title);
 *   void setTitle(String);
 *   String getTitle();
 *   void setBackground(Color);
 * }
 *
 * import javax.swing;
 * class JFrame {
 *   JFrame();
 *   JFrame(String title);
 *   void pack(); // resize window to make all components visible
 *   void setBounds(int x, int y, int width, int height);
 *   void setLayout(LayoutManager);
 *   int getDefaultCloseOperation();
 *   void setDefaultCloseOperation(int operation);
 *   void setResizable(Boolean);
 *   void setSize(int width, int height);
 *   void setVisible(Boolean);
 *   void show();
 *   Container getContentPane();
 *   JMenubar getJMenuBar();
 *   void setJMenuBar(JMenuBar);
 * }
 *
 * import java.awt;
 * class Container {
 *   void setLayout();
 *   Component add(Component);
 *   void remove(Component);
 * }
 *
 * import java.awt;
 * class Component {
 *   void setBounds(int x, int y, int width, int height);
 *   void setSize(int width, int height);
 *   void setBackground(Color);
 *   Color setForeground(Color);
 *   void setVisible(Boolean);
 *   void setLocation(int x, int y);
 *   String getName();
 * }
 */

public class Swing {
	public static void main(String[] args) {
		if (args.length != 1) {
			help();
		} else switch (args[0]) {
			case "1": JOptionPaneDemo(); break;
			case "2": JFrameDemo(); break;
			case "3": EventDemo(); break;
			default: help(); break;
		}
	}

	static void help() {
		System.out.print("usage: java Swing [number]\n" +
				"1       JoptionPaneDemo\n" +
				"2       JFrameDemo\n" +
				"3       EventDemo\n"
		);
	}

	static void JOptionPaneDemo() {
		JOptionPane.showMessageDialog(null, "Welcome to Java Programming!");
		System.exit(0);
	}

	static void JFrameDemo() {
		JFrame frame = new JFrame("JFrameDemo");
		frame.setLocation(500, 400);
		frame.setSize(300, 200);
		frame.setBackground(Color.black);
		
		Panel panel = new Panel();
		panel.setLocation(50, 50);
		panel.setSize(150, 100);
		panel.setBackground(Color.lightGray);

		JButton button = new JButton("Click me");
		button.setLocation(50, 50);
		button.setSize(80, 20);
		button.setBackground(Color.pink);

		panel.add(button);
		frame.add(panel);
		frame.setVisible(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	static void EventDemo() {
		TextArea text = new TextArea("some text", 5, 20);
		JButton button = new JButton("Change Color!");
		button.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent event) {
				text.setForeground(Color.red);
			}
		});

		JFrame frame = new JFrame();
		frame.setTitle("EventDemo");
		frame.setLayout(new FlowLayout());
		frame.setSize(260, 170);

		frame.add(text);
		frame.add(button);

		frame.setVisible(true);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
}
