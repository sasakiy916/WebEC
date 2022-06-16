<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%
Pokemon pokemon = (Pokemon)request.getAttribute("pokemon");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<form action="/POKENETA_WEBAPP/Main" method="post">
<select name="name">
<option>ピカチュウ</option>
<option>マルマイン</option>
</select><br>
<select name="imgType">
<option>通常画像</option>
<option>ネタ画像</option>
</select>
<input type="submit" value="送信">
</form>
<% if(pokemon != null){ %>
<img src="<%=pokemon.getImgPath()%>">
<% } %>
</body>
</html>