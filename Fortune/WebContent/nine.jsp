<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
<link rel="stylesheet" href="main.css">
<title>九九</title>
</head>
<body>
<table border=1>
<thead>
<tr><th colspan=9>九九表</th></tr>
</thead>
<% for(int i=1;i<=9;i++){%>
	<tr>
<% for(int j=1;j<=9;j++){%>
	<td><%=i*j %></td>
<% } %>
	</tr>
<% }%>
</table>
</body>
</html>