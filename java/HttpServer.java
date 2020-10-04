import java.io.OutputStreamWriter;
import java.io.BufferedWriter;
import java.nio.charset.StandardCharsets;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.OutputStream;
import java.io.InputStream;
import java.net.Socket;
import java.net.ServerSocket;
import java.io.IOException;

public class HttpServer {
	public static void main(String[] args) throws IOException {
		ServerSocket ss = new ServerSocket(8080);
		System.out.println("server is listening to port 8080...");
		while (true) {
			Socket sock = ss.accept();
			System.out.println("connected from " + sock.getRemoteSocketAddress());
			Thread t = new Handler(sock);
			t.start();
		}
	}
}

class Handler extends Thread {
	Socket sock;

	public Handler(Socket sock) {
		this.sock = sock;
	}

	public void run() {
		try (InputStream input = this.sock.getInputStream()) {
			try (OutputStream output = this.sock.getOutputStream()) {
				handle(input, output);
			}
		} catch (Exception e1) {
			try {
				this.sock.close();
			} catch (IOException e2) {
			}
			System.out.println("client disconnected.");
		}
	}

	private void handle(InputStream input, OutputStream output) throws IOException {
		System.out.println("\nProcess new http request...");
		BufferedReader reader = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8));
		BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(output, StandardCharsets.UTF_8));

		// 打印 http header
		boolean requestOk = false;
		String first = reader.readLine();
		System.out.println(first);
		if (first.startsWith("GET / HTTP/1.")) {
			requestOk = true;
		}
		while (true) {
			String header = reader.readLine();
			if (header.isEmpty()) {
				break; // 读到空行则结束
			}
			System.out.println(header);
		}

		// 返回响应
		if (requestOk) {
			System.out.println("Response OK");
			String data = "<html><body><h1>Don't panic!</h1></body></html>";
			int length = data.getBytes(StandardCharsets.UTF_8).length;
			writer.write("HTTP/1.0 200 OK\r\n");
			writer.write("Connection: close\r\n");
			writer.write("Content-Type: text/html\r\n");
			writer.write("Content-Length: " + length + "\r\n");
			writer.write("\r\n"); // 用空行分隔 http header 与 body
			writer.write(data);
		} else {
			System.out.println("Response Error");
			writer.write("HTTP/1.0 404 Not Found\r\n");
			writer.write("Content-Length: 0\r\n");
			writer.write("\r\n");
		}
		writer.flush();
	}
}
