<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Image Test</title>

<style>
    body {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f6;
        color: #333;
        margin: 0;
        padding: 40px;
    }
    .container {
        max-width: 800px;
        margin: auto;
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    h1 {
        color: #2c3e50;
        border-bottom: 2px solid #3498db;
        padding-bottom: 10px;
        text-align: center;
    }
    h3 { color: #2980b9; margin-top: 25px; }
    ul { list-style: none; padding: 0; }
    li { 
        background: #f9f9f9;
        margin-bottom: 15px;
        padding: 15px;
        border-radius: 8px;
        border-left: 5px solid #3498db;
    }
    select, input[type="text"] {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin: 5px 0;
    }
    input[type="submit"], .btn-add {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 8px 20px;
        border-radius: 4px;
        cursor: pointer;
        text-decoration: none;
        transition: background 0.3s;
    }
    input[type="submit"]:hover, .btn-add:hover {
        background-color: #2980b9;
    }
    .error-box {
        background-color: #ffeef0;
        border: 1px solid #facccc;
        padding: 10px;
        border-radius: 8px;
    }
    .nav-links { display: flex; justify-content: space-between; align-items: center; }
</style>
</head>
<body>

<div class="container">
    <h1>🖼️ 產品圖片管理系統</h1>
    
    <div class="nav-links">
        <h3>🔍 資料快速查詢</h3>
        <a href="${pageContext.request.contextPath}/back_end/productimage/addProductImage.jsp" class="btn-add">➕ 新增產品圖片</a>
    </div>

    <c:if test="${not empty errorMsgs}">
        <div class="error-box">
            <font style="color: red; font-weight: bold;">請修正以下錯誤:</font>
            <ul>
                <c:forEach var="message" items="${errorMsgs}">
                    <li style="color: red; border:none; background:none; padding:2px;">• ${message}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <ul>
        <li>
            <b>瀏覽功能：</b>
            <a href="${pageContext.request.contextPath}/ProductImage?action=getAll" class="btn-add" style="font-size: 14px;">查看所有圖片清單</a>
        </li>

        <li>
            <form method="post" action="${pageContext.request.contextPath}/ProductImage">
                <b>🔢 輸入圖片編號:</b> 
                <input type="text" name="imgno" placeholder="例如: 3001"> 
                <input type="hidden" name="action" value="getOneImage"> 
                <input type="submit" value="送出查詢">
            </form>
        </li>

        <jsp:useBean id="piSvc" scope="page" class="com.productimage.model.ProductImageService"/>
        
        <li>
            <form method="post" action="${pageContext.request.contextPath}/ProductImage">
                <b>🖼️ 依圖片編號選擇:</b> 
                <select name="imgno">
                    <c:forEach var="piVO" items="${piSvc.all}">
                        <option value="${piVO.imgno}">圖片 ID: ${piVO.imgno}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="action" value="getOneImage">
                <input type="submit" value="查詢">
            </form>
        </li>

        <li>
            <form method="post" action="${pageContext.request.contextPath}/ProductImage">
                <b>📦 依商品編號選擇:</b> 
                <select name="imgno">
                    <c:forEach var="piVO" items="${piSvc.all}">
                        <option value="${piVO.imgno}">商品 ID: ${piVO.prodno}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="action" value="getOneImage">
                <input type="submit" value="查詢">
            </form>
        </li>

        <li>
            <form method="post" action="${pageContext.request.contextPath}/ProductImage">
                <b>🏷️ 依商品名稱選擇:</b> 
                <select name="imgno">
                    <c:forEach var="piVO" items="${piSvc.all}">
                        <option value="${piVO.imgno}">${piVO.prodname}</option>
                    </c:forEach>
                </select>
                <input type="hidden" name="action" value="getOneImage">
                <input type="submit" value="查詢">
            </form>
        </li>
    </ul>
</div>

</body>
</html>