<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Product Image</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f6;
        margin: 0;
        padding: 40px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    .card {
        background: white;
        width: 100%;
        max-width: 500px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        padding: 30px;
    }
    h1 {
        color: #2c3e50;
        font-size: 1.6em;
        text-align: center;
        margin-bottom: 25px;
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
    }
    .form-group {
        margin-bottom: 20px;
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: 600;
        color: #34495e;
    }
    select, input[type="file"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box; /* 確保寬度包含 padding */
    }
    /* 檔案選擇框稍微美化 */
    input[type="file"] {
        background-color: #f9f9f9;
        cursor: pointer;
    }
    input[type="submit"] {
        width: 100%;
        background-color: #2ecc71;
        color: white;
        border: none;
        padding: 12px;
        border-radius: 6px;
        font-size: 1.1em;
        font-weight: bold;
        cursor: pointer;
        transition: background 0.3s;
        margin-top: 10px;
    }
    input[type="submit"]:hover {
        background-color: #27ae60;
    }
    .error-msg {
        background-color: #fff5f5;
        border-left: 5px solid #ff4d4d;
        padding: 10px 15px;
        margin-bottom: 20px;
        border-radius: 4px;
    }
    .error-msg ul {
        margin: 0;
        padding-left: 20px;
        color: #d63031;
    }
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #7f8c8d;
        font-size: 0.9em;
    }
    .back-link:hover {
        color: #34495e;
    }
</style>
</head>
<body>

<div class="card">
    <h1>📤 圖片新增</h1>

    <c:if test="${not empty errorMsgs}">
        <div class="error-msg">
            <strong>請修正以下錯誤：</strong>
            <ul>
                <c:forEach var="message" items="${errorMsgs}">
                    <li>${message}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <jsp:useBean id="piSvc" scope="page" class="com.productimage.model.ProductImageService"/>

    <form method="post" action="${pageContext.request.contextPath}/ProductImage" enctype="multipart/form-data">
        
        <div class="form-group">
            <label>選擇商品名稱</label>
            <select name="prodno">
                <c:forEach var="piVO" items="${piSvc.all}">
                    <option value="${piVO.prodno}">商品名稱: ${piVO.prodname}</option>
                </c:forEach>
            </select>
        </div>

        <div class="form-group">
            <label>選擇圖片檔案</label>
            <input type="file" name="upfile" accept="image/*">
        </div>

        <input type="hidden" name="action" value="insert">
        <input type="submit" value="🚀 開始上傳"> 
    </form>

    <a href="${pageContext.request.contextPath}/back_end/productimage/select_page.jsp" class="back-link">
        ↩️ 返回管理首頁
    </a>
</div>

</body>
</html>