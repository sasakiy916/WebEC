<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
List<Word> list = (List<Word>)request.getAttribute("list");
String searchWord = (String)request.getAttribute("searchWord");
if(searchWord == null)searchWord="";
String mode = (String)request.getAttribute("mode");
if(mode == null)mode="";
Integer total = (Integer)request.getAttribute("total");
Integer limit = (Integer)request.getAttribute("limit");
Integer pageNo = (Integer)request.getAttribute("pageNo");
String pagenation = (String)request.getAttribute("pagenation");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<style>
form{
margin:20px auto;
}
input,select{
margin-right:5px;
}
.pager{
text-align:left;
}
.pagenationBox{
text-align:center;
}
footer{
height:40px;
background:#347ab7;
color:white;
text-align:center;
line-height:40px;
margin-top:30px;
}
</style>
<title>EJWord</title>
</head>
<body>
<div class="container">
<form action="/ejword/Main" method="get" class="form-inline">
<input type="text" name="searchWord" value="<%=searchWord %>" class="form-control" placeholder="検索語を入力">
<select name="mode" class="form-control">
<option value="startsWith" <% if(mode.equals("startsWith"))out.println("selected");%>>で始まる</option>
<option value="contains" <% if(mode.equals("contains"))out.println("selected");%>>含む</option>
<option value="endsWith" <% if(mode.equals("endsWith"))out.println("selected");%>>で終わる</option>
<option value="match" <% if(mode.equals("match"))out.println("selected");%>>一致する</option>
</select>
<button type="submit" class="btn btn-primary">検索</button>
</form>
<% if(list != null && list.size() != 0){ %>
	<%--表示件数部分作成 --%>
	<% if(total <= limit){ %>
		<p>全<%=total %>件</p>
	<% }else{ %>
		<%--ページ番号を利用して何件から何件を表示しているのかを表示 --%>
		<p>全<%=total %>件中 <%=(pageNo-1)*limit+1 %>～<%=pageNo*limit > total?total:pageNo*limit %>件を表示</p>
		<%--ページ番号が1より大きかったら前へのリンクを表示 --%>
		<ul class="pager">
		<% if(pageNo > 1){ %>
			<li><a href="/ejword/Main?searchWord=<%=searchWord%>&mode=<%=mode %>&page=<%=pageNo-1%>"><span area-hidden="ture">&larr;</span>前へ</a></li>
		<% } %>
		<%--件数が全件数に届かないときは次へのリンクを表示 --%>
		<% if(pageNo*limit < total){ %>
			<li><a href="/ejword/Main?searchWord=<%=searchWord%>&mode=<%=mode%>&page=<%=pageNo+1%>">次へ<span aria-hidden="true">&rarr;</span></a></li>
		<% } %>
		</ul>
	<% } %>
	<table class="table table-bordered table-striped" border="1">
	<% for(Word w:list){ %>
		<tr><th><%=w.getTitle() %></th><td><%=w.getBody() %></td></tr>
	<% } %>
	</table>
<% } %>
<% if(pagenation != null){ %>
<%=pagenation %>
<% } %>
</div>
<footer>
</footer>
</body>
</html>