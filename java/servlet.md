# Servlet

## getting started

<pre>
.
|-- tomcat.8080 # 使用内嵌 tomcat 产生的编译结果, 无视它即可
|-- <a href="#pom.xml">pom.xml</a>
`-- src
    |-- main
    |   |-- java
    |   |   `-- com.zmx
    |   |       |-- servlet
    |   |       |   `-- <a href="#HelloServlet.java">HelloServlet.java</a>
    |   |       `-- <a href="#Main.java">Main.java</a>
    |   |-- resources # 静态资源
    |   `-- webapp # 默认位置和名称
    |       |-- WEB-INF # 私有目录, 不能直接访问
    |       |   |-- jsp
    |       |   |   `-- <a href="#test.jsp">test.jsp</a>
    |       |   `-- <a href="#web.xml">web.xml</a> # servlet 配置文件
    |       `-- index.jsp # 默认欢迎页
    `-- test
</pre>

### maven 依赖

如果你使用 idea 开发, 并且自带 tomcat 容器, 可以使用如下的 `pom.xml`:

```xml
<packaging>war</packaging>

<dependencies>
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
    <dependency>
        <groupId>javax.servlet.jsp</groupId>
        <artifactId>javax.servlet.jsp-api</artifactId>
        <version>2.3.3</version>
        <scope>provided</scope>
    </dependency>
    <!-- jsp 中的特殊标签 -->
    <dependency>
        <groupId>javax.servlet.jsp.jstl</groupId>
        <artifactId>jstl</artifactId>
        <version>1.2</version>
    </dependency>
</dependencies>
```

### 内嵌 tomcat

虽然可以将项目打包成 war 包后放在下载好的 tomcat 中运行, 但开发效率低.
为此我们使用内嵌 tomcat 容器.

<code id="pom.xml">pom.xml</code>

```xml
<packaging>war</packaging>

<properties>
    <tomcat.version>9.0.43</tomcat.version>
</properties>

<dependencies>
    <!-- 内嵌 tomcat -->
    <dependency>
        <groupId>org.apache.tomcat.embed</groupId>
        <artifactId>tomcat-embed-core</artifactId>
        <version>${tomcat.version}</version>
    </dependency>
    <!-- 内嵌 tomcat jsp 支持 -->
    <dependency>
        <groupId>org.apache.tomcat.embed</groupId>
        <artifactId>tomcat-embed-jasper</artifactId>
        <version>${tomcat.version}</version>
    </dependency>
</dependencies>
```

在 ide 中运行 <code id="Main.java">Main.java</code> 即可启动 tomcat:

```java
package com.zmx;

import java.io.File;
import org.apache.catalina.Context;
import org.apache.catalina.WebResourceRoot;
import org.apache.catalina.startup.Tomcat;
import org.apache.catalina.webresources.DirResourceSet;
import org.apache.catalina.webresources.StandardRoot;

public class Main {
    private static final String submodule = ""; // 如果在子项目中使用, 这里换成子目录的名称, 如 "01-servlet/"
    private static final String webapp = submodule + "src/main/webapp";
    private static final String classes = submodule + "target/classes";
    public static void main(String[] args) throws Exception {
        // 新建 tomcat
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(Integer.getInteger("port", 8080));
        tomcat.getConnector();
        // 创建 webapp
        Context ctx = tomcat.addWebapp("", new File(webapp).getAbsolutePath());
        WebResourceRoot resources = new StandardRoot(ctx);
        resources.addPreResources(new DirResourceSet(resources, "/WEB-INF/classes", new File(classes).getAbsolutePath(), "/"));
        ctx.setResources(resources);
        // 启动 tomcat
        tomcat.start();
        tomcat.getServer().await();
    }
}
```

### 其它配置

<code id="web.xml">web.xml</code>

```xml
<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd">
<web-app>
    <display-name>hello web</display-name>

    <servlet>
        <servlet-name>helloServlet</servlet-name>
        <servlet-class>com.zmx.Hello.HelloServlet</servlet-class>
    </servlet>

    <servlet-mapping>
        <servlet-name>helloServlet</servlet-name>
        <url-pattern>/hello</url-pattern>
    </servlet-mapping>

    <session-config>
        <session-timeout>30</session-timeout> <!-- session 维持 30 分钟 -->
    </session-config>

    <welcome-file-list>
        <welcome-file>index.jsp</welcome-file>
    </welcome-file-list>
</web-app>
```

<code id="HelloServlet.java">HelloServlet.java</code>

```java
package com.zmx.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class HelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 1. 获取前端传参
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            req.setAttribute("msg", "调用 add 方法");
        } else if ("delete".equals(action)) {
            req.setAttribute("msg", "调用 delete 方法");
        }
        // 2. 调用业务层 (service)
        // 3. 转发或重定向到视图
        req.getRequestDispatcher("/WEB-INF/jsp/test.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }
}
```

<code id="test.jsp">test.jsp</code>

```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %> <!-- 如果 ${} 表达式不能使用, 就加上这行 -->
<html>
<head>
    <title>Test</title>
</head>
<body>
消息: ${msg}
</body>
</html>
```

## doGet 方法示例

直接输出 (write)
```java
req.setCharacterEncoding("UTF-8");
String name = req.getParameter("name");
String age = req.getParameter("age");

res.setCharacterEncoding("UTF-8");
res.setHeader("content-type", "text/html;charset=UTF-8");
res.getWriter().write("Don't panic, " + name + "! You are " + age + " now."); // 或 getWriter().println()
```

重定向 (redirect), 将 url 返回给客户端, 让客户端再发一次请求
```java
res.sendRedirect("/index.jsp");
```

转发 (forward), 服务器内部跳转, 对客户端透明
```java
req.setAttribute("msg", "hello, world");
req.getRequestDispatcher("/index.jsp").forward(req, res);
```
