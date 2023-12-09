<%@ page import="model.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="database.ProductDAO" %>
<%@ page import="model.Size" %>
<%@ page import="util.NumberCurrencyFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<body>
    <%
        ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("productListSearch");
        if (products == null) {
    %>
    <div class="no-item d-flex justify-content-center align-items-center gap-2">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
            <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
        </svg>
        Không có kết quả tìm kiếm
    </div>
    <%
    } else {
        for (Product product : products) {
            ArrayList<Size> sizes = new ProductDAO().getSizesByProductId(product.getProductId());
    %>
    <a href="${pageContext.request.contextPath}/product-controller?pid=<%=product.getProductId()%>" class="item d-flex justify-content-center align-items-center">
        <div class="img"
             style="background-image: url('<%=product.getProductImage()%>')"></div>
        <div class="content">
            <div class="heading"><%=product.getProductName()%></div>
            <div class="body">
                <%
                    for (Size size : sizes) {
                        String sizeName = "(" + size.getSizeName() + ")";
                %>
                <p><%=NumberCurrencyFormat.numberCurrencyFormat(product.getPrice() + size.getUpSizePrice())%>đ <%=(product.getCatId()!=7)?sizeName:""%></p>
                <%
                    }
                %>
            </div>
        </div>
    </a>
    <%
            }
        }
    %>
</body>
</html>
