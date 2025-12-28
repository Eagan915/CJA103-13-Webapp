<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Image - 修改圖片資料</title>
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
        max-width: 600px;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        overflow: hidden;
    }
    .card-header {
        background-color: #f39c12; /* 編輯專用橘色 */
        color: white;
        padding: 20px;
        text-align: center;
        font-size: 1.4em;
        font-weight: bold;
    }
    .card-body {
        padding: 30px;
    }
    
    /* 資訊展示區 */
    .info-section {
        background-color: #fffaf0;
        border: 1px solid #f9e3b4;
        border-radius: 8px;
        padding: 15px;
        margin-bottom: 25px;
    }
    .info-item {
        margin-bottom: 8px;
        color: #555;
        font-size: 0.95em;
    }
    .info-item b {
        color: #2c3e50;
        display: inline-block;
        width: 100px;
    }

    /* 圖片對比區 */
    .preview-section {
        text-align: center;
        margin-bottom: 25px;
    }
    .preview-label {
        display: block;
        margin-bottom: 10px;
        font-weight: 600;
        color: #7f8c8d;
    }
    .current-img {
        max-width: 200px;
        border-radius: 8px;
        border: 3px solid #fff;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    /* 表單區 */
    .upload-group {
        border-top: 1px solid #eee;
        padding-top: 20px;
    }
    label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
        color: #2c3e50;
    }
    input[type="file"] {
        width: 100%;
        padding: 10px;
        background: #f9f9f9;
        border: 1px dashed #f39c12;
        border-radius: 6px;
        margin-bottom: 20px;
    }
    input[type="submit"] {
        width: 100%;
        background-color: #f39c12;
        color: white;
        border: none;
        padding: 12px;
        border-radius: 6px;
        font-size: 1.1em;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s;
    }
    input[type="submit"]:hover {
        background-color: #d68910;
    }

    .error-box {
        background-color: #fff5f5;
        border-left: 5px solid #ff4d4d;
        padding: 12px;
        margin-bottom: 20px;
        border-radius: 4px;
        color: #d63031;
    }
    .footer-links {
        text-align: center;
        margin-top: 20px;
    }
    .back-btn {
        text-decoration: none;
        color: #7f8c8d;
        font-size: 0.9em;
    }
    .back-btn:hover { color: #2c3e50; }
</style>
</head>
<body>

<div class="card">
    <div class="card-header">📝 更新圖片資料</div>
    
    <div class="card-body">
        <c:if test="${not empty errorMsgs}">
            <div class="error-box">
                <strong>⚠️ 請修正以下錯誤：</strong>
                <ul style="margin: 5px 0; padding-left: 20px;">
                    <c:forEach var="message" items="${errorMsgs}">
                        <li>${message}</li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <div class="info-section">
            <div class="info-item"><b>圖片編號：</b> ${piVO.imgno}</div>
            <div class="info-item"><b>商品編號：</b> ${piVO.prodno}</div>
            <div class="info-item"><b>商品名稱：</b> ${piVO.prodname}</div>
            <div class="info-item"><b>上傳時間：</b> ${piVO.uploaddate}</div>
        </div>

        <div class="preview-section">
            <span class="preview-label">目前使用的圖片</span>
            <img src="${pageContext.request.contextPath}/DisplayImage?imgno=${piVO.imgno}" class="current-img">
        </div>

        <form method="post" action="${pageContext.request.contextPath}/ProductImage" enctype="multipart/form-data">
            <div class="upload-group">
                <label for="upfile">🔄 重新選擇圖片（不選則保留原圖）</label>
                <input type="file" name="upfile" id="upfile" accept="image/*">
            </div>

            <input type="hidden" name="imgno" value="${piVO.imgno}">
            <input type="hidden" name="prodno" value="${piVO.prodno}">
            <input type="hidden" name="prodname" value="${piVO.prodname}">
            <input type="hidden" name="action" value="update">
            
            <input type="submit" value="💾 儲存修改內容">
        </form>

        <div class="footer-links">
            <a href="${pageContext.request.contextPath}/ProductImage?action=getAll" class="back-btn">↩️ 放棄修改，返回列表</a>
        </div>
    </div>
</div>

</body>
</html>