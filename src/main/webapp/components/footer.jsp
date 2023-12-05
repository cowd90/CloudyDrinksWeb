<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 12/3/2023
  Time: 8:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String furl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<link rel="stylesheet" href="<%=furl%>/css/footer.css">

<footer class="overflow-hidden">
    <div class="content_container row">
        <div class="left col-lg-3 text-center text-lg-end text-white py-xl-5 pe-xl-3">
            <div class="brand fs-2">Cloudy Drinks</div>
            <div class="sub-text">Dự án cuối kỳ cho môn Phát triển ứng dụng web</div>
        </div>
        <div class="right col-lg-9 p-xl-5">
            <ul class="d-flex justify-content-start align-items-center">
                <li><a class="link" href="<%=furl%>/">Trang chủ</a></li>
                <li><a class="link" href="<%=furl%>/">Giới thiệu</a></li>
                <li><a class="link" href="<%=furl%>/categories">Thực đơn</a></li>
                <li><a class="link" href="<%=furl%>/news">Tin tức</a></li>
            </ul>
        </div>
    </div>
</footer>
