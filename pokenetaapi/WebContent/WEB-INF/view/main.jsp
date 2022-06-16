<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/pokenetaapi/GetPokemon" method="get">
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
<img src="http://192.168.2.110:8080/pokenetaapi/images/neta/pikachu.jpg">
</body>
</html>