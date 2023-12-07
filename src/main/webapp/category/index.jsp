<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 12/6/2023
  Time: 8:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Trà trái cây | Cloudy Drinks</title>
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

    <link rel="stylesheet" href="../css/global.css" />
    <link rel="stylesheet" href="../css/category.css" />
</head>
<body>



<%@include file="../components/header.jsp" %>

<div class="banner">
    <div class="content_container">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="<%=url%>/categories">Thực đơn</a></li>
                <li class="breadcrumb-item active" aria-current="page"><span>Trà trái cây</span></li>
            </ol>
        </nav>
    </div>
</div>

<div class="content_container">
    <div class="content_wrapper">

        <!--<editor-fold desc="Render danh mục">-->
        <div class="category-item mt-3">
            <!-- Tên danh mục -->
            <div class="title">Trà trái cây</div>
            <div class="products_container row">

                <!--<editor-fold desc="Render Sản phẩm">-->
                <div class="product col-6 col-md-4">
                    <div class="card m-md-0 mx-sm-4 mx-2">
                        <!-- Ảnh sản phẩm -->
                        <img src="https://gongcha.com.vn/wp-content/uploads/2018/10/kem-tc.png"
                             class="card-img-top" alt="Kem trà sữa và trân châu đen">
                        <div class="card-body">
                            <!-- Tên sản phẩm -->
                            <h5 class="card-title">Kem Trà Sữa & Trân Châu Đen</h5>
                        </div>
                        <div class="more-info">
                            <!-- Đường dẫn đến chi tiết sản phẩm -->
                            <a href="<%=url%>/products"
                               class="product-link d-flex align-items-center justify-content-center flex-column">
                                <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"></path>
                                </svg>
                                <p>Xem chi tiết</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!--</editor-fold>-->

                <!--<editor-fold desc="Render Sản phẩm">-->
                <div class="product col-6 col-md-4">
                    <div class="card m-md-0 mx-sm-4 mx-2">
                        <!-- Ảnh sản phẩm -->
                        <img src="https://gongcha.com.vn/wp-content/uploads/2021/03/ALISAN-TRA%CC%81I-CA%CC%82Y.png" class="card-img-top" alt="Kem trà sữa và trân châu đen">
                        <div class="card-body">
                            <!-- Tên sản phẩm -->
                            <h5 class="card-title">Kem Trà Sữa & Trân Châu Đen</h5>
                        </div>
                        <div class="more-info">
                            <!-- Đường dẫn đến chi tiết sản phẩm -->
                            <a href="<%=url%>/products"
                               class="product-link d-flex align-items-center justify-content-center flex-column">
                                <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"></path>
                                </svg>
                                <p>Xem chi tiết</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!--</editor-fold>--><!--<editor-fold desc="Render Sản phẩm">-->
                <div class="product col-6 col-md-4">
                    <div class="card m-md-0 mx-sm-4 mx-2">
                        <!-- Ảnh sản phẩm -->
                        <img src="https://gongcha.com.vn/wp-content/uploads/2018/10/kem-tc.png" class="card-img-top" alt="Kem trà sữa và trân châu đen">
                        <div class="card-body">
                            <!-- Tên sản phẩm -->
                            <h5 class="card-title">Kem Trà Sữa & Trân Châu Đen</h5>
                        </div>
                        <div class="more-info">
                            <!-- Đường dẫn đến chi tiết sản phẩm -->
                            <a href="<%=url%>/products"
                               class="product-link d-flex align-items-center justify-content-center flex-column">
                                <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"></path>
                                </svg>
                                <p>Xem chi tiết</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!--</editor-fold>--><!--<editor-fold desc="Render Sản phẩm">-->
                <div class="product col-6 col-md-4">
                    <div class="card m-md-0 mx-sm-4 mx-2">
                        <!-- Ảnh sản phẩm -->
                        <img src="https://gongcha.com.vn/wp-content/uploads/2018/10/kem-tc.png" class="card-img-top" alt="Kem trà sữa và trân châu đen">
                        <div class="card-body">
                            <!-- Tên sản phẩm -->
                            <h5 class="card-title">Kem Trà Sữa & Trân Châu Đen</h5>
                        </div>
                        <div class="more-info">
                            <!-- Đường dẫn đến chi tiết sản phẩm -->
                            <a href="<%=url%>/products"
                               class="product-link d-flex align-items-center justify-content-center flex-column">
                                <svg xmlns="http://www.w3.org/2000/svg" width="96" height="96" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"></path>
                                </svg>
                                <p>Xem chi tiết</p>
                            </a>
                        </div>
                    </div>
                </div>
                <!--</editor-fold>-->

            </div>
        </div>
        <!--</editor-fold>-->

    </div>
</div>

<%@include file="../components/footer.jsp" %>

</body>
</html>