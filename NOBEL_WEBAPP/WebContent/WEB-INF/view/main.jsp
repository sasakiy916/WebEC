<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.*"%>
<%
List<String> author = (List<String>)request.getAttribute("author");
Nobel nobel = (Nobel)session.getAttribute("nobel");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文豪タイトルクイズ</title>
</head>
<body>
<h1>文豪タイトルクイズ</h1>
<p>選んだ文豪の作品の始まりの文章が表示されます。該当する作品のタイトルを入力してください。</p>
<% if(nobel == null){ %>
<p>好きな文豪を選んでください。</p>
<form action="/NOBEL_WEBAPP/Main" method="post">
<select name="author">
<% for(String s:author){ %>
<option><%=s %></option>
<% } %>
</select>
<input type="submit" value="決定">
</form>
<% }else{ %>
<p><%=nobel.getAuthor()[0] %>の作品</p>
<p><%=nobel.getBeginning() %></p>
<form action="/NOBEL_WEBAPP/Answer" method="post">
<input name="ans" type="text" placeholder="答えを入力してください">
<input type="submit" value="送信">
</form>
<% } %>
</form>
</body>
</html>