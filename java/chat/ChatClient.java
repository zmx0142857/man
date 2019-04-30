import java.net.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ChatClient extends JFrame implements ActionListener {
	Socket socket;
	JTextArea textArea = new JTextArea();
	JTextField textField = new JTextField(20);
	JButton sendButton = new JButton("Send");
	JButton connectButton = new JButton("Connect");
	DataOutputStream output;
	DataInputStream input;

	public ChatClient() {
		JScrollPane jsp = new JScrollPane(textArea);
		getContentPane().add(jsp, "Center");
		JPanel panel = new JPanel();
		panel.add(textField);
		panel.add(sendButton);
		JPanel panel2 = new JPanel();
		panel2.add(connectButton);
		getContentPane().add(panel2, "North");
		getContentPane().add(panel, "South");
		sendButton.addActionListener(this);
		connectButton.addActionListener(this);
		setTitle("Chat Client");
		setSize(340, 200);
		setVisible(true);
		addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				try {
					output.writeUTF("bye");
				} catch (Exception ex) {}
				dispose();
				System.exit(0);
			}
		});
	}

	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == sendButton) {
			String text = textField.getText();
			if (!text.equals("")) {
				try {
					output.writeUTF(text);
					textArea.append("Client: " + text + "\n");
				} catch (Exception ex) {}
			}
		} else {
			try {
				socket = new Socket("127.0.0.1", 9999);
				output = new DataOutputStream(socket.getOutputStream());
				input = new DataInputStream(socket.getInputStream());
				new ClientCommunion(this).start();
			} catch (IOException ex) {
				JOptionPane.showMessageDialog(null, "Failed to connect to server!");
				return;
			}
		}
	}

	public static void main (String[] args) {
		new ChatClient();
	}
}

class ClientCommunion extends Thread {
	ChatClient client;
	ClientCommunion(ChatClient client) {
		this.client = client;
	}

	public void run() {
		String msg = null;
		while (true) {
			try {
				msg = client.input.readUTF();
				if (msg.equals("bye")) {
					client.textArea.append("[Server has stopped]\n");
					break;
				}
				client.textArea.append("Server: " + msg + "\n");
			} catch (Exception ex) {
				break;
			}
		}
		try {
			client.output.close();
			client.input.close();
			client.socket.close();
		} catch (Exception ex) {}
	}
}
