<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<%
BMI bmi = (BMI)request.getAttribute("bmi");
String height = bmi==null?"":bmi.getHeight()+"";
String weight = bmi==null?"":bmi.getWeight()+"";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BMI測定アプリ</title>
</head>
<body>
<form action="/BMI_WEBAPP/Main" method="post">
<input type="number" name="height" step="0.1" placeholder="Enter Height(cm)" min="0.0" max="400.0" value="<%=height %>"><br>
<input type="number" name="weight" step="0.1" placeholder="Enter Weight(kg)" min="0.0" max="400.0" value="<%=weight %>"><br>
<button type="submit">Send</button>
</form>
<% if(bmi!=null){ %>
<p>
Height:<%=bmi.getHeight() %><br>
Weight:<%=bmi.getWeight() %><br>
BMI:<%=bmi.getBmi() %>
</p>
<img src="<%=bmi.getImgPath()%>">
<% } %>
</body>
</html>