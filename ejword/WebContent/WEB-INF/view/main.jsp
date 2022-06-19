<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<input type="text" name="searchWord" value="${ejw.searchWord}" class="form-control" placeholder="検索語を入力">
<select name="mode" class="form-control">
<option value="startsWith" ${ejw.mode eq "startsWith"?"selected":"" }>で始まる</option>
<option value="contains" ${ejw.mode eq "contains"?"selected":"" } >含む</option>
<option value="endsWith" ${ejw.mode eq "endsWith"?"selected":"" }>で終わる</option>
<option value="match" ${ejw.mode eq "match"?"selected":"" }>一致する</option>
</select>
<button type="submit" class="btn btn-primary">検索</button>
</form>
<c:if test="${not empty ejw.searchWord and empty ejw.list }">
<p>１件も一致しませんでした</p>
</c:if>
<c:if test="${not empty ejw.list}">
<%--表示件数部分作成 --%>
<c:choose>
	<c:when test="${ejw.total le ejw.limit }">
		<p>全${ejw.total}件</p>
	</c:when>
	<c:otherwise>
		<%--ページ番号を利用して何件から何件を表示しているのかを表示 --%>
		<p>全${ejw.total}件中 ${(ejw.pageNo-1) * ejw.limit+1}～${ejw.pageNo*ejw.limit gt ejw.total?ejw.total:ejw.pageNo*ejw.limit}件を表示</p>
		<%--ページ番号が1より大きかったら前へのリンクを表示 --%>
		<ul class="pager">
		<c:if test="${ejw.pageNo gt 1 }">
			<li><a href="/ejword/Main?searchWord=${ejw.searchWord}&mode=${ejw.mode}&page=${ejw.pageNo-1}"><span aria-hidden="true">&larr;</span>前へ</a></li>
		</c:if>
		<%--件数が全件数に届かないときは次へのリンクを表示 --%>
		<c:if test="${ejw.pageNo*ejw.limit lt ejw.total }">
			<li><a href="/ejword/Main?searchWord=${ejw.searchWord}&mode=${ejw.mode}&page=${ejw.pageNo+1}">次へ<span aria-hidden="true">&rarr;</span></a></li>
		</c:if>
		</ul>
	</c:otherwise>
</c:choose>
	<table class="table table-bordered table-striped" border="1">
	<c:forEach var="w" items="${ejw.list}">
		<tr><th>${w.title}</th><td>${w.body}</td></tr>
	</c:forEach>
	</table>
</c:if>
<c:if test="${not empty ejw.pager }">
<div class="paginationBox">
<ul class="pagination">
	<c:forEach var="row" items="${ejw.pager}">
		<li class="${row[0]}">
		<a href="/ejword/Main?searchWord=${ejw.searchWord}&mode=${ejw.mode}&page=${row[1]}">${row[2]}</a>
		</li>
	</c:forEach>
</ul>
</div>
</c:if>
</div>
<footer>
&copy; 2017 Joytas.net
</footer>
</body>
</html>