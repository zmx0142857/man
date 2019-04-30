import java.net.*;
import java.io.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class ChatServer extends JFrame implements ActionListener {
	ServerSocket serverSocket;
	Socket socket;
	JTextArea textArea = new JTextArea();
	JTextField textField = new JTextField(20);
	JButton sendButton = new JButton("send");
	DataOutputStream output;
	DataInputStream input;
	String cname = null;

	public ChatServer() {
		try {
			serverSocket = new ServerSocket(9999); // port 9999 > 1024
		} catch (IOException e) {
			JOptionPane.showMessageDialog(null, "server failed to start! Is another program using port 9999?");
			return;
		}

		JScrollPane jsp = new JScrollPane(textArea);
		getContentPane().add(jsp, "Center");

		JPanel panel = new JPanel();
		panel.add(textField);
		panel.add(sendButton);
		getContentPane().add(panel, "South");
		sendButton.addActionListener(this);

		setTitle("Chat Server");
		setSize(340, 200);
		setVisible(true);
		try {
			socket = serverSocket.accept(); // accept returns Socket type
			// DataOutputStream converts data to bytes
			output = new DataOutputStream(socket.getOutputStream());
			input = new DataInputStream(socket.getInputStream());
			output.writeUTF("Welcome to chatroom!");
			new Communion(this).start();
		} catch (Exception e) {}
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
		String text = textField.getText();
		if (!text.equals("")) {
			try {
				output.writeUTF(text);
				textArea.append("Server: " + text + "\n");
			} catch (Exception ex) {}
		}
	}

	public static void main(String args[]) {
		new ChatServer();
	}
}

class Communion extends Thread {
	ChatServer server;

	Communion (ChatServer server) {
		this.server = server;
	}

	public void run() {
		String msg = null;
		while (true) {
			try {
				msg = server.input.readUTF();
				if (msg.equals("bye")) {
					server.textArea.append("[Client exited the chatroom]");
					break;
				}
				server.textArea.append("Client: " + msg + "\n");
			} catch (Exception ex) {
				break;
			}
		}
		try {
			server.output.close();
			server.input.close();
			server.socket.close();
			server.serverSocket.close();
		} catch (Exception ex) {}
	}
}
