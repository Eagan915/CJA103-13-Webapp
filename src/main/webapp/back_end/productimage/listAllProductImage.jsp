<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.productimage.model.*"%>

<%
    // --- 原有程式碼邏輯保持不變 ---
    ProductImageService piSvc = new ProductImageService();
    List<ProductImageVO> piList = piSvc.getAll();
    pageContext.setAttribute("piList", piList);
    
    int rowsPerPage = 5;
    int totalRows = piList.size();
    int pageNumber = 0;
    int whichPage = 1;

    if(totalRows % rowsPerPage != 0){
        pageNumber = (totalRows / rowsPerPage) + 1;
    } else {
        pageNumber = totalRows / rowsPerPage;
    }

    String currentPage = request.getParameter("whichPage");
    if(currentPage == null){
        whichPage = 1;
    } else {
        whichPage = Integer.valueOf(currentPage);
    }

    int beginIndex = rowsPerPage * (whichPage - 1);
    int endIndex = (rowsPerPage * whichPage) - 1;

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
<style>
    /* 整體樣式 */
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 20px;
        color: #333;
    }
    .container {
        max-width: 1000px;
        margin: 0 auto;
        background: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    }
    h1 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 20px;
    }
    .header-nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
    }
    
    /* 表格美化 */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background: white;
    }
    th {
        background-color: #3498db;
        color: white;
        padding: 12px;
        text-align: center;
    }
    td {
        padding: 12px;
        border-bottom: 1px solid #eee;
        text-align: center;
        vertical-align: middle;
    }
    tr:hover {
        background-color: #f1f7ff; /* 滑鼠滑過變色 */
    }
    
    /* 圖片縮圖樣式 */
    img {
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        transition: transform 0.2s;
    }
    img:hover {
        transform: scale(1.1); /* 滑鼠滑過縮圖放大 */
    }

    /* 按鈕樣式 */
    input[type="submit"] {
        padding: 6px 12px;
        border-radius: 4px;
        border: none;
        cursor: pointer;
        font-weight: bold;
        transition: 0.3s;
    }
    /* 修改按鈕 */
    form[action*="getOne_For_Update"] input[type="submit"] {
        background-color: #f39c12;
        color: white;
    }
    form[action*="getOne_For_Update"] input[type="submit"]:hover {
        background-color: #e67e22;
    }
    /* 刪除按鈕 */
    form[onsubmit*="confirm"] input[type="submit"] {
        background-color: #e74c3c;
        color: white;
    }
    form[onsubmit*="confirm"] input[type="submit"]:hover {
        background-color: #c0392b;
    }

    /* 分頁連結樣式 */
    .pagination {
        text-align: center;
        margin-top: 20px;
    }
    .pagination a {
        display: inline-block;
        padding: 8px 16px;
        margin: 0 4px;
        background-color: #fff;
        border: 1px solid #ddd;
        color: #3498db;
        text-decoration: none;
        border-radius: 4px;
        transition: 0.3s;
    }
    .pagination a:hover {
        background-color: #3498db;
        color: white;
    }
    .back-home {
        text-decoration: none;
        color: #3498db;
        font-weight: bold;
    }
</style>
</head>
<body>

<div class="container">
    <h1>🖼️ 所有圖片資料管理</h1>
    
    <div class="header-nav">
        <a class="back-home" href="${pageContext.request.contextPath}/back_end/productimage/select_page.jsp">⬅️ 返回首頁</a>
        <b style="color:#e74c3c">第 ${whichPage} / ${pageNumber} 頁</b>
    </div>

    <table>
        <thead>
            <tr>
                <th>圖片編號</th>
                <th>商品編號</th>
                <th>商品名稱</th>
                <th>上傳日期</th>
                <th>上傳圖片</th>
                <th>修改</th>
                <th>刪除</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="piVO" items="${piList}" begin="${beginIndex}" end="${endIndex}">
                <tr>
                    <td>${piVO.imgno}</td>
                    <td>${piVO.prodno}</td>
                    <td>${piVO.prodname}</td>
                    <td>${piVO.uploaddate}</td>
                    <td>
                        <img src="${pageContext.request.contextPath}/DisplayImage?imgno=${piVO.imgno}" width="120">
                    </td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/ProductImage">
                            <input type="submit" value="修改"> 
                            <input type="hidden" name="imgno" value="${piVO.imgno}">
                            <input type="hidden" name="action" value="getOne_For_Update">
                        </form>
                    </td>
                    <td>
                        <form method="post" action="${pageContext.request.contextPath}/ProductImage" onsubmit="return confirm('確認刪除編號嗎？')">
                            <input type="submit" value="刪除">
                            <input type="hidden" name="imgno" value="${piVO.imgno}">
                            <input type="hidden" name="action" value="delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
    <div class="pagination">
        <c:if test="${whichPage > 1}">
            <a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=1">⏮ 至第一頁</a>
        </c:if>
        
        <c:if test="${whichPage - 1 > 0}">
			<a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${whichPage - 1}">◀ 上一頁</a>
		</c:if>
		
        <c:if test="${whichPage + 1  <= pageNumber}">
			<a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${whichPage + 1}">下一頁 ▶</a>
		</c:if>
        
        <c:if test="${whichPage < pageNumber}">
            <a href ="${pageContext.request.contextPath}/ProductImage?action=getAll&whichPage=${pageNumber}">至最後一頁 ⏭</a>
        </c:if>
    </div>
</div>

</body>
</html>