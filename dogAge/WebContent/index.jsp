<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>犬の年齢</title>
</head>
<body>
<form action="/dogAge/Result" method="post">
犬の名前:<input type="text" name="name"><br>
犬の年齢:<input type="number" min="0" name="age"><br>
<input type="submit" value="送信">
</form>
</body>
</html>