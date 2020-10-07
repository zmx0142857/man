package com.demo;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@WebServlet(urlPatterns = "/signin")
public class Signin extends HttpServlet {
    // 模拟一个数据库, 实际需要处理多线程
    private Map<String, String> users = Map.of("bob", "bob123", "alice", "alice123", "tom", "tomcat");

    // GET 时显示登录页
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        out.write(
            "<h1>Signin</h1>\n" +
            "<form action=\"/signin\" method=\"post\">\n" +
            "<p>Username: <input name=\"username\"></p>\n" +
            "<p>Password: <input name=\"password\" type=\"password\"></p>\n" +
            "<p><button type=\"submit\">Signin</button> <a href=\"/\">Cancel</a></p>\n" +
            "</form>"
        );
        out.flush();
    }

    // POST 处理用户登录
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        if (password != null && password.equals(users.get(name))) {
            // 登录成功
            req.getSession().setAttribute("user", name);
            resp.sendRedirect("/");
        } else {
            resp.sendError(HttpServletResponse.SC_FORBIDDEN);
        }
    }
}
