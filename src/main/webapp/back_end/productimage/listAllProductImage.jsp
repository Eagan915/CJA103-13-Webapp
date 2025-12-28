<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productimage.model.*"%>

<%
	ProductImageService piSvc = new ProductImageService();
	List<ProductImageVO> piList = piSvc.getAll();
	pageContext.setAttribute("piList", piList);
	
int rowsPerPage = 5;
int totalRows = piList.size();
int pageNumber = 0;
int whichPage = 1;

if(totalRows%rowsPerPage != 0){
	pageNumber = (totalRows/rowsPerPage)+1;
}else{
	pageNumber = totalRows/rowsPerPage;
}

String currentPage = request.getParameter("whichPage");
if(currentPage == null){
	whichPage = 1;
}else{
	whichPage = Integer.valueOf(currentPage);
}

int beginIndex = rowsPerPage*(whichPage-1);
int endIndex = (rowsPerPage*whichPage)-1;

	pageContext.setAttribute("beginIndex", beginIndex);
    pageContext.setAttribute("endIndex", endIndex);
    pageContext.setAttribute("pageNumber", pageNumber);
    pageContext.setAttribute("whichPage", whichPage);

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
		href="${pageContext.request.contextPath}/back_end/productimage/select_page.jsp">返回首頁</a><br>
<b style="color:red">第${whichPage}/${pageNumber}頁</b>
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

		<c:forEach var="piVO" items="${piList}" begin="${beginIndex}" end="${endIndex}">
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
						action="${pageContext.request.contextPath}/ProductImage" onsubmit="return confirm('確認刪除？')">
						<input type="submit" value="刪除">
						<input type="hidden" name="imgno" value="${piVO.imgno}">
						<input type="hidden" name="action" value="delete">
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
	
<%-- 	<c:forEach var="i" begin="1" end="${pageNumber}"> --%>
<%--     <a href="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${i}">第${i}頁</a> --%>
<%--     </c:forEach> --%>
<c:if test="${whichPage > 1}">
<a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=1">至第一頁</a>
</c:if>
<c:if test="${whichPage - 1 > 0}">
<a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${whichPage - 1}">上一頁</a>
</c:if>
<c:if test="${whichPage + 1  <= pageNumber}">
<a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${whichPage + 1}">下一頁</a>
</c:if>
<c:if test="${whichPage != pageNumber}">
<a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${pageNumber}">至最後一頁</a>
</c:if>
</body>
</html>