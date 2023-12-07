<%@ page import="database.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Tin tức | Cloudy Drinks</title>
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
    <link rel="stylesheet" href="../css/news.css">
</head>
<body>
    <%@include file="../components/header.jsp" %>

    <div class="banner">
        <div class="content_container">
            <div class="title">Tin tức</div>
            <p>Xem những tin tức mới nhất đến từ Cloudy Drinks</p>
        </div>
    </div>
    
    <div class="content_container">
        <div class="row pt-5">
            <%
                NewsDAO newsDAO = new NewsDAO();
                ArrayList<News> newNews = newsDAO.select3NewNews();
                for (News news : newNews) {
            %>
            <div class="col-6 col-lg-4">
        <div class="news-container row pt-5 pb-4">

            <!--<editor-fold desc="Một tin tức">-->
            <div class="col-12 col-sm-6 col-lg-4 mb-4">
                <div class="card">
                    <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2023/03/395x280-02.jpg')" class="card-img-top"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title">Gong Cha đón hè với Series Đào Hoàng Kim</h5>
                            <p class="link justify-content-center align-items-center gap-2 text-end">Chi tiết</p>
                        </div>
                        <p class="card-text">Bài viết được cung cấp từ Zing News 21/3/2023 09:30 (GMT+7): https://zingnews.vn/gong-cha-viet-nam-ban-them-ca-phe-mo-lai-hoat-dong-nhuong-quyen-post1413828.html Golden Trust có kế hoạch phát triển thêm…</p>
                        <div class="d-flex justify-content-end">
                        </div>
                    </div>
                </div>
            </div>
            <!--</editor-fold>-->

            <div class="col-12 col-sm-6 col-lg-4 mb-4">
                <div class="card">
                    <img src="<%=news.getImg()%>" class="card-img-top" alt="<%=news.getTitle()%>">
                    <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2023/03/395x280-02.jpg')" class="card-img-top"></div>
                    <div class="card-body">
                        <h5 class="card-title"><%=news.getTitle()%></h5>
                        <p class="card-text"><%=news.getContent()%></p>
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title">Gong Cha đón hè với Series Đào Hoàng Kim</h5>
                            <p class="link justify-content-center align-items-center gap-2 text-end">Chi tiết</p>
                        </div>
                        <p class="card-text">Bài viết được cung cấp từ Zing News 21/3/2023 09:30 (GMT+7): https://zingnews.vn/gong-cha-viet-nam-ban-them-ca-phe-mo-lai-hoat-dong-nhuong-quyen-post1413828.html Golden Trust có kế hoạch phát triển thêm…</p>
                        <div class="d-flex justify-content-end">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-4 mb-4">
                <div class="card">
                    <div style="background-image: url('http://gongcha.com.vn/wp-content/uploads/2023/03/395x280-02.jpg')" class="card-img-top"></div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="card-title">Gong Cha đón hè với Series Đào Hoàng Kim</h5>
                            <p class="link justify-content-center align-items-center gap-2 text-end">Chi tiết</p>
                        </div>
                        <p class="card-text">Bài viết được cung cấp từ Zing News 21/3/2023 09:30 (GMT+7): https://zingnews.vn/gong-cha-viet-nam-ban-them-ca-phe-mo-lai-hoat-dong-nhuong-quyen-post1413828.html Golden Trust có kế hoạch phát triển thêm…</p>
                        <div class="d-flex justify-content-end">
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>

        </div>
        <div class="d-flex justify-content-center align-items-center">
            <button class="more-news main-btn px-5">Xem thêm</button>
        </div>
    </div>

    <%@include file="../components/footer.jsp" %>

    <script src="../js/news.js"></script>
</body>
</html>
