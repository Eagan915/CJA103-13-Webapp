<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productimage.model.*"%>
<%
// 	ProductImageService piSvc = new ProductImageService();
// 	List<ProductImageVO> piList = piSvc.getAll();
// 	pageContext.setAttribute("piList", piList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List All Image</title>
</head>
<body>
	<h1>所有圖片資料</h1>
	<a
		href="${pageContext.request.contextPath}/back_end/productimage/select_page.jsp">返回首頁</a>

	<table>
		<tr>
			<th>圖片編號</th>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>上傳日期</th>
			<th>上傳圖片</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

		<c:forEach var="piVO" items="${piList}">
			<tr>
				<td>${piVO.imgno}</td>
				<td>${piVO.prodno}</td>
				<td>${piVO.prodname}</td>
				<td>${piVO.uploaddate}</td>
				<td><img
					src="${pageContext.request.contextPath}/DisplayImage?imgno=${piVO.imgno}"
					width="150"></td>
				<td>
					<form method="post"
						action="${pageContext.request.contextPath}/ProductImage">
						<input type="submit" value="修改"> 
						<input type="hidden" name="imgno" value="${piVO.imgno}">
						<input type="hidden" name="action" value="getOne_For_Update">
					</form>
				</td>
				<td>
					<form method="post"
						action="${pageContext.request.contextPath}/ProductImage">
						<input type="submit" value="刪除">
						<input type="hidden" name="imgno" value="${piVO.imgno}">
						<input type="hidden" name="action" value="delete">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>