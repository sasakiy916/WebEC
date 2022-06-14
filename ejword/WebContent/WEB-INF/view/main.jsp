<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,java.util.*"%>
<%
EJWord ejw = (EJWord)request.getAttribute("ejw");
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
.paginationBox{
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
<input type="text" name="searchWord" value="<%=ejw.getSearchWord() %>" class="form-control" placeholder="検索語を入力">
<select name="mode" class="form-control">
<option value="startsWith" <% if(ejw.getMode().equals("startsWith"))out.println("selected");%>>で始まる</option>
<option value="contains" <% if(ejw.getMode().equals("contains"))out.println("selected");%>>含む</option>
<option value="endsWith" <% if(ejw.getMode().equals("endsWith"))out.println("selected");%>>で終わる</option>
<option value="match" <% if(ejw.getMode().equals("match"))out.println("selected");%>>一致する</option>
</select>
<button type="submit" class="btn btn-primary">検索</button>
</form>
<% if(ejw.getList() != null && ejw.getList().size() != 0){ %>
	<%--表示件数部分作成 --%>
	<% if(ejw.getTotal() <= ejw.getLimit()){ %>
		<p>全<%=ejw.getTotal() %>件</p>
	<% }else{ %>
		<%--ページ番号を利用して何件から何件を表示しているのかを表示 --%>
		<p>全<%=ejw.getTotal() %>件中 <%=(ejw.getPageNo()-1)*ejw.getLimit()+1 %>～<%=ejw.getPageNo()*ejw.getLimit() > ejw.getTotal()?ejw.getTotal():ejw.getPageNo()*ejw.getLimit() %>件を表示</p>
		<%--ページ番号が1より大きかったら前へのリンクを表示 --%>
		<ul class="pager">
		<% if(ejw.getPageNo() > 1){ %>
			<li><a href="/ejword/Main?searchWord=<%=ejw.getSearchWord()%>&mode=<%=ejw.getMode() %>&page=<%=ejw.getPageNo()-1%>"><span area-hidden="ture">&larr;</span>前へ</a></li>
		<% } %>
		<%--件数が全件数に届かないときは次へのリンクを表示 --%>
		<% if(ejw.getPageNo()*ejw.getLimit() < ejw.getTotal()){ %>
			<li><a href="/ejword/Main?searchWord=<%=ejw.getSearchWord()%>&mode=<%=ejw.getMode()%>&page=<%=ejw.getPageNo()+1%>">次へ<span aria-hidden="true">&rarr;</span></a></li>
		<% } %>
		</ul>
	<% } %>
	<table class="table table-bordered table-striped" border="1">
	<% for(Word w:ejw.getList()){ %>
		<tr><th><%=w.getTitle() %></th><td><%=w.getBody() %></td></tr>
	<% } %>
	</table>
<% } %>
<% if(ejw.getPager() != null){ %>
<div class="paginationBox">
<ul class="pagination">
<% for(String[] row : ejw.getPager()){ %>
<li class="<%=row[0]%>">
<a href="/ejword/Main?searchWord=<%=ejw.getSearchWord() %>&mode=<%=ejw.getMode() %>&page=<%=row[1] %>"><%=row[2] %></a>
</li>
<% } %>
</ul>
</div>
<% } %>
</div>
<footer>
&copy; 2017 Joytas.net
</footer>
</body>
</html>