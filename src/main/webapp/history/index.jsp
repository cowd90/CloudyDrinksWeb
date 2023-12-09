<%@ page import="database.*" %>
<%@ page import="util.TimeFormat" %>
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
    <link rel="stylesheet" href="../css/history.css">
</head>
<body>
    <%@include file="../components/header.jsp" %>

    <div class="banner">
        <div class="content_container">
            <div class="title">Quản lý đơn hàng</div>
            <p>Quản lý tình trạng đơn hàng và xem lịch sử giao dịch</p>
        </div>
    </div>

    <div class="content_container">
        <div class="mt-5 mb-3">
            <ul class="nav nav-pills mb-3 gap-2" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="delivering-tab" data-bs-toggle="pill" data-bs-target="#delivering"
                            type="button" role="tab" aria-controls="delivering" aria-selected="true">Đang giao</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="delivered-tab" data-bs-toggle="pill" data-bs-target="#delivered"
                            type="button" role="tab" aria-controls="delivered" aria-selected="false">Đã giao</button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="canceled-tab" data-bs-toggle="pill" data-bs-target="#canceled"
                            type="button" role="tab" aria-controls="canceled" aria-selected="false">Đã hủy</button>
                </li>
            </ul>
            <div class="tab-content">
                <!-- Đang giao -->
                <div class="tab-pane fade show active p-3" id="delivering" role="tabpanel" aria-labelledby="delivering-tab" tabindex="0">
                    <%
                        OrderDAO orderDAO = new OrderDAO();
                        ArrayList<Order> orders = orderDAO.selectDelivering(user.getUserId());
                        for (Order order : orders) {
                    %>
                    <!--<editor-fold desc="Một item của mục đang giao">-->
                    <div class="his_item">
                        <input type="hidden" name="variantId" value="<%=order.getOrderId()%>">
                        <p class="time"><%=TimeFormat.formatTime(order.getTime())%></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <h3 class="name w-75"><%=orderDAO.getProductNameById(order.getProductId())%></h3>
                            <i class="fs-5 fw-bolder w-25 d-flex align-items-center gap-5">
                                <span>(<%=orderDAO.getSizeNameById(order.getSizeId())%>)</span><span>x<%=order.getQuantity()%></span>
                            </i>
                        </div>
                        <div class="contact mb-3 d-flex flex-column gap-2">
                            <p><%=order.getReceiverName()%> - <%=order.getPhoneNumber()%></p>
                            <p><%=order.getAddress()%></p>
                        </div>
                        <div class="fs-5 fw-bolder text-end mb-3">
                            Thành tiền: <span class="total"><%=NumberCurrencyFormat.numberCurrencyFormat(order.getTotalPrice())%>đ</span>
                        </div>

                        <!--<editor-fold desc="Phần .his_item bỏ phần này sẽ là các item của mục đã nhận hoặc đã hủy">-->
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <button class="received main-btn">Đã nhận được hàng</button>
                            <button class="canceled cancel-btn">Hủy đơn hàng</button>
                        </div>
                        <!--</editor-fold>-->

                        <div class="break-line mb-3"></div>
                    </div>
                    <!--</editor-fold>-->
                    <div id="received_dialog-container">
                    </div>
                    <div id="canceled_dialog-container">

                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- Đã giao -->
                <div class="tab-pane fade" id="delivered" role="tabpanel" aria-labelledby="delivered-tab" tabindex="0">
                    <%
                        ArrayList<Order> delivered = orderDAO.selectDelivered(user.getUserId());
                        if (delivered.isEmpty()) {
                    %>
                    <div class="no_data d-flex flex-column justify-content-center align-items-center gap-4">
                        <img src="https://i.imgur.com/K2aCpO0.jpg" alt="No data">
                        <div class="fs-5 fw-bolder">Không có dữ liệu</div>
                    </div>
                    <%
                    } else {
                        for (Order order : delivered) {
                    %>
                    <div class="his_item">
                        <input type="hidden" name="variantId" value="<%=order.getOrderId()%>">
                        <p class="time"><%=TimeFormat.formatTime(order.getTime())%></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <h3 class="name w-75"><%=orderDAO.getProductNameById(order.getProductId())%></h3>
                            <i class="fs-5 fw-bolder w-25 d-flex align-items-center gap-5">
                                <span>(<%=orderDAO.getSizeNameById(order.getSizeId())%>)</span><span>x<%=order.getQuantity()%></span>
                            </i>
                        </div>
                        <div class="contact mb-3 d-flex flex-column gap-2">
                            <p><%=order.getReceiverName()%> - <%=order.getPhoneNumber()%></p>
                            <p><%=order.getAddress()%></p>
                        </div>
                        <div class="fs-5 fw-bolder text-end mb-3">
                            Thành tiền: <span class="total"><%=NumberCurrencyFormat.numberCurrencyFormat(order.getTotalPrice())%>đ</span>
                        </div>

                        <div class="break-line mb-3"></div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
                <!-- Đã hủy -->
                <div class="tab-pane fade" id="canceled" role="tabpanel" aria-labelledby="canceled-tab" tabindex="0">
                    <%
                        ArrayList<Order> cancel = orderDAO.selectCancelItems(user.getUserId());
                        if (cancel.isEmpty()) {
                    %>
                    <div class="no_data d-flex flex-column justify-content-center align-items-center gap-4">
                        <img src="https://i.imgur.com/K2aCpO0.jpg" alt="No data">
                        <div class="fs-5 fw-bolder">Không có dữ liệu</div>
                    </div>
                    <%
                    } else {
                        for (Order order : cancel) {
                    %>
                    <div class="his_item">
                        <input type="hidden" name="variantId" value="<%=order.getOrderId()%>">
                        <p class="time"><%=TimeFormat.formatTime(order.getTime())%></p>
                        <div class="d-flex justify-content-between align-items-center">
                            <h3 class="name w-75"><%=orderDAO.getProductNameById(order.getProductId())%></h3>
                            <i class="fs-5 fw-bolder w-25 d-flex align-items-center gap-5">
                                <span>(<%=orderDAO.getSizeNameById(order.getSizeId())%>)</span><span>x<%=order.getQuantity()%></span>
                            </i>
                        </div>
                        <div class="contact mb-3 d-flex flex-column gap-2">
                            <p><%=order.getReceiverName()%> - <%=order.getPhoneNumber()%></p>
                            <p><%=order.getAddress()%></p>
                        </div>
                        <div class="fs-5 fw-bolder text-end mb-3">
                            Thành tiền: <span class="total"><%=NumberCurrencyFormat.numberCurrencyFormat(order.getTotalPrice())%>đ</span>
                        </div>

                        <div class="break-line mb-3"></div>
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>

    <%@include file="../components/footer.jsp" %>

    <script id="root-url" src="<%=url%>/js/history.js" data-url="<%=url%>"></script>
</body>
</html>
