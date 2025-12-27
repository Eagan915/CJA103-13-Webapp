<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Image</title>
</head>
<body>
<h1>更新圖片</h1>
<c:if test="${not empty errorMsgs }">
<font style="color:red">請修正以下錯誤</font>
<ul>
<c:forEach var="message" items="${errorMsgs}">
<li style="color:red">${message}</li>
</c:forEach>
</ul>
</c:if>
<b>圖片編號為:${piVO.imgno}</b><br>
<b>商品編號為:${piVO.prodno}</b><br>
<b>商品名稱為:${piVO.prodname}</b><br>
<b>上傳時間為:${piVO.uploaddate}</b><br>
<b>目前圖片為:</b><img src="${pageContext.request.contextPath}/DisplayImage?imgno=${piVO.imgno}" width="150">
<form method="post" action="${pageContext.request.contextPath}/ProductImage" enctype="multipart/form-data">
重新選擇圖片:<input type="file" name="upfile"><br>
<input type="hidden" name="imgno" value="${piVO.imgno}">
<input type="hidden" name="prodno" value="${piVO.prodno}">
<input type="hidden" name="prodname" value="${piVO.prodname}">
<input type="hidden" name="action" value="update">
<input type="submit" value="送出修改">
<br>
<a href="${pageContext.request.contextPath}/ProductImage?action=getAll">返回上一頁</a>
</form>
</body>
</html>