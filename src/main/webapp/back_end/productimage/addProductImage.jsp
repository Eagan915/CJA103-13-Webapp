<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product Image</title>
</head>
<body>
<h1>圖片新增:</h1>
<c:if test="${not empty errorMsgs }">
<font style="color:red">請修正以下錯誤</font>
<ul>
<c:forEach var="message" items="${errorMsgs}">
<li style="color:red">${message}</li>
</c:forEach>
</ul>
</c:if>

<jsp:useBean id="piSvc" scope="page" class="com.productimage.model.ProductImageService"/>

<form method="post" action="${pageContext.request.contextPath}/ProductImage" enctype="multipart/form-data">
<b>選擇商品名稱:</b>
<select name="prodno">
<c:forEach var="piVO" items="${piSvc.all}">
<option value="${piVO.prodno}">商品名稱:${piVO.prodname}
</c:forEach>
</select>
<br>
選擇圖片:<input type="file" name="upfile">
<input type="hidden" name="action" value="insert">
<br>
<input type="submit" value="新增"> 
</form>
</body>
</html>