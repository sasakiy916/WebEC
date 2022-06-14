<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = (String)request.getAttribute("name");
name = name==null?"":name;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FilterApp</title>
</head>
<body>
<form action="/filterapp/Main" method="post">
名前:<input type="text" name="name" value="<%=name%>">
<input type="submit" value="送信">
</form>
<% if(!name.equals("")){ %>
<p>ようこそ<%=name %>さん！</p>
<% } %>
</body>
</html>