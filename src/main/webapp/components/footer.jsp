<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String furl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<link rel="stylesheet" href="<%=furl%>/css/footer.css">

<footer>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-9"></div>
    </div>
</footer>
