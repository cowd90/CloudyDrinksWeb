<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 11/21/2023
  Time: 9:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Okinawa Milk Foam Smoothie - Cloudy Drinks</title>
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

    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/products.css">
</head>
<body>
<div class="page-container">
    <%@include file="../components/header.jsp" %>

    <div class="banner">
        <div class="content_container">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="<%=url%>/categories">Thực đơn</a></li>
                    <li class="breadcrumb-item"><a href="#">Okinawa</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><span>Okinawa Milk Foam Smoothie</span></li>
                </ol>
            </nav>
        </div>
    </div>

    <div class="content_container">
        <div class="product_container row">
            <div class="col-6 d-flex justify-content-center align-items-center">
                <img src="https://gongcha.com.vn/wp-content/uploads/2019/11/Okinawa-Oreo-Cream-Milk-Tea.png"
                     alt="Okinawa Milk Foam Smoothie"
                     class="product-img">
            </div>
            <div class="col-6 py-4">

                <form action="" method="get">
                    <h1 class="product-name mb-3">Okinawa Milk Foam Smoothie</h1>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <p class="product-price" data-prod="68000">68.000 VNĐ</p>
                    </div>
                    <div class="quantity d-flex align-items-center mb-4">
                        <div id="decrease-btn" onclick="plusQuantity(-1)">-</div>
                        <input type="number" id="prod-quantity" name="quantity" value="1" class="d-none">
                        <label for="prod-quantity">1</label>
                        <div id="increase-btn" onclick="plusQuantity(1)">+</div>
                    </div>

                    <div class="mb-3 fw-semibold text-uppercase">Chọn size <span class="text-danger">*</span></div>
                    <div class="product-size_container d-flex flex-wrap gap-3 mb-4">

                        <!-- id của input và for của lable cũng được render từ server dạng size-{biến} | biến có thể là index cũng được -->
                        <!-- Nhớ đổ giá trị vào data-prod -->
                        <input type="radio" name="size" value="0" id="size-s"
                               data-prod="0">
                        <label for="size-s" class="sizeBtn">Nhỏ + 0đ</label>

                        <input type="radio" name="size" value="1" id="size-m"
                               data-prod="5000">
                        <label for="size-m" class="sizeBtn">Vừa + 5.000đ</label>

                        <input type="radio" name="size" value="2" id="size-l"
                               data-prod="10000">
                        <label for="size-l" class="sizeBtn">Lớn + 10.000đ</label>

                    </div>

                    <div class="input-group mb-3">
                        <span class="input-group-text" id="basic-addon1">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="gray" class="bi bi-card-list" viewBox="0 0 16 16">
                              <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"></path>
                              <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"></path>
                            </svg>
                        </span>
                        <input type="text" name="notes" class="form-control lh-lg" maxlength="200"
                               placeholder="Ghi chú thêm cho món này" aria-label="Your notes" aria-describedby="basic-addon1">
                    </div>

                    <button type="submit" class="mt-3">
                        <span id="valueOfOrder"></span>
                        <span>- Thêm vào giỏ hàng</span>
                    </button>
                </form>

            </div>
            <div class="product-desc mb-3">
                <p>Mô tả sản phẩm</p>
                <p class="mx-4">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, atque
                    dicta dolores doloribus hic ipsa ipsam ipsum iure nam nemo possimus quas quia quo quod
                    reprehenderit repudiandae sapiente ullam voluptate.</p>
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2018/03/%E5%B8%83%E4%B8%81-pudding.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Pudding</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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

                        <!--<editor-fold desc="Sample">-->
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('https://gongcha.com.vn/wp-content/uploads/2022/08/THACH-CA-PHE.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Thạch cà phê</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('https://gongcha.com.vn/wp-content/uploads/2018/03/S%C6%B0%C6%A1ng-s%C3%A1o.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Sương Sáo</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('https://gongcha.com.vn/wp-content/uploads/2018/03/Combo-3-lo%E1%BA%A1i-h%E1%BA%A1t.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Combo 3 Loại Hạt</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2018/03/%E5%B8%83%E4%B8%81-pudding.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Pudding</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2018/03/%E5%B8%83%E4%B8%81-pudding.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Pudding</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2018/03/%E5%B8%83%E4%B8%81-pudding.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Pudding</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
                        <div class="product col-4 col-lg-3">
                            <div class="card d-flex align-items-center h-100">
                                <!-- Ảnh sản phẩm -->
                                <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2018/03/%E5%B8%83%E4%B8%81-pudding.png')"
                                     class="card-img-top"></div>
                                <div class="card-body">
                                    <!-- Tên sản phẩm -->
                                    <h5 class="card-title">Pudding</h5>
                                </div>
                                <div class="more-info">
                                    <!-- Đường dẫn đến chi tiết sản phẩm -->
                                    <a href="<%=url%>/products"
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
