<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Category" %>
<%@ page import="database.CategoryDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Product" %>
<%@ page import="database.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Danh mục</title>
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

    <% String newUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

    <link rel="stylesheet" href="<%=newUrl%>/css/global.css" />
    <link rel="stylesheet" href="<%=newUrl%>/css/categories.css" />
</head>
<body>
<div class="page-container">
    <%@include file="../components/header.jsp" %>

    <div class="banner">
        <div class="content_container">
            <div class="title">Menu hiện tại</div>
            <p>Giới thiệu thức uống hấp dẫn và đa dạng từ Gong Cha</p>
        </div>
    </div>
    <div class="menu-nav_container">
        <div class="content_container">
            <div class="menu-nav_inner">

                <ul class="nav">
                    <%
                        for (Category category : categories) {
                    %>
                    <li><a href="#<%=category.getCatName()%>"><%=category.getCatName()%></a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </div>
    <div class="content_container">
        <div class="content_wrapper">

            <!--<editor-fold desc="Render danh mục">-->
            <%
                for (Category category : categories) {
            %>
            <div id="<%=category.getCatName()%>" class="category-item">
                <!-- Tên danh mục -->
                <div class="title"><%=category.getCatName()%></div>
                <div class="products_container row">
                    <!--<editor-fold desc="Render Sản phẩm">-->
                    <%
                    ProductDAO productDAO = new ProductDAO();
                    ArrayList<Product> products = productDAO.selectByCatId(String.valueOf(category.getCatId()));
                    for (Product product : products) {
                    %>
                    <div class="product col-4">
                        <div class="card">
                            <!-- Ảnh sản phẩm -->
                            <img src="<%=product.getProductImage()%>" class="card-img-top" alt="<%=product.getProductName()%>">
                            <div class="card-body">
                                <!-- Tên sản phẩm -->
                                <h5 class="card-title"><%=product.getProductName()%></h5>
                            </div>
                            <div class="more-info">
                                <!-- Đường dẫn đến chi tiết sản phẩm -->
                                <a href="<%=url%>/product-controller?pid=<%=product.getProductId()%>"
                                   class="product-link d-flex align-items-center justify-content-center flex-column">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"></path>
                                    </svg>
                                    <p>Xem chi tiết</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <%
                }
            %>
            <!--</editor-fold>-->

        </div>
    </div>
</div>

<script src="<%=url%>/js/categories.js"></script>
</body>
</html>
