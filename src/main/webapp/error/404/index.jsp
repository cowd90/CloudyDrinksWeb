<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 12/10/2023
  Time: 1:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Error 404</title>
    <link rel="icon" type="image/x-icon" href="https://i.imgur.com/P5Z5eYv.png">

    <% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

    <link rel="stylesheet" href="<%=url%>/css/error.css">
</head>
<body>
    <div class="container">
        <div class="title">Uh-oh...</div>
        <div class="message">The page you are looking for may have been moved, deleted, or possibly never existed.</div>
        <div class="error-code">404</div>
    </div>
</body>
</html>
