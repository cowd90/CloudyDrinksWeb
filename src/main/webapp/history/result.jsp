<%@ page import="database.OrderDAO" %>
<%@ page import="model.Order" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page import="util.TimeFormat" %>
<%@ page import="util.NumberCurrencyFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
<html>

<body>
<%
  Object obj = session.getAttribute("user");
  User user = null;
  if (obj != null) {
    user = (User) obj;
  }

  OrderDAO orderDAO = new OrderDAO();
  ArrayList<Order> orders = orderDAO.selectDelivering(user.getUserId());
  for (Order order : orders) {
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
<script id="root-url" src="<%=url%>/js/history.js" data-url="<%=url%>"></script>
</body>
</html>
|
<html>

<body>
<%
  ArrayList<Order> deliveredOrders = orderDAO.selectDelivered(user.getUserId());
  for (Order order : deliveredOrders) {
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
%>
</body>
</html>
|
<html>

<body>
<%
  ArrayList<Order> cancelItems = orderDAO.selectCancelItems(user.getUserId());
  for (Order order : cancelItems) {
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
%>
</body>
</html>
