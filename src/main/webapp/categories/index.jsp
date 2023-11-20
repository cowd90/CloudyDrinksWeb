<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 11/20/2023
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh mục</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="../css/global.css" />
    <link rel="stylesheet" href="../css/categories.css" />
</head>
<body>
<div class="page-container">
    <%@include file="../components/header.jsp" %>

    <div class="banner">
        <div class="content_container">
            <div class="title">Menu hiện tại</div>
            <p>Giới thiệu thức uống hấp dẫn và đa dạng từ Gong Cha</p>
        </div>
    </div>
    <div class="content_container">
        <div class="content_wrapper"></div>
    </div>
</div>
</body>
</html>
