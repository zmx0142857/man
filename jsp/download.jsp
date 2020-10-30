<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ page import="java.io.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
    String sFileName = "文件.doc";
    response.reset();
    response.setContentType("application/x-download;charset=utf-8");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(sFileName, "UTF8") + "\"");
    OutputStream os = null;
    try {
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File("C:/Users/zmx/app/apache-tomcat-9.0.37/webapps/ROOT/test.doc")));
        os = response.getOutputStream();
        byte[] buffer = new byte[1000];
        int n;
        while ((n = in.read(buffer)) != -1) {
            os.write(buffer, 0, n);
        }
        os.flush();
    } catch (IOException e) {
        System.out.println(e);
    } finally {
        os.close();
    }
%>
