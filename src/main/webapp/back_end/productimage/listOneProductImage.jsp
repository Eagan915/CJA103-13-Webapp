<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List One Image</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/back_end/productimage/select_page.jsp">返回首頁</a>
<br>
<b>查詢結果:</b>
<table>
<tr>
<th>圖片編號</th>
<th>產品編號</th>
<th>上傳日期</th>
<th>上傳圖片</th>
</tr>
<tr>
<td>${piVO.imgno}</td>
<td>${piVO.prodno}</td>
<td>${piVO.uploaddate}</td>
<td><img src="${pageContext.request.contextPath}/DisplayImage?imgno=${piVO.imgno}" width="150"></td>
</tr>
</table>
</body>
</html>