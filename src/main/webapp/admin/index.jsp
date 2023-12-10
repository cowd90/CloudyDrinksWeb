<%@ page import="database.CategoryDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Category" %>
<%@ page import="model.Product" %>
<%@ page import="database.ProductDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
%>
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
    <div id="admin_container" class="content_container d-flex flex-column gap-4">
        <div class="header fs-1 text-center p-3">
            Welcome, Admin
        </div>
        <section>
            <div class="title fs-4 mb-2">Quản lý danh mục</div>
            <nav>
                <div class="nav nav-tabs" id="category-tab" role="tablist">
                    <button class="nav-link active" id="add-category-tab" data-bs-toggle="tab" data-bs-target="#add-category" type="button" role="tab" aria-controls="add-category" aria-selected="true">Thêm</button>
                    <button class="nav-link" id="remove-category-tab" data-bs-toggle="tab" data-bs-target="#remove-category" type="button" role="tab" aria-controls="remove-category" aria-selected="false">Xóa</button>
                    <button class="nav-link" id="edit-category-tab" data-bs-toggle="tab" data-bs-target="#edit-category" type="button" role="tab" aria-controls="edit-category" aria-selected="false" disabled>Chỉnh sửa</button>
                </div>
            </nav>
            <div class="tab-content" id="category-tabContent">
                <div class="tab-pane show active" id="add-category" role="tabpanel" aria-labelledby="add-category-tab" tabindex="0">
                    <div class="row p-3">
                        <div class="col-6">
                            <form action="${pageContext.request.contextPath}/admin-controller" method="post"
                                  class="row-cols-1 d-flex flex-column gap-3" >
                                <input name="action" type="hidden" value="add-category">
                                <input type="text" name="catName" placeholder="Tên danh mục">
                                <input type="submit" value="Thêm danh mục">
                            </form>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="remove-category" role="tabpanel" aria-labelledby="remove-category-tab" tabindex="0">
                    <form action="${pageContext.request.contextPath}/admin-controller" method="post" class="row">
                        <input name="action" type="hidden" value="remove-category">
                        <div class="col-6">
                            <select name="delCatId">
                                <%
                                    ArrayList<Category> categories = new CategoryDAO().selectAll();
                                    for (Category category : categories) {
                                %>
                                <option value="<%=category.getCatId()%>"><%=category.getCatName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="submit" value="Xóa danh mục">
                        </div>
                    </form>
                </div>
                <div class="tab-pane" id="edit-category" role="tabpanel" aria-labelledby="edit-category-tab" tabindex="0">...</div>
            </div>
        </section>

        <section>
            <div class="title fs-4 mb-2">Quản lý Sản phẩm</div>
            <nav>
                <div class="nav nav-tabs" id="product-tab" role="tablist">
                    <button class="nav-link active" id="add-product-tab" data-bs-toggle="tab" data-bs-target="#add-product" type="button" role="tab" aria-controls="add-product" aria-selected="true">Thêm</button>
                    <button class="nav-link" id="remove-product-tab" data-bs-toggle="tab" data-bs-target="#remove-product" type="button" role="tab" aria-controls="remove-product" aria-selected="false">Xóa</button>
                    <button class="nav-link" id="edit-product-tab" data-bs-toggle="tab" data-bs-target="#edit-product" type="button" role="tab" aria-controls="edit-product" aria-selected="false" disabled>Chỉnh sửa</button>
                </div>
            </nav>
            <div class="tab-content" id="product-tabContent">
                <div class="tab-pane show active has_preview" id="add-product" role="tabpanel" aria-labelledby="add-product-tab" tabindex="0">
                    <div class="row p-3">
                        <div class="col-6">
                            <!-- Form này không gửi dữ liệu, xem AJAX trong js -->
                            <form id="add_product-form" class="row-cols-1 d-flex flex-column gap-3"
                                  action="./" method="get">
                                <input type="text" name="prodName" placeholder="Tên sản phẩm">
                                <label for="product_img-input">Hình ảnh sản phẩm</label>
                                <input type="file" accept="image/*" id="product_img-input">
                                <input type="hidden" name="prodImgLink" placeholder="Đường dẫn hình ảnh"
                                       class="image_link">
                                <input type="number" name="prodPrice" placeholder="Giá sản phẩm">
                                <select name="belongCat">
                                    <option value="" selected disabled hidden>Tên danh mục</option>
                                    <%
                                        for (Category category : categories) {
                                    %>
                                    <option value="<%=category.getCatId()%>"><%=category.getCatName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                                <input type="text" name="prodDesc" placeholder="Mô tả sản phẩm">

                                <input type="submit" id="add_prod-btn" value="Thêm sản phẩm">
                            </form>
                        </div>
                        <div class="preview col-6">
                            <img src="" alt="Preview image" data-preview_for="product_img-input">
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="remove-product" role="tabpanel" aria-labelledby="remove-product-tab" tabindex="0">
                    <form action="${pageContext.request.contextPath}/admin-controller" method="post" class="row">
                        <input name="action" value="remove-product" type="hidden">
                        <div class="col-6">
                            <select name="delProdId">
                                <%
                                    ArrayList<Product> products = new ProductDAO().selectAll();
                                    for (Product product : products) {
                                %>
                                <option value="<%=product.getProductId()%>"><%=product.getProductName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="col-6">
                            <input type="submit" value="Xóa sản phẩm">
                        </div>
                    </form>
                </div>
                <div class="tab-pane" id="edit-product" role="tabpanel" aria-labelledby="edit-product-tab" tabindex="0">...</div>
            </div>
        </section>
    </div>

    <script id="add-product-url" src="../js/admin.js" type="module" data-url="<%=url%>"></script>

</body>
</html>
