<%@ page import="model.Product" %>
<%@ page import="database.ProductDAO" %>
<%@ page import="util.NumberCurrencyFormat" %>
<%@ page import="model.Size" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        Object pObj = request.getAttribute("product");
        Product product = (Product) pObj;
        ProductDAO productDAO = new ProductDAO();
        ArrayList<Size> sizes = productDAO.getSizesByProductId(product.getProductId());
        String catName = productDAO.getCatNameById(product.getProductId());
    %>

    <title><%=product.getProductName()%> - Cloudy Drinks</title>
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
    <link rel="stylesheet" href="<%=newUrl%>/css/global.css">
    <link rel="stylesheet" href="<%=newUrl%>/css/products.css">
</head>
<body>
<div class="page-container">
    <%@include file="../components/header.jsp"%>
    <div class="banner">
        <div class="content_container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=url%>/categories">Thực đơn</a></li>
                    <li class="breadcrumb-item"><a href="#"><%=catName%></a></li>
                    <li class="breadcrumb-item active" aria-current="page"><span><%=product.getProductName()%></span></li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="content_container">
        <div class="product_container row">
            <div class="col-6 d-flex justify-content-center align-items-center">
                <img src="<%=product.getProductImage()%>"
                     alt="<%=product.getProductName()%>"
                     class="product-img">
            </div>
            <div class="col-6 py-4">

                <form action="<%=url%>/cart-controller?pid=<%=product.getProductId()%>" method="post">
                    <h1 class="product-name mb-3"><%=product.getProductName()%></h1>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <p class="product-price" data-prod="<%=product.getPrice()%>"><%=NumberCurrencyFormat.numberCurrencyFormat(product.getPrice()+"")%> VNĐ</p>
                    </div>
                    <div class="quantity d-flex align-items-center mb-5">
                        <div id="decrease-btn" onclick="plusQuantity(-1)">-</div>
                        <input type="number" id="prod-quantity" name="quantity" value="1" class="d-none">
                        <label for="prod-quantity">1</label>
                        <div id="increase-btn" onclick="plusQuantity(1)">+</div>

                    </div>
                    <div class="mb-3">Chọn size (bắt buộc)</div>
                    <div class="product-size_container d-flex flex-wrap gap-3 mb-5">

                        <!-- id của input và for của label cũng được render từ server dạng size-{biến} | biến có thể là index cũng được -->
                        <!-- Nhớ đổ giá trị vào data-prod -->

                        <%
                            for (Size size : sizes) {
                        %>
                        <input type="radio" name="size" value="<%=size.getSizeId()%>" id="size-<%=size.getSizeId()%>"
                               data-prod="<%=size.getUpSizePrice()%>">
                        <label for="size-<%=size.getSizeId()%>" class="sizeBtn"><%=size.getSizeName()%> + <%=NumberCurrencyFormat.numberCurrencyFormat(size.getUpSizePrice()+"")%>đ</label>
                        <%
                            }
                        %>

                    </div>
                    <button type="submit" class="mt-3">
                        <span id="valueOfOrder"></span>
                        <span>- Thêm vào giỏ hàng</span>
                    </button>
                </form>

            </div>
            <div class="product-desc mb-3">
                <p>Mô tả sản phẩm</p>
                <p class="mx-4 fst-italic"><%=(product.getProductDesc() == null) ? "Sản phẩm không có mô tả" : product.getProductDesc()%></p>
            </div>
            <div class="break-line"></div>
            <div class="suggestion my-3">
                <div class="suggestion-title">
                    Thêm topping cho sản phẩm
                </div>
                <div class="products_container">
                    <button id="prev-sug" onclick="scrollSuggestion(-1)">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                             class="bi bi-chevron-left" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"></path>
                        </svg>
                    </button>
                    <button id="next-sug" onclick="scrollSuggestion(1)">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor"
                             class="bi bi-chevron-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"></path>
                        </svg>
                    </button>

                    <!--<editor-fold desc="Render một sản phẩm topping">-->
                    <div class="products_wrapper row flex-nowrap overflow-x-hidden mx-0">
                        <!--<editor-fold desc="Sample">-->
                        <%
                            ArrayList<Product> products = productDAO.selectAll();
                            for (Product p : products) {
                                if (p.getCatId() == 7) {
                        %>
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url(<%=p.getProductImage()%>)"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title"><%=p.getProductName()%></h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/product-controller?pid=<%=p.getProductId()%>"
                                       class="product-link d-flex align-items-center justify-content-center flex-column">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="currentColor"
                                             class="bi bi-plus-lg" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd"
                                                  d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"></path>
                                        </svg>
                                        <p>Xem chi tiết</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                        <!--</editor-fold>-->
                    </div>
                    <!--</editor-fold>-->
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=url%>/js/products.js"></script>
</body>
</html>
