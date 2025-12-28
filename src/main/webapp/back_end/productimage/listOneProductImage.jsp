<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List One Image - 查詢結果</title>
<style>
    /* 整體基礎樣式 */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f4f7f6;
        margin: 0;
        padding: 40px;
        display: flex;
        justify-content: center;
    }

    .card {
        background: white;
        width: 100%;
        max-width: 600px;
        border-radius: 15px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        overflow: hidden;
        animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    /* 標題區 */
    .card-header {
        background-color: #3498db;
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 1.5em;
        font-weight: bold;
    }

    /* 內容區 */
    .card-body {
        padding: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        text-align: left;
        color: #7f8c8d;
        font-size: 0.9em;
        text-transform: uppercase;
        padding: 10px 0;
        border-bottom: 1px solid #f0f0f0;
        width: 30%;
    }

    td {
        padding: 15px 0;
        color: #2c3e50;
        font-weight: 500;
        border-bottom: 1px solid #f0f0f0;
    }

    /* 圖片展示區 */
    .image-container {
        text-align: center;
        padding: 20px 0;
        background: #fafafa;
        border-radius: 8px;
        margin-top: 10px;
    }

    img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.15);
        transition: transform 0.3s ease;
    }
    
    img:hover {
        transform: scale(1.05);
    }

    /* 返回按鈕 */
    .back-link {
        display: block;
        text-align: center;
        margin-top: 20px;
        text-decoration: none;
        color: #3498db;
        font-weight: bold;
        transition: color 0.3s;
    }

    .back-link:hover {
        color: #2980b9;
        text-decoration: underline;
    }
</style>
</head>
<body>

<div class="card">
    <div class="card-header">
        🖼️ 圖片查詢結果
    </div>
    
    <div class="card-body">
        <table>
            <tr>
                <th>圖片編號</th>
                <td>${piVO.imgno}</td>
            </tr>
            <tr>
                <th>商品編號</th>
                <td>${piVO.prodno}</td>
            </tr>
            <tr>
                <th>商品名稱</th>
                <td>${piVO.prodname}</td>
            </tr>
            <tr>
                <th>上傳日期</th>
                <td>${piVO.uploaddate}</td>
            </tr>
            <tr>
                <th style="border:none">商品圖片</th>
                <td style="border:none"></td>
            </tr>
        </table>
        
        <div class="image-container">
            <img src="${pageContext.request.contextPath}/DisplayImage?imgno=${piVO.imgno}" alt="Product Image">
        </div>

        <a class="back-link" href="${pageContext.request.contextPath}/back_end/productimage/select_page.jsp">
            ↩️ 返回查詢首頁
        </a>
    </div>
</div>

</body>
</html>