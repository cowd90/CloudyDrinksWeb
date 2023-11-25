<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 11/24/2023
  Time: 7:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Giỏ hàng - Cloudy Drinks</title>
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
    <link rel="stylesheet" href="../css/cart.css">

</head>
<body>
    <%@include file="../components/header.jsp" %>

    <div class="banner"></div>

    <div class="content_container">
        <div class="page-title">Giỏ hàng
            <span class="card-quantity">(3 sản phẩm)</span>
        </div>
        <div class="page-cart_container row">
            <div class="cart-item row col-9">
                <div class="col-4">
                    <img class="cart-img"
                         src="https://gongcha.com.vn/wp-content/uploads/2023/10/TRA-SUA-NHO.png" alt="">
                </div>
                <div class="col-5 my-4">
                    <div class="cart-item_name">Grape Milk Tea</div>
                    <div>Size: <span>Vừa</span></div>
                    <div>Giá</div>
                    <div>Ghi chú thêm</div>
                </div>
            </div>
            <div class="cart-control col-3">
                Thanh toán ngay
            </div>
        </div>
    </div>

    <script src="<%=url%>/js/cart.js"></script>
</body>
</html>
