<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Giỏ hàng | Cloudy Drinks</title>
    <link rel="icon" type="image/x-icon" href="https://i.imgur.com/P5Z5eYv.png">
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

    <%
        CartDAO cartDAO = new CartDAO();
        ArrayList<Cart> cartList = cartDAO.selectAllItem(user.getUserId());
        int itemQuantity = 0;
        for (Cart cart : cartList) {
            itemQuantity += cart.getQuantity();
        }
    %>

    <div id="cart-field" class="content_container">
        <div class="page-title">Giỏ hàng
            <span class="card-quantity">(<%=itemQuantity%> sản phẩm)</span>
        </div>
        <div class="page-cart-container row">
            <div class="col-12 col-lg-9">

                <%
                    int total = 0;
                    if (!cartDAO.checkIfUserHasCart(user.getUserId())) {
                %>
                <!-- Khi giỏ hàng không có sản phẩm -->
                <div class="no-product">
                    <img class="w-100 h-100 object-fit-contain"
                         src="https://i.imgur.com/WSiKOpQ.png" alt="Không có sản phẩm trong giỏ hàng">
                    <h5 class="text-center">Bạn chưa có sản phẩm nào</h5>
                </div>
                <%
                } else {
                    for (Cart cart : cartList) {
                        Product p = new ProductDAO().selectById(cart.getProductId() + "");
                        Size s = new SizeDAO().selectById(cart.getSizeId() + "");
                        total += cart.getTotalPrice();
                %>
                <div class="cart-item row my-3">
                    <div class="col-3">
                        <img class="cart-img"
                             src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
                    </div>
                    <div class="cart-item_info col-6 my-4">
                        <input type="hidden" name="variantId" value="<%=cart.getCartId()%>">
                        <div class="mb-3 d-flex justify-content-between align-items-center">
                            <span class="name"><%=p.getProductName()%></span>
                            <span class="fst-italic fs-5">x<span class="quantity"><%=cart.getQuantity()%></span></span>
                        </div>
                        <%
                            if (s != null) {
                        %>
                        <p class="mb-2"><span>Size: </span><span class="size"><%=s.getSizeName()%></span></p>
                        <%
                            }
                        %>
                        <p class="mb-2"><span>Giá: </span><span>
                        <%=NumberCurrencyFormat.numberCurrencyFormat(cart.getTotalPrice())%>đ</span></p>
                        <p class="mb-2"><span>Ghi chú thêm: </span><span class="desc">
                        <%=(cart.getNote().trim().equals("")) ? "Không có" : cart.getNote()%></span></p>
                    </div>
                    <div class="user-action col-3 d-flex flex-column justify-content-center align-items-center gap-3">
                        <button class="change_info-btn border-0">Thay đổi thông tin</button>
                        <button type="submit" id="remove-item" class="border-0">Xóa khỏi giỏ hàng</button>
                    </div>
                </div>
                <div class="break-line"></div>

                <%
                        }
                    }
                %>
            </div>
            <div class="col-12 col-lg-3">
                <div class="cart-control row pt-3">
                    <div class="col-4 col-lg-12 mb-3">
                        <a href="<%=url%>/categories" class="link d-flex align-items-center fw-bolder">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-bar-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M12.5 15a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5M10 8a.5.5 0 0 1-.5.5H3.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L3.707 7.5H9.5a.5.5 0 0 1 .5.5"></path>
                            </svg>
                            <span> Tiếp tục mua hàng</span></a>
                    </div>
                    <div class="d-flex flex-column gap-3 col-8 col-lg-12">
                        <div>
                            <div class="fs-5 fw-bolder">Thành tiền:</div>
                            <div id="valueOfCart"><%=NumberCurrencyFormat.numberCurrencyFormat(total)%>đ</div>
                        </div>
                        <a href="<%=url%>/checkout" class="main-btn">Thanh toán ngay</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="change_cart_info-container">

    </div>

    <%@include file="../components/footer.jsp" %>
    <script id="change-cart-url" src="<%=url%>/js/cart.js" data-url="<%=url%>"></script>
</body>
</html>
