<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 11/30/2023
  Time: 10:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin | Cloudy Drinks</title>
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
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
    <div id="admin_container" class="content_container">
        <div class="header">
            Welcome, Admin
        </div>
        <section>
            <div class="title">Quản lý danh mục</div>
            <nav>
                <div class="nav nav-tabs" id="category-tab" role="tablist">
                    <button class="nav-link active" id="add-category-tab" data-bs-toggle="tab" data-bs-target="#add-category" type="button" role="tab" aria-controls="add-category" aria-selected="true">Thêm</button>
                    <button class="nav-link" id="remove-category-tab" data-bs-toggle="tab" data-bs-target="#remove-category" type="button" role="tab" aria-controls="remove-category" aria-selected="false">Xóa</button>
                    <button class="nav-link" id="edit-category-tab" data-bs-toggle="tab" data-bs-target="#edit-category" type="button" role="tab" aria-controls="edit-category" aria-selected="false" disabled>Chỉnh sửa</button>
                </div>
            </nav>
            <div class="tab-content" id="category-tabContent">
                <div class="row">
                    <div class="tab-pane fade show active row" id="add-category" role="tabpanel" aria-labelledby="add-category-tab" tabindex="0">
                        <div class="col-6">
                            <form action="" method="get"
                                  class="row-cols-1" >
                                <input type="text" name="catName" placeholder="Tên danh mục">
                                <input type="submit" value="Thêm danh mục">
                            </form>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="remove-category" role="tabpanel" aria-labelledby="remove-category-tab" tabindex="0">
                    <form action="" method="" class="row">
                        <div class="col-6">
                            <select name="delCatId">
                                <option value="iddanhmuc">Tên danh mục</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="submit" value="Xóa danh mục">
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="edit-category" role="tabpanel" aria-labelledby="edit-category-tab" tabindex="0">...</div>
            </div>
        </section>

        <section>
            <div class="title">Quản lý Sản phẩm</div>
            <nav>
                <div class="nav nav-tabs" id="product-tab" role="tablist">
                    <button class="nav-link active" id="add-product-tab" data-bs-toggle="tab" data-bs-target="#add-product" type="button" role="tab" aria-controls="add-product" aria-selected="true">Thêm</button>
                    <button class="nav-link" id="remove-product-tab" data-bs-toggle="tab" data-bs-target="#remove-product" type="button" role="tab" aria-controls="remove-product" aria-selected="false">Xóa</button>
                    <button class="nav-link" id="edit-product-tab" data-bs-toggle="tab" data-bs-target="#edit-product" type="button" role="tab" aria-controls="edit-product" aria-selected="false" disabled>Chỉnh sửa</button>
                </div>
            </nav>
            <div class="tab-content" id="product-tabContent">
                <div class="row">
                    <div class="tab-pane fade show active row has_preview" id="add-product" role="tabpanel" aria-labelledby="add-product-tab" tabindex="0">
                        <div class="col-6">
                            <form action="" method="get"
                                  class="row-cols-1" >
                                <input type="text" name="prodName" placeholder="Tên sản phẩm">
                                <input type="text" name="prodImgLink" placeholder="Đường dẫn hình ảnh"
                                       class="image_link">
                                <input type="text" name="prodPrice" placeholder="Giá sản phẩm">
                                <select name="belongCat">
                                    <option value="iddanhmuc">Tên danh mục</option>
                                </select>
                                <input type="text" name="prodDesc" placeholder="Mô tả sản phẩm">

                                <input type="submit" value="Thêm sản phẩm">
                            </form>
                        </div>
                        <div class="preview col-6">
                            <img src="" alt="">
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="remove-product" role="tabpanel" aria-labelledby="remove-product-tab" tabindex="0">
                    <form action="" method="" class="row">
                        <div class="col-6">
                            <select name="delProdId">
                                <option value="idsp">Tên sản phẩm</option>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="submit" value="Xóa sản phẩm">
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="edit-product" role="tabpanel" aria-labelledby="edit-product-tab" tabindex="0">...</div>
            </div>
        </section>
    </div>

    <script src="../js/admin.js"></script>
</body>
</html>
