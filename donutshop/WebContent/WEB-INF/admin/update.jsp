<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/donutshop/Admin/Update" method="post" enctype="multipart/form-data">
商品名:<input type="text" name="name" value="${donut.name}" required><br>
価格:<input type="number" name="price" value="${donut.price}" required><br>
<img src="/donutshop/upload/${donut.imgname}" id="preview"><br>
商品画像:<input type="file" name="imgname" id="imgname"><br>
<input type="hidden" name="id" value="${donut.id}">
<input type="hidden" name="orgname" value="${donut.imgname}">
<button type="submit">更新</button>
</form>
<script>
window.onload=()=>{
	const inputFile = document.getElementById("imgname");
	const previewImg = document.getElementById("preview");
	const reader = new FileReader();
	reader.addEventListener("load",()=>{
		previewImg.src = reader.result;
	});
	inputFile.addEventListener("change",()=>{
		reader.readAsDataURL(inputFile.files[0]);
	});
};
</script>
</body>
</html>