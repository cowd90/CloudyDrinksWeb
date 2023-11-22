<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>

<style type="text/css">

    header {
        position: relative;
        background: #fff;
        transition: top linear 0.15s;
    }

    header.float {
        position: fixed;
        top: 0;
        left: 0;
        width: 100vw;
        z-index: 99;
    }

    header.hidden {
        top: -151px;
    }

    header .header_container {
        height: 90px;
        width: 100%;
        max-width: 1200px;
        padding: 0 1rem;
    }

    header .header_container .more-menu_container {
        visibility: hidden;
        position: absolute;
        top: 100%;
        left: 50%;
        transform: translateX(-50%);
        padding-top: 12px;
        opacity: 0;
        z-index: 99;
        transition: all linear 0.3s;
    }

    header .header_container .more-menu_container .more-menu_content {
        list-style: none;
        background: var(--background-color_light-theme);
        padding: 20px;
        border-bottom: 3px solid var(--main-color);
        border-radius: 4px 4px 0 0;
        box-shadow: 0 4px 12px 2px rgba(0, 0, 0, 0.3);
    }

    .logo img {
        padding: 5px;
        width: 90px;
        height: 90px;
    }

    /* <editor-fold desc="Menu điều hướng"> */
    .main-nav_container {
        position: relative;
    }

    .main-nav_container > ul {
        list-style: none;
        font-size: 1rem;
    }

    .main-nav_container > ul > li {
        position: relative;
    }

    .main-nav_container > ul > li > a {
        display: inline-block;
        font-weight: 600;
        color: var(--font-color_light-theme);
        padding: 1rem 1.2rem;
        transition: all linear 0.3s;
    }

    .main-nav_container > ul > li:hover > a {
        color: var(--main-color) !important;
        background: #eee;
    }

    .main-nav_container .sub-nav_container .sub-nav_content {
        text-align: center;
        width: 50vw;
        max-width: 500px;
    }

    .main-nav_container > ul > li:hover .more-menu_container {
        visibility: visible;
        opacity: 1;
    }

    .main-nav_container .sub-nav_container .sub-nav_content .sub-nav_item {
        padding: 12px;
        display: inline-block;
    }

    .main-nav_container .sub-nav_container .sub-nav_content .sub-nav_item a {
        color: var(--font-color_light-theme);
    }

    .main-nav_container
    .sub-nav_container
    .sub-nav_content
    .sub-nav_item
    a:hover {
        text-decoration: underline;
        color: var(--main-color);
    }

    /* </editor-fold> */

    /*<editor-fold desc="Thanh tìm kiếm">*/
    .search-bar_container form {
        position: relative;
    }

    .search-bar_container form line {
        display: none;
        position: absolute;
        height: 100%;
        border: 2.5px solid var(--main-color);
    }

    .search-bar_container form .search-content {
        font-size: 1rem;
        width: 220px;
        caret-color: var(--main-color);
        color: var(--font-color_light-theme);
        padding-top: 6px;
        padding-bottom: 6px;
        border: 1px solid #ddd;
        border-right: none;
    }

    .search-bar_container form .search-content::placeholder {
        color: #666;
        font-weight: 400;
    }

    .search-bar_container form .search-content:focus {
        outline: none;
    }

    .search-bar_container form .search-content:focus ~ line {
        display: block;
    }

    .search-bar_container
    form
    .search-content:not(:placeholder-shown)
    ~ .search-btn {
        color: var(--main-color);
    }

    .search-bar_container form .search-btn {
        font-size: 1rem;
        color: #999;
        background-color: #f1f1f1;
        padding: 2px 1rem;
        border: 1px solid #ddd;
        border-left: none;
        transition: all linear 0.3s;
    }

    .search-bar_container form .search-btn:hover {
        color: #fff !important;
        background-color: var(--main-color);
        border-color: var(--main-color);
    }

    /* </editor-fold>*/

    /* <editor-fold desc="Chức năng người dùng"> */
    .user_container {
        margin: 0 1.3rem;
        padding-left: 1rem;
    }

    .user_container .user-acc_wrapper {
        position: relative;
        width: 38px;
        height: 38px;
    }

    .user_container .user-acc_wrapper .user-icon {
        border: 2px solid #333;
        border-radius: 999px;
    }

    .user_container .user-acc_wrapper .user-icon i {
        font-size: 1.3rem;
        color: #333;
    }

    .user_container .user-acc_wrapper .user-acc_content {
        position: relative;
        text-align: center;
        width: 200px;
    }

    .user_container .user-acc_wrapper .user-acc_content::before {
        content: "";
        display: inline-block;
        position: absolute;
        bottom: 100%;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 0;
        border-left: 11px solid transparent;
        border-right: 11px solid transparent;
        border-bottom: 11px solid var(--background-color_light-theme);
    }

    .user_container .user-acc_wrapper:hover .more-menu_container {
        visibility: visible;
        opacity: 1;
    }

    .user_container .user-acc_wrapper .user-acc_content li:not(:last-child) {
        padding-bottom: 8px;
    }

    .user_container .user-acc_wrapper .user-acc_content a {
        color: var(--font-color_light-theme);
    }

    .user_container .user-acc_wrapper .user-acc_content a:hover {
        text-decoration: underline;
        color: var(--main-color);
        cursor: pointer;
    }

    /* </editor-fold> */

    /* <editor-fold desc="Giỏ hàng"> */
    .cart_container {
        margin: 0 1.3rem;
        padding-right: 1rem;
    }

    .cart_container .cart_wrapper {
        position: relative;
    }

    .cart_container .cart_wrapper i {
        position: relative;
        font-size: 1.5rem;
        color: #333;
    }

    .cart_container .cart_wrapper i .item-count {
        position: absolute;
        bottom: 70%;
        left: 70%;
        font-size: 16px;
        font-weight: 600;
        text-align: center;
        width: 22px;
        height: 22px;
        padding: 4px;
        border-radius: 999px;
        color: #fff;
        background: #f8492f;
    }

    .cart_container .cart_wrapper .more-menu_container {
        padding-top: 18px;
        transform-origin: top left;
        scale: 0.5;
        transform: translateX(-90%);
        transition: all linear 0.1s;
    }

    .cart_container .cart_wrapper:hover .more-menu_container {
        visibility: visible;
        opacity: 1;
        scale: 1;
    }

    .cart_container .cart_wrapper .cart-content {
        position: relative;
        width: 400px;
    }

    .cart_container .cart_wrapper .cart-content::before {
        content: "";
        display: inline-block;
        position: absolute;
        bottom: 100%;
        left: 88%;
        width: 0;
        height: 0;
        border-left: 11px solid transparent;
        border-right: 11px solid transparent;
        border-bottom: 11px solid var(--background-color_light-theme);
    }

    .cart_container .cart_wrapper .cart-content .no-product {
        text-align: center;
    }

    .cart_container .cart_wrapper .cart-content .no-product img {
        width: 120px;
        height: 120px;
        height: fit-content;
    }

    .cart_container .cart_wrapper .cart-content .product-item {
        font-size: 14px;
        padding: 12px 0;
    }

    .cart_container .cart_wrapper .cart-content .product-item img {
        width: 100px;
    }

    .cart_container .cart_wrapper .cart-content .product-item .product-info {
        padding: 0 12px 0 8px;
    }

    .cart_container .cart_wrapper .cart-content .product-item .product-name {
        font-weight: 600;
        line-height: 1.3;
        margin: 8px 0 12px;
    }

    .cart_container .cart_wrapper .cart-content .go-to-cart_wrapper {
        text-align: center;
    }

    .cart_container .cart_wrapper .cart-content .go-to-cart_wrapper a {
        font-weight: 600;
    }

    .cart_container .cart_wrapper .cart-content .go-to-cart_wrapper a:hover {
        text-decoration: underline;
        color: var(--main-color);
    }

    /* </editor-fold> */

    /* <editor-fold desc="Đổi theme"> */
    .mode_container {
        margin-left: 4rem;
    }

    .mode_container .item {
        color: var(--font-color_light-theme);
    }

    .mode_container .item:hover {
        cursor: pointer;
    }

    .mode_container .item.hidden {
        display: none;
    }

    .mode_container .dark-theme_icon {
        color: midnightblue;
        position: relative;
    }

    .mode_container .dark-theme_icon::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);
        width: 1.5rem;
        height: 1.5rem;
        border-radius: 999px;
        background: #fff8de;
        filter: blur(8px);
        opacity: 0.6;
    }

    .mode_container .light-theme_icon {
        position: relative;
    }

    .mode_container .light-theme_icon::after {
        content: "";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translateX(-50%) translateY(-50%);
        width: 1.5rem;
        height: 1.5rem;
        border-radius: 999px;
        background: #f4e99b;
        filter: blur(8px);
        opacity: 0.6;
    }

    /* </editor-fold> */

    /* <editor-fold desc="Dark mode css"> */
    .dark-theme header {
        background: var(--background-color_dark-theme);
    }

    .dark-theme header .header_container .more-menu_content {
        background-color: var(--background-color_dark-theme_2);
    }

    .dark-theme
    .main-nav_container
    .sub-nav_container
    .sub-nav_content
    .sub-nav_item
    a {
        color: var(--font-color_dark-theme_2);
    }

    .dark-theme .mode_container .item {
        color: var(--font-color_dark-theme);
    }

    .dark-theme .main-nav_container li a,
    .dark-theme .user_container .user-acc_wrapper .user-icon i,
    .dark-theme .cart_container .cart_wrapper i {
        color: var(--font-color_dark-theme);
    }

    .dark-theme .user_container .user-acc_wrapper .user-icon {
        border: 2px solid var(--font-color_dark-theme);
    }

    .dark-theme .user_container .user-acc_wrapper .user-acc_content,
    .dark-theme .user_container .user-acc_wrapper .user-acc_content a,
    .dark-theme
    .cart_container
    .cart_wrapper
    .cart-content
    .go-to-cart_wrapper
    a:hover {
        color: var(--font-color_dark-theme_2);
    }

    .dark-theme .user_container .user-acc_wrapper .user-acc_content::before {
        border-bottom-color: var(--background-color_dark-theme_2);
    }

    .dark-theme .cart_container .cart_wrapper i .item-count {
        color: #fff;
    }

    .dark-theme .cart_container .cart_wrapper .cart-content::before {
        border-bottom-color: var(--background-color_dark-theme_2);
    }

    .dark-theme .cart_container .cart_wrapper .cart-content .no-product {
        color: var(--font-color_dark-theme_2);
    }

    /* </editor-fold> */

    /* #region responsive */
    @media only screen and (max-width: 1200px) {
        header .header_container {
            height: auto;
        }

        header .header_container .left-header,
        header .header_container .right-header {
            height: 80px;
        }

        header .header_container .left-header .logo {
            display: none;
        }

        .cart_container {
            position: fixed;
            bottom: 3rem;
            right: 3rem;
            padding: 0;
            margin: 0;
            background-color: var(--main-color);
            border-radius: 6px;
            z-index: 99;
            cursor: pointer;
        }

        .cart_container .cart_wrapper {
            padding: 16px;
        }

        .cart_container .cart_wrapper i {
            color: var(--background-color_light-theme);
        }

        .dark-theme .cart_container .cart_wrapper i {
            color: var(--background-color_light-theme);
        }

        .cart_container .cart_wrapper i .item-count {
            bottom: 100%;
            left: 100%;
            color: #eee;
            background: #f8492f;
        }

        .cart_container .cart_wrapper .cart-content {
            border-bottom: none !important;
            border-radius: 4px !important;
        }

        .cart_container .cart_wrapper .cart-content::before {
            transform: rotateZ(180deg);
            bottom: auto;
            top: 100%;
        }

        .cart_container .cart_wrapper .more-menu_container {
            top: auto;
            bottom: 100%;
            padding: 0 0 12px;
            transform-origin: bottom left;
        }

        .cart_container .cart_wrapper:hover .more-menu_container {
            visibility: visible;
            opacity: 1;
            scale: 1;
        }

        .cart_container .cart_wrapper .cart-content .product-item {
            order: 2;
        }

        .cart_container .cart_wrapper .cart-content .go-to-cart_wrapper {
            margin: 8px;
        }

        .mode_container {
            margin-left: 3rem;
            margin-right: 1.2rem;
        }
    }

    /* #endregion */
</style>

<header class="d-flex justify-content-center align-items-center">
    <div
            class="header_container d-flex justify-content-between align-items-center"
    >
        <div class="left-header d-flex justify-content-center">
            <div class="logo">
                <a href="<%=url%>"
                ><img
                        src="https://media.istockphoto.com/id/1354776457/vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo.jpg?s=612x612&w=0&k=20&c=w3OW0wX3LyiFRuDHo9A32Q0IUMtD4yjXEvQlqyYk9O4="
                        alt=""
                /></a>
            </div>
            <!-- Menu điều hướng chính -->
            <div class="main-nav_container d-flex">
                <ul class="d-flex align-items-center px-4 m-0">
                    <li><a href="<%=url%>">Trang chủ</a></li>
                    <li><a href="">Giới thiệu</a></li>
                    <li>
                        <a href="<%=url%>/categories/">Thực đơn</a>
                        <div class="more-menu_container sub-nav_container">
                            <div class="more-menu_content sub-nav_content">
                                <div class="sub-nav_item"><a href="">Kem</a></div>
                                <div class="sub-nav_item"><a href="">Trà trái cây</a></div>
                                <div class="sub-nav_item"><a href="">Okinawa</a></div>
                                <div class="sub-nav_item"><a href="">Trà nguyên chất</a></div>
                                <div class="sub-nav_item"><a href="">Latte Series</a></div>
                                <div class="sub-nav_item">
                                    <a href="">Thức uống đặc biệt Gong Cha</a>
                                </div>
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
                        <input
                                type="text"
                                name=""
                                id=""
                                class="search-content px-4 lh-lg"
                                placeholder="Tìm kiếm"
                                spellcheck="false"
                        />
                        <button type="submit" class="search-btn btn rounded-0">
                            <i class="fa-solid fa-magnifying-glass"></i>
                        </button>
                        <line></line>
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
                if (user == null) {
            %>

            <div class="user_container d-flex align-items-center">
                <div class="user-acc_wrapper item p-0">
                    <div
                            class="user-icon d-flex align-items-center justify-content-center w-100 h-100"
                    >
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
                        <div
                                class="item-count d-flex justify-content-center align-items-center"
                        >
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
                                <a href="">Xem tất cả <span>(3)</span> trong giỏ hàng</a>
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
                                width="20"
                                height="20"
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
                                width="20"
                                height="20"
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

<script>
    const $ = document.querySelector.bind(document);
    const $$ = document.querySelectorAll.bind(document);

    // <editor-fold desc="Xác định theme được lưu trong localStorage">
    let theme;
    if (!localStorage.getItem('cloudyDrinksTheme')) {
        localStorage.setItem("cloudyDrinksTheme", "light");
        theme = localStorage.getItem('cloudyDrinksTheme');
        console.log(theme);
    } else {
        theme = localStorage.getItem('cloudyDrinksTheme');
    }
    if (theme === "dark") {
        document.body.classList.add("dark-theme");
        $(".mode_container .dark-theme_icon").classList.add("hidden");
    } else $(".mode_container .light-theme_icon").classList.add("hidden");
    // </editor-fold>

    const toggleDarkTheme = () => {
        if (theme === "dark") {
            localStorage.setItem("cloudyDrinksTheme", "light");
        } else {
            localStorage.setItem("cloudyDrinksTheme", "dark");
        }
        document.body.classList.toggle("dark-theme");
        document.querySelectorAll(".change-mode .item").forEach((itemIcon) => {
            itemIcon.classList.toggle("hidden");
        });
    };

    // <editor-fold desc="Defined whether header should be floated and hidden">
    var lastScrollTop = 0;

    window.addEventListener(
        "scroll",
        function () {
            var st = window.scrollY || document.documentElement.scrollTop;
            if (st > 100) document.querySelector("header").classList.add("float");
            else document.querySelector("header").classList.remove("float");
            if (st > lastScrollTop) {
                document.querySelector("header").classList.add("hidden");
            } else if (st < lastScrollTop) {
                document.querySelector("header").classList.remove("hidden");
            } // else was horizontal scroll
            lastScrollTop = st <= 100 ? 100 : st;
        },
        false
    );
    // </editor-fold>
</script>