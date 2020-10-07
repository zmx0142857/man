<%@ page import="com.demo.model.*"%>
<%
    User user = (User) request.getAttribute("user");
%>
<html>
<head>
    <title>Hello World - JSP</title>
</head>
<body>
    <h1>Hello <%= user.getName() %>!</h1>
    <p>School Name:
    <span style="color:red">
        <%= user.getSchool().getName() %>
    </span>
    </p>
    <p>School Address:
    <span style="color:red">
        <%= user.getSchool().getAddress() %>
    </span>
    </p>
</body>
</html>

