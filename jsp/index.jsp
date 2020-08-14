<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Date" %>
<%-- <%@ taglib uri="myuri" prefix="mytag" %> --%>
<%-- <%@ include file="..." %> --%>
<html>
<head>
	<title>JSP Examples</title>
	<link rel="stylesheet" href="style.css"/>
</head>
<body>

<%-- JSP comment won't go to browser, --%>
<!-- HTML comment will. -->

<p>
[<%=(new Date()).toLocaleString()%>]
<%if (request.getParameter("name") == null) {%>
	client
<%} else {
	out.print(request.getParameter("name"));
}%>
from <%=request.getRemoteAddr()%> logged in.
</p>

<h2>JSP Tags</h2>

<%-- jsp expression --%>
<p>
	<%="Servlet adds HTML code inside Java,"%>
	<jsp:expression>"while JSP adds Java code inside HTML."</jsp:expression>
</p>

<%-- jsp scriptlet --%>
<p>
	<%
		out.print("Servlet is used for business layer,");
	%>
	<jsp:scriptlet>
		out.print("while JSP is used for presentation layer of an enterprise application.");
	</jsp:scriptlet>
</p>

<%for (int i = 1; i <= 3; ++i) {%>
	<p><%=".".repeat(i)%></p>
<%}%>

<h2>Lifecycle</h2>

<%-- jsp declaration --%>
<%!
private int countInit = 0, countService = 0, countDestroy = 0;

public void jspInit() {
	++countInit;
}

public void jspDestroy() {
	++countDestroy;
}

/*
void _jspService(HttpServletRequest req, HttpServletResponse res) {
	++countService;
}
*/
%>
<ul>
	<li><code>jspInit()</code>: <%=countInit%>;</li>
	<li><code>_jspService()</code>: <%=++countService%>;</li>
	<li><code>jspDestroy()</code>: <%=countDestroy%>.</li>
</ul>

<h2>Actions</h2>

<\%@ Directives %> are processed at complile time, while
&lt;jsp:action /&gt; are processed together with request.

<pre>
# 包含页面
&lt;jsp:include page="url" flush="true" /&gt;

# 跳转
&lt;jsp:forward page="url" /&gt;

# 读写 java 模型类
# 需要将 My.class 拷贝到 WEB-INF/classes/com/package 下
&lt;jsp:useBean id="id" class="com.package.My" /&gt;
&lt;jsp:getProperty name="My" property="prop" /&gt;
&lt;jsp:setProperty name="My" property="prop" value="val" /&gt;
&lt;jsp:setProperty name="My" property="prop" param="requestParam" /&gt;
</pre>

</body>
</html>
