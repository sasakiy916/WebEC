<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ans = request.getParameter("ans");
	String path = "laugh.png";
	String msg = "正解";
	if(!ans.equals("634")){
		path = "cry.png";
		msg = "残念。。。正解は634m";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>博士クイズ!</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<div id="container">
		<div id="boxA">
		<p><%=msg %></p>
		<a href="/Quiz/index.html">もう一回</a>
		</div>
		<div id="boxB">
		<div class="imgBox">
			<img alt="" src="images/<%=path %>">
		</div>
		</div>
	</div>
</body>
</html>
