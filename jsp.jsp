<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>jsp test</title>
</head>
<body>

<% for (int i = 1; i <= 3; ++i) { %>
	<p>第 <%= i %> 行</p>
<%}%>

</body>
</html>
