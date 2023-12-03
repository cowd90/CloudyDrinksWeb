<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 12/2/2023
  Time: 12:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thanh toán đơn hàng | Cloudy Drinks</title>
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

    <link rel="stylesheet" href="../css/global.css">
    <link rel="stylesheet" href="../css/checkout.css">
</head>
<body>
    <div class="content_container">
        <h1 class="py-3 text-center">Cloudy Drinks</h1>
        <div class="row">
            <div class="col-md-8 order-2 order-md-1">
                <form action="" method="post">
                    <section id="contact_container">
                        <div class="fs-5 fw-bolder d-flex align-items-center gap-2 mb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-card-heading" viewBox="0 0 16 16">
                                <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"></path>
                                <path d="M3 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m0-5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"></path>
                            </svg>
                            Thông tin nhận hàng
                        </div>
                        <div class="row">
                            <div class="dropdown col-9">
                                <div class="dropdown-toggle w-100 d-flex justify-content-between align-items-center"
                                     role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <div id="displaySelectedContact">Thông tin đã lưu</div>
                                </div>

                                <div class="dropdown-menu">

                                    <div class="dropdown-item">
                                        <p>Sunny Biolie - 0907036729</p>
                                        <p>Số 3127 Phạm Thế Hiển, Phường 16, Quận 11, TP Hồ Chí Minh</p>
                                    </div>
                                    <div class="dropdown-item">
                                        <p>Chí Khoa - 0907036729</p>
                                        <p>Phường 16, Quận 11, TP Hồ Chí Minh</p>
                                    </div>
                                    <div class="dropdown-item">
                                        <p>Sunny Biolie - 0907036729</p>
                                        <p>Số 3127 Phạm Thế Hiển, Phường 16, Quận 11, TP Hồ Chí Minh</p>
                                    </div>

                                </div>

                            </div>
                            <div class="col-3 d-flex justify-content-center align-items-center">
                                <span class="link fw-bolder text-center">Nhập thông tin mới</span>
                            </div>
                        </div>

                        <select name="contactId" id="" hidden>
                            <option value="" selected disabled hidden></option>
                            <option value="123Z"></option>
                            <option value="35as"></option>
                            <option value="rani"></option>
                        </select>

                    </section>
                    <section>
                        <div class="fs-5 fw-bolder d-flex align-items-center gap-2 mb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
                                <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456M12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2"></path>
                            </svg>
                            Vận chuyển
                        </div>
                        <div class="lock">
                            Miễn phí vận chuyển
                        </div>
                    </section>
                    <section>
                        <div class="fs-5 fw-bolder d-flex align-items-center gap-2 mb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" fill="currentColor" class="bi bi-credit-card-2-front" viewBox="0 0 16 16">
                                <path d="M14 3a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1zM2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2z"></path>
                                <path d="M2 5.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5m3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 0 1h-1a.5.5 0 0 1-.5-.5"></path>
                            </svg>
                            Phương thức thanh toán
                        </div>
                        <div class="lock">
                            Thanh toán khi giao hàng (COD)
                        </div>
                    </section>
                    <div class="row align-items-center gap-3 gap-md-0">
                        <div class="mb-3 mb-md-0 d-flex d-md-block justify-content-center order-2 order-md-1 col-12 col-md-6">
                            <a href="../cart" class=" link fw-bolder">
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-bar-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M12.5 15a.5.5 0 0 1-.5-.5v-13a.5.5 0 0 1 1 0v13a.5.5 0 0 1-.5.5M10 8a.5.5 0 0 1-.5.5H3.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L3.707 7.5H9.5a.5.5 0 0 1 .5.5"></path>
                                </svg>
                                <span> Quay về giỏ hàng</span></a>
                        </div>
                        <div class="d-flex justify-content-end order-1 col-12 col-md-6">
                            <button class="main-btn">Đặt hàng</button>
                        </div>
                    </div>
                </form>
                <dialog open id="manage_contact">
                    <div>
                        <h3 class="heading">Quản lý thông tin nhận hàng</h3>
                        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="add_contact_info-tab" data-bs-toggle="pill" data-bs-target="#add_contact_info" type="button"
                                        role="tab" aria-controls="add_contact_info" aria-selected="true">Thêm</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="remove_contact_info-tab" data-bs-toggle="pill" data-bs-target="#remove_contact_info" type="button"
                                        role="tab" aria-controls="remove_contact_info" aria-selected="false">Xóa</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="add_contact_info"
                                 role="tabpanel" aria-labelledby="add_contact_info-tab" tabindex="0">
                                <form id="add">
                                    <input type="hidden" name="">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" id="name" placeholder="">
                                        <label for="name">Họ và tên</label>
                                    </div>
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="phoneNumber" placeholder="">
                                        <label for="phoneNumber">Số điện thoại</label>
                                    </div>
                                </form>
                            </div>
                            <div class="tab-pane fade" id="remove_contact_info"
                                 role="tabpanel" aria-labelledby="remove_contact_info-tab" tabindex="0">
                                ...
                            </div>
                        </div>
                    </div>
                </dialog>
            </div>
            <div class="col-md-4 order-1 mb-3 border-2 border-bottom border-dark-subtle">
                <div class="d-flex">
                    <div class="" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                        <div class="order-title">Đơn hàng
                            <span class="card-quantity">(3 sản phẩm)</span>
                        </div>
                    </div>
                </div>
                <div class="collapse show py-3" id="collapseExample">
                    <div id="cart-container" class="mb-2">
                        <div class="item row pb-1">
                            <div class="col-3">
                                <img class="img"
                                     src="https://gongcha.com.vn/wp-content/uploads/2023/10/TRA-SUA-NHO.png" alt="">
                            </div>
                            <div class="item_info col-6">
                                <p class="name">Grape Milk Tea</p>
                                <p class="d-flex justify-content-between align-items-center">
                                    <span>(Vừa)</span>
                                    <span class="fst-italic">x2</span>
                                </p>
                                <p>59,000đ</p>
                            </div>
                            <div class="col-3 d-flex align-items-center">
                                118,000đ
                            </div>
                        </div>
                        <div class="break-line mb-1"></div>

                        <div class="item row pb-1">
                            <div class="col-3">
                                <img class="img"
                                     src="https://gongcha.com.vn/wp-content/uploads/2023/10/TRA-SUA-NHO.png" alt="">
                            </div>
                            <div class="item_info col-6">
                                <p class="name">Grape Milk Tea</p>
                                <p class="d-flex justify-content-between align-items-center">
                                    <span>(Vừa)</span>
                                    <span class="fst-italic">x2</span>
                                </p>
                                <p>59,000đ</p>
                            </div>
                            <div class="col-3 d-flex align-items-center">
                                118,000đ
                            </div>
                        </div>
                        <div class="break-line mb-1"></div>
                        <div class="item row pb-1">
                            <div class="col-3">
                                <img class="img"
                                     src="https://gongcha.com.vn/wp-content/uploads/2023/10/TRA-SUA-NHO.png" alt="">
                            </div>
                            <div class="item_info col-6">
                                <p class="name">Grape Milk Tea</p>
                                <p class="d-flex justify-content-between align-items-center">
                                    <span>(Vừa)</span>
                                    <span class="fst-italic">x2</span>
                                </p>
                                <p>59,000đ</p>
                            </div>
                            <div class="col-3 d-flex align-items-center">
                                118,000đ
                            </div>
                        </div>
                        <div class="break-line mb-1"></div>
                        <div class="item row pb-1">
                            <div class="col-3">
                                <img class="img"
                                     src="https://gongcha.com.vn/wp-content/uploads/2023/10/TRA-SUA-NHO.png" alt="">
                            </div>
                            <div class="item_info col-6">
                                <p class="name">Grape Milk Tea</p>
                                <p class="d-flex justify-content-between align-items-center">
                                    <span>(Vừa)</span>
                                    <span class="fst-italic">x2</span>
                                </p>
                                <p>59,000đ</p>
                            </div>
                            <div class="col-3 d-flex align-items-center">
                                118,000đ
                            </div>
                        </div>
                        <div class="break-line mb-1"></div>
                    </div>
                    <div class="order-control">
                        <div class="d-flex flex-column gap-3">
                            <div>
                                <div class="fs-5 fw-bolder">Tổng tiền:</div>
                                <div id="valueOfCart">134,000đ</div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="../js/checkout.js"></script>
</body>
</html>
