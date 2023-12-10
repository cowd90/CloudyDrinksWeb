<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Cloudy Drinks</title>
  <style>
    body {
      color: #fff;
      background: #242526;
    }
  </style>
</head>
<body>
  <h1 class="container"><%= request.getAttribute("notifications")+"" %></h1>
  <h2>Bạn sẽ quay về trang đăng nhập sau <span id="count-down"></span>s</h2>
  <script type="text/javascript">
    let countDown = document.querySelector("#count-down");
    let timeOut = {
      value: 5,
    };
    countDown.innerText = timeOut.value;
    setInterval(() => {
      timeOut.value--;
      countDown.innerText = timeOut.value;
    }, 1000);
    setTimeout(function() {
      window.location.href = "auth/index.jsp";
    }, 5000);
  </script>
</body>
</html>