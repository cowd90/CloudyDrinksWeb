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
    <title>Error 500</title>
    <link rel="icon" type="image/x-icon" href="https://i.imgur.com/P5Z5eYv.png">

    <% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

    <link rel="stylesheet" href="<%=url%>/css/error.css">
</head>
<body>
<div class="container">
    <div class="title">Oops, something went wrong</div>
    <div class="message">Cloudy Drinks is currently unable to handle this request.</div>
    <div class="error-code">500</div>
</div>
</body>
</html>
