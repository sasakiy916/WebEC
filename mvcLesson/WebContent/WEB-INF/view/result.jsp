<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
List<Slime> list = (List<Slime>)request.getAttribute("skey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%for(Slime s:list){ %>
<p><%=s.getName() %>が現れた![HP:<%=s.getHp() %>]</p>
<%} %>
</body>
</html>