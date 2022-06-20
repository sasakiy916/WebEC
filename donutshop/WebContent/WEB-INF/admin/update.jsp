<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*"%>
<% Donut donut = (Donut)request.getAttribute("donut");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/donutshop/Admin/Update" method="post" enctype="multipart/form-data">
商品名:<input type="text" name="name" value="<%=donut.getName() %>" required><br>
価格:<input type="number" name="price" value="<%=donut.getPrice() %>" required><br>
<img src="/donutshop/upload/<%=donut.getImgname() %>" id="preview"><br>
商品画像:<input type="file" name="imgname" id="imgname"><br>
<input type="hidden" name="id" value="<%=donut.getId()%>">
<input type="hidden" name="orgname" value="<%=donut.getImgname()%>">
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