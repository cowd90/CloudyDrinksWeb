<%@ page
        contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ</title>
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

    <link rel="stylesheet" href="./css/global.css" />
    <link rel="stylesheet" href="./css/home.css" />
</head>
<body>
<div class="page_container">
    <%@include file="./components/header.jsp" %>
    <div class="slide-show_container">
        <div class="slides">
            <div
                    class="banner"
                    style="
              background-image: url('https://gongcha.com.vn/wp-content/uploads/2023/07/cover-web-nha%CC%83n-01-scaled.jpg');
            "
            ></div>
        </div>
        <div class="slides">
            <div
                    class="banner"
                    style="
              background-image: url('https://gongcha.com.vn/wp-content/uploads/2023/10/cover-web-grape-scaled.jpg');
            "
            ></div>
        </div>
        <div class="slides">
            <div
                    class="banner"
                    style="
              background-image: url('https://gongcha.com.vn/wp-content/uploads/2023/06/Cover-web_rainbow-01-1-scaled.jpg');
            "
            ></div>
        </div>

        <button class="prev">❮</button>
        <button class="next">❯</button>

        <div class="slide-control_wrapper">
            <button></button>
            <button></button>
            <button></button>
        </div>
    </div>
    <div class="content_container">
        <div class="list-product_wrapper"></div>
    </div>
</div>

<script src="./javascript/home.js"></script>
</body>
</html>