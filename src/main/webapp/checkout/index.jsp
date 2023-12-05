<%@ page import="database.CartDAO" %>
<%@ page import="model.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="model.Product" %>
<%@ page import="database.SizeDAO" %>
<%@ page import="model.Size" %>
<%@ page import="database.ProductDAO" %>
<%@ page import="util.NumberCurrencyFormat" %><%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 12/2/2023
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thanh toán đơn hàng | Cloudy Drinks</title>
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
    <link rel="stylesheet" href="../css/checkout.css">
</head>
<body>
    <div class="content_container">
        <h1 class="brand py-3 text-center">Cloudy Drinks</h1>
        <div class="row">
            <div class="col-md-8 order-2 order-md-1 row justify-content-center">
                <!-- FORM  /?name=&phoneNumber=&district=&ward=&address=-->
                <form action="" method="get" id="checkoutInfo" class="col-12 col-md-6 m-0">
                    <section id="contact_container">
                        <div class="fs-5 fw-bolder d-flex align-items-center gap-2 mb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-card-heading" viewBox="0 0 16 16">
                                <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"></path>
                                <path d="M3 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m0-5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"></path>
                            </svg>
                            Thông tin nhận hàng
                        </div>
                        <div class="">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="name" name="name" placeholder="">
                                <label for="name">Họ tên người nhận</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="">
                                <label for="phoneNumber">Số điện thoại</label>
                            </div>
                            <div class="lock mb-3">TP Hồ Chí Minh</div>
                            <div class="mb-3">
                                <select class="form-select mb-3" id="district" name="district">
                                    <option value="" selected>Chọn Quận / Huyện</option>
                                </select>

                                <select class="form-select" id="ward" name="ward">
                                    <option value="" selected>Chọn Phường / Xã</option>
                                </select>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="address" name="address" placeholder="">
                                <label for="address">Số nhà, tên đường</label>
                            </div>
                        </div>

                    </section>
                </form>
                <div class="col-12 col-md-6">
                    <section>
                        <div class="fs-5 fw-bolder d-flex align-items-center gap-2 mb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                                <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"></path>
                            </svg>
                            Vận chuyển
                        </div>
                        <div class="lock">
                            Miễn phí vận chuyển
                        </div>
                    </section>
                    <section>
                        <div class="fs-5 fw-bolder d-flex align-items-center gap-2 mb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-credit-card-2-front" viewBox="0 0 16 16">
                                <path d="M14 3a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2z"></path>
                                <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5"></path>
                            </svg>
                            Phương thức thanh toán
                        </div>
                        <div class="lock">
                            Thanh toán khi giao hàng (COD)
                        </div>
                    </section>
                </div>

                <div class="row align-items-center gap-3 gap-md-0">
                    <div class="text-end mb-3 mb-md-0 d-flex d-md-block justify-content-center order-2 order-md-1 col-12 col-md-6">
                        <a href="../cart" class=" link fw-bolder">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-bar-left" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M12.5 15a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5M10 8a.5.5 0 0 1-.5.5H3.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L3.707 7.5H9.5a.5.5 0 0 1 .5.5"></path>
                            </svg>
                            <span> Quay về giỏ hàng</span></a>
                    </div>
                    <div class="d-flex justify-content-end order-1 col-12 col-md-6">
                        <button type="submit" form="checkoutInfo" class="main-btn">Đặt hàng</button>
                    </div>
                </div>

            </div>
            <div class="col-md-4 order-1 mb-3 border-2 border-bottom border-dark-subtle">
                <div class="d-flex mb-3">
                    <div class="pointer d-flex align-items-center gap-3" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        <div class="order-title">Đơn hàng
                            <%
                                Object obj = session.getAttribute("user");
                                User user = null;
                                if (obj != null) {
                                    user = (User) obj;
                                }

                                CartDAO cartDAO = new CartDAO();
                                ArrayList<Cart> cartList = cartDAO.selectAllItem(user.getUserId());
                                int itemQuantity = 0;
                                for (Cart cart : cartList) {
                                    itemQuantity += cart.getQuantity();
                                }
                            %>
                            <span class="card-quantity">(<%=itemQuantity%> sản phẩm)</span>
                        </div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-caret-down" viewBox="0 0 16 16">
                            <path d="M3.204 5h9.592L8 10.481 3.204 5zm-.753.659 4.796 5.48a1 1 0 0 0 1.506 0l4.796-5.48c.566-.647.106-1.659-.753-1.659H3.204a1 1 0 0 0-.753 1.659z"></path>
                        </svg>
                    </div>
                </div>
                <div class="collapse show py-3" id="collapseExample">
                    <div id="cart-container" class="mb-2">
                        <%
                            int total = 0;
                            for (Cart cart : cartList) {
                                Product p = new ProductDAO().selectById(cart.getProductId() + "");
                                Size s = new SizeDAO().selectById(cart.getSizeId() + "");
                                total += cart.getTotalPrice();
                        %>
                        <div class="item row pb-1">
                            <div class="col-3">
                                <img class="img"
                                     src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
                            </div>
                            <div class="item_info col-6">
                                <p class="name"><%=p.getProductName()%></p>
                                <p class="d-flex justify-content-between align-items-center">
                                    <span>(<%=s.getSizeName()%>)</span>
                                    <span class="fst-italic">x<%=cart.getQuantity()%></span>
                                </p>
                                <p><%=NumberCurrencyFormat.numberCurrencyFormat(p.getPrice()+s.getUpSizePrice())%>đ</p>
                            </div>
                            <div class="col-3 d-flex align-items-center">
                                <%=NumberCurrencyFormat.numberCurrencyFormat(cart.getTotalPrice())%>đ
                            </div>
                        </div>
                        <div class="break-line mb-1"></div>
                        <%
                            }
                        %>
                    </div>
                    <div class="order-control">
                        <div class="d-flex flex-column gap-3">
                            <div>
                                <div class="fs-5 fw-bolder">Tổng tiền:</div>
                                <div id="valueOfCart"><%=NumberCurrencyFormat.numberCurrencyFormat(total)%>đ</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/checkout.js"></script>
</body>
</html>
