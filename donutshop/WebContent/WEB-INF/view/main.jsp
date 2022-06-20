<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.*"%>
<% List<Donut> list = (List<Donut>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Donut Menu</title>
<link rel="stylesheet" href="http://yui.yahooapis.com/3.18.1/build/cssreset/cssreset-min.css">
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div id="wrapper">
		<h1>Donut Menu</h1>
		<div id="menu">
			<% for(Donut d : list){ %>
			<div>
				<img src="upload/<%=d.getImgname()%>">
				<p><%=d.getName() %></p>
				<p><%=d.getPrice() %>円</p>
			</div>
			<% } %>
		</div>
	</div>
</body>
</html>