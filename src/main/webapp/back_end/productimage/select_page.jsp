<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Image Test</title>
</head>
<body>
	<h1>產品圖片測試</h1>
	
	<h3>資料查詢:</h3>
	
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li>${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a
			href="${pageContext.request.contextPath}/ProductImage?action=getAll">查看所有圖片</a></li>
		<li>
			<form method="post" action="${pageContext.request.contextPath}/ProductImage">
				<b>輸入圖片編號 (如3001)</b> <input type="text" name="imgno"> <input
					type="hidden" name="action" value="getOneImage"> <input
					type="submit" value="送出">
			</form>
		</li>
	</ul>
	<jsp:useBean id="piSvc" scope="page" class="com.productimage.model.ProductImageService"/>
	
	<li>
			<form method="post" action="${pageContext.request.contextPath}/ProductImage">
				<b>選擇圖片編號:</b> 
				<select name="imgno">
				<c:forEach var="piVO" items="${piSvc.all}">
				<option value="${piVO.imgno}">圖片編號:${piVO.imgno}
				</c:forEach>
				</select>
				 <input type="hidden" name="action" value="getOneImage">
				 <input type="submit" value="送出">
			</form>
	</li>
	<li>
			<form method="post" action="${pageContext.request.contextPath}/ProductImage">
				<b>選擇商品編號:</b> 
				<select name="imgno">
				<c:forEach var="piVO" items="${piSvc.all}">
				<option value="${piVO.imgno}">商品編號:${piVO.prodno}
				</c:forEach>
				</select>
				 <input type="hidden" name="action" value="getOneImage">
				 <input type="submit" value="送出">
			</form>
	</li>
	<hr>
	
	<h3>新增圖片:</h3>
	<form method="post" action="${pageContext.request.contextPath}/ProductImage" enctype="multipart/form-data">
	商品編號: <input type="text" name="prodno"><br>
	選擇圖片: <input type="file" name="upfile"><br>
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="新增">
	</form>
	
	
</body>
</html>