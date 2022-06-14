<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,model.*"%>
<%
List<String> area = (List<String>)request.getAttribute("area");
List<Station> stations = (List<Station>)request.getAttribute("stations");
String train = (String)request.getAttribute("train");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>駅検索</title>
</head>
<body>
<p>路線を選んでください</p>
<form action="/station/Main" method="post">
<select name="train">
<% for(String s:area){ %>
<option value="<%=s %>" <%=s.equals(train) ? "selected":"" %>><%=s %></option>
<% } %>
</select>
<input type="submit" value="送信">
</form>
<% if(stations != null && stations.size() != 0){ %>
<p><%=train %>の駅一覧</p>
<table border="1">
<tr>
<th>駅名</th><th>都道府県</th>
</tr>
<% for(Station station:stations){ %>
<tr>
<td><%=station.getName() %></td><td><%=station.getPrefecture() %></td>
</tr>
<% } %>
</table>
<% } %>
</body>
</html>