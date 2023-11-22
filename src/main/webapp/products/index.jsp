<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 11/21/2023
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Okinawa Milk Foam Smoothie - Cloudy Drinks</title>
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

    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/products.css">
</head>
<body>
<div class="page-container">
    <%@include file="../components/header.jsp" %>

    <div class="banner">
        <div class="content_container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=url%>/categories">Thực đơn</a></li>
                    <li class="breadcrumb-item"><a href="#">Okinawa</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><span>Okinawa Milk Foam Smoothie</span></li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="content_container">
        <div class="product_container row">
            <div class="col-6 d-flex justify-content-center align-items-center">
                <img src="https://gongcha.com.vn/wp-content/uploads/2019/11/Okinawa-Oreo-Cream-Milk-Tea.png"
                     alt="Okinawa Milk Foam Smoothie"
                     class="product-img">
            </div>
            <div class="col-6 py-4">
                <form action="" method="get">
                    <h1 class="product-name mb-3">Okinawa Milk Foam Smoothie</h1>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <p class="product-price" data-prod="68000">68.000 VNĐ</p>
                    </div>
                    <div class="quantity d-flex align-items-center mb-5">
                        <div id="increase-btn" onclick="plusQuantity(-1)">-</div>
                        <input type="number" id="prod-quantity" name="quantity" value="1" class="d-none">
                        <label for="prod-quantity">1</label>
                        <div id="decrease-btn" onclick="plusQuantity(1)">+</div>
                    </div>
                    <div class="mb-3">Chọn size (bắt buộc)</div>
                    <div class="product-size_container d-flex flex-wrap gap-3 mb-5">
                        <input type="radio" name="size" value="0" id="size-s" data-prod="0">
                        <label for="size-s" class="sizeBtn">Nhỏ + 0đ</label>
                        <input type="radio" name="size" value="1" id="size-m" data-prod="5000">
                        <label for="size-m" class="sizeBtn">Vừa + 5.000đ</label>
                        <input type="radio" name="size" value="2" id="size-l" data-prod="10000">
                        <label for="size-l" class="sizeBtn">Lớn + 10.000đ</label>
                    </div>
                    <button type="submit" class="mt-3">
                        <span id="valueOfOrder"></span>
                        <span>- Thêm vào giỏ hàng</span>
                    </button>
                </form>

            </div>
            <div class="product-desc">
                <p>Mô tả sản phẩm</p>
                <p class="mx-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, atque
                    dicta dolores doloribus hic ipsa ipsam ipsum iure nam nemo possimus quas quia quo quod
                    reprehenderit repudiandae sapiente ullam voluptate.</p>
            </div>
        </div>
    </div>
</div>

<script src="<%=url%>/js/products.js"></script>
</body>
</html>
