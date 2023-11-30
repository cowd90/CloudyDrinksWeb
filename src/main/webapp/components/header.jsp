<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<link rel="stylesheet" href="<%=url%>/css/header.css">

<header class="d-flex justify-content-center align-items-center">
    <div class="header_container d-flex justify-content-between align-items-center">
        <button id="expand-list">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5"></path>
            </svg>
        </button>
        <div class="left-header d-flex justify-content-start gap-5 gap-lg-2">
            <div class="logo d-flex justify-content-between justify-content-lg-center align-items-center py-3 py-lg-0 px-4 px-lg-0">
                <a href="<%=url%>">
                    <img src="https://i.imgur.com/P5Z5eYv.png" alt="Cloudy Drinks logo" />
                </a>
                <div id="close-btn" class="hidden">
                    <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
                    </svg>
                </div>
            </div>

            <!-- Menu điều hướng chính -->
            <div class="main-nav_container d-flex justify-content-center">
                <ul class="d-flex align-items-center flex-column flex-lg-row px-3 m-0">
                    <li><a href="<%=url%>">Trang chủ</a></li>
                    <li><a href="">Giới thiệu</a></li>
                    <li id="menu">
                        <a href="<%=url%>/categories/">Thực đơn</a>
                        <div class="more-menu_container sub-nav_container">
                            <div class="more-menu_content sub-nav_content">
                                <div id="h-back-btn" class="hidden d-flex flex-column align-items-center gap-3">
                                    <div class="d-flex w-100 align-items-center justify-content-end gap-3">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-arrow-left-square" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>
                                        </svg>
                                        <span>Back</span>
                                    </div>
                                    <div class="sub-nav_item"><a href="<%=url%>/categories">Tất cả danh mục</a></div>
                                </div>

                                <div class="sub-nav_item"><a href="">Kem</a></div>
                                <div class="sub-nav_item"><a href="">Trà trái cây</a></div>
                                <div class="sub-nav_item"><a href="">Okinawa</a></div>
                                <div class="sub-nav_item"><a href="">Trà nguyên chất</a></div>
                                <div class="sub-nav_item"><a href="">Latte Series</a></div>
                                <div class="sub-nav_item"><a href="">Thức uống đặc biệt Gong Cha</a></div>
                            </div>
                        </div>
                    </li>
                    <li><a href="">Tin tức</a></li>
                </ul>
            </div>
        </div>
        <div class="right-header d-flex justify-content-center">
            <div class="search-bar_container d-flex align-items-center">
                <div class="search-bar">
                    <form action="./handle" method="get" class="d-flex m-0">
                        <input type="text" placeholder="Tìm kiếm sản phẩm" spellcheck="false"
                               name="keyword" class="search-content px-3"/>
                        <button type="submit" class="search-btn btn rounded-0">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                    </form>
                </div>
            </div>

            <!-- Người dùng -->
            <%
                Object obj = session.getAttribute("user");
                User user = null;
                if (obj != null) {
                    user = (User) obj;
                }
                if (user != null) {
            %>

            <div class="user_container d-flex align-items-center">
                <div class="user-acc_wrapper item p-0">
                    <div class="user-icon d-flex align-items-center justify-content-center w-100 h-100">
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="more-menu_container">
                        <ul class="more-menu_content user-acc_content">
                            <li><a href="<%=url%>/auth/">Đăng nhập/Đăng ký</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <% } else { %>

            <!--<editor-fold desc="'Người dùng' đã đăng nhập">-->
            <div class="user_container d-flex align-items-center">
                <div class="user-acc_wrapper item p-0">
                    <div
                            class="user-icon d-flex align-items-center justify-content-center w-100 h-100"
                    >
                        <i class="fa-solid fa-user"></i>
                    </div>
                    <div class="more-menu_container">
                        <ul class="more-menu_content user-acc_content">
                            <li><a href="./auth/">Trang cá nhân</a></li>
                            <li><a href="<%=url%>/user-controller?action=change-password">Đổi mật khẩu</a></li>
                            <li><a href="<%=url%>/user-controller?action=sign-out">Đăng xuất</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--</editor-fold>-->

            <!-- <editor-fold desc="Giỏ hàng"> -->
            <div class="cart_container d-flex align-items-center">
                <div class="cart_wrapper">
                    <i class="fa-solid fa-cart-shopping">
                        <!-- Icon khi giỏ hàng có hàng -->
                        <div class="item-count d-flex justify-content-center align-items-center">
                            !
                        </div>
                    </i>
                    <div class="more-menu_container">
                        <div class="more-menu_content cart-content">

                            <!-- <editor-fold desc="Không có sản phẩm"> -->
                            <div class="no-product">
                                <img src="https://i.imgur.com/WSiKOpQ.png" alt="Giỏ hàng trống"/>
                                <h5>Bạn chưa có sản phẩm nào</h5>
                            </div>
                            <!-- </editor-fold> -->

                            <!-- <editor-fold desc="Một sản phẩm trong giỏ hàng"> -->
                            <div class="product-item row">
                                <div class="col-4">
                                    <img
                                            src="https://gongcha.com.vn/wp-content/uploads/2018/10/kem.png"
                                            alt=""
                                    />
                                </div>
                                <div class="product-info col-6">
                                    <p class="product-name">Kem trà sữa Oolong</p>
                                    <p class="product-price mb-2">30,000 VNĐ</p>
                                </div>
                                <div class="col-2 d-flex align-items-center">
                                    <p class="product_item-count">x1</p>
                                </div>
                            </div>
                            <!-- </editor-fold> -->
                            <!-- <editor-fold desc="Một sản phẩm trong giỏ hàng"> -->
                            <div class="product-item row">
                                <div class="col-4">
                                    <img
                                            src="https://gongcha.com.vn/wp-content/uploads/2018/02/Chanh-Aiyu-tr%C3%A2n-ch%C3%A2u-tr%E1%BA%AFng-2.png"
                                            alt=""
                                    />
                                </div>
                                <div class="product-info col-6">
                                    <p class="product-name">
                                        Chanh Ai-yu và Trân Châu Trắng <span>(L)</span>
                                    </p>
                                    <p class="product-price mb-2">60,000 VNĐ</p>
                                </div>
                                <div class="col-2 d-flex align-items-center">
                                    <p class="product_item-count">x1</p>
                                </div>
                            </div>
                            <!-- </editor-fold> -->

                            <!--<editor-fold desc="Đi đến giỏ hàng">-->
                            <div class="go-to-cart_wrapper">
                                <a href="<%=url%>/cart">Xem tất cả <span>(3)</span> trong giỏ hàng</a>
                            </div>
                            <!--</editor-fold>-->
                        </div>
                    </div>
                </div>
            </div>
            <!-- </editor-fold> -->

            <% } %>

            <!-- Các nút chuyển theme -->
            <div class="mode_container d-flex align-items-center">
                <div class="change-mode" onclick="toggleDarkTheme()">
                    <div class="dark-theme_icon item">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="18"
                                height="18"
                                fill="currentColor"
                                class="bi bi-moon-stars-fill"
                                viewBox="0 0 16 16"
                        >
                            <path
                                    d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"></path>
                            <path
                                    d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"></path>
                        </svg>
                    </div>
                    <div class="light-theme_icon item">
                        <svg
                                xmlns="http://www.w3.org/2000/svg"
                                width="18"
                                height="18"
                                fill="currentColor"
                                class="bi bi-brightness-high-fill"
                                viewBox="0 0 16 16"
                        >
                            <path
                                    d="M12 8a4 4 0 1 1-8 0 4 4 0 0 1 8 0zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"></path>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<div id="layer" class="hidden"></div>

<script src="<%=url%>/js/header.js"></script>
