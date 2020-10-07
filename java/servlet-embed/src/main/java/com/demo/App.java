package com.demo;

import java.io.PrintWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/")
public class App extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		String name = req.getParameter("name");
		if (name == null) {
			name = "world";
		}
		PrintWriter out = resp.getWriter();
		out.write("<h1>Hello, " + name + "!</h1>");
		out.flush();
	}
}
