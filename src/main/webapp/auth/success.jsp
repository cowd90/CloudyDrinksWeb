<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cloudy Drinks</title>
    <style>
        body {
            color: #fff;
            background: #242526;
        }
    </style>
</head>
<body>
    <h1>Đăng ký tài khoản thành công. Vui lòng kiểm tra email để xác thực tài khoản</h1>
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
