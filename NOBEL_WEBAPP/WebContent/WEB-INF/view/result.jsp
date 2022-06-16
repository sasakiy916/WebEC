<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%
String result = (String)request.getAttribute("result");
Nobel nobel = (Nobel)session.getAttribute("nobel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p><%=result %></p>
<p>正解は<%=nobel.getTitle()[0] %>でした</p>
<button><a href="http://192.168.2.110:8080/NOBEL_WEBAPP/Main">もう一度チャレンジ</a></button>
<% session.invalidate(); %>
</body>
</html>