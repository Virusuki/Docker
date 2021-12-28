<%@ page contentType="text/unknown; charset=euc-kr" %>
<%@ page import="java.net.URLEncoder" %>
<%
String name ="test";
response.setHeader("Content-Disposition","attachment; filename="+URLEncoder.encode(name, "utf-8")+".txt");
%>
