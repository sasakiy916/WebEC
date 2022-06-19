<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:out value="${human.name}"/>
<p>${human.name}(${human.age}歳)</p>
<c:if test="${human.age ge 20 }">
${human.name }は成人です
</c:if>
<c:choose>
<c:when test="${human.age ge 50 }">
${human.name }はすごい大人です
</c:when>
<c:when test="${human.age ge 20 }">
${human.name }は大人です
</c:when>
<c:otherwise>
${human.name }は子供です
</c:otherwise>
</c:choose>
<c:forEach var="i" begin="0" end="9" step="1">
<c:out value="${i }"/>
</c:forEach>
<c:forEach var="h" items="${list }">
<p>${h.name }(${h.age }歳)</p>
</c:forEach>
</body>
</html>