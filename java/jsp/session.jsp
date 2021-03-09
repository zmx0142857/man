<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%
   Date createTime = new Date(session.getCreationTime());
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "hello again";
   String userID = "ABCD";
   Integer visitCount = 0;

   if (session.isNew()) {
       title = "hello";
       session.setAttribute("userID", userID);
       session.setAttribute("visitCount", visitCount);
   } else {
       userID = (String)session.getAttribute("userID");
       visitCount = (Integer)session.getAttribute("visitCount");
       session.setAttribute(visitCountKey, ++visitCount);
   }
%>
<html>
<head>
<title>Session 跟踪</title>
</head>
<body>

<table>
<tr>
   <td>session id</td>
   <td><%=session.getId()%></td>
</tr>
<tr>
   <td>创建时间</td>
   <td><%=createTime%></td>
</tr>
<tr>
   <td>最后访问时间</td>
   <td><%=lastAccessTime%></td>
</tr>
<tr>
   <td>用户 ID</td>
   <td><%=userID%></td>
</tr>
<tr>
   <td>访问次数</td>
   <td><%=visitCount%></td>
</tr>
</table>
</body>
</html>
