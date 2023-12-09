<%--
  Created by IntelliJ IDEA.
  User: khoap
  Date: 12/8/2023
  Time: 9:20 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Giới thiệu | Cloudy Drinks</title>
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
  <link rel="stylesheet" href="../css/about.css">
</head>
<body>
<%@include file="../components/header.jsp" %>

<div class="banner">
  <div class="content_container">
    <div class="title">Về chúng tôi</div>
    <p>Một số thông tin về thành viên nhóm đồ án</p>
  </div>
</div>
<div class="content_container overflow-hidden mt-5">
  <div class="member left row flex-md-row flex-column-reverse p-5">
    <div class="col-md-6 d-flex flex-column gap-md-3 gap-0 px-md-0 px-5 py-md-3 py-0">
      <div class="position fs-4">Thành viên dự án</div>
      <div class="fs-1 fw-bolder">Lã Văn Hà</div>
      <div class="d-flex align-items-center gap-3 fs-4 fb-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
          <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"></path>
        </svg>
        <a href="https://www.facebook.com/profile.php?id=100012298066947">water.la</a>
      </div>
    </div>
    <div class="col-md-6 p-md-3 p-5">
      <div class="member_avatar"
           style="background-image: url('https://firebasestorage.googleapis.com/v0/b/cloudy-drinks-website.appspot.com/o/images%2FScreenshot%202023-12-07%20100155.png?alt=media&token=e164de12-58ba-454b-b620-4b8e7ec23fe7')">
      </div>
    </div>
  </div>
  <div class="member right row flex-md-row flex-column-reverse p-5">
    <div class="col-md-6 d-flex flex-column gap-md-3 gap-0 px-md-0 px-5 py-md-3 py-0">
      <div class="position fs-4">Thành viên dự án</div>
      <div class="fs-1 fw-bolder">Nguyễn Tiến Dũng</div>
      <div class="d-flex align-items-center gap-3 fs-4 fb-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
          <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"></path>
        </svg>
        <a href="https://www.facebook.com/tuyettan.chongay.5059">nguyentien.dung.5059</a>
      </div>
    </div>
    <div class="col-md-6 p-md-3 p-5">
      <div class="member_avatar"
           style="background-image: url('https://firebasestorage.googleapis.com/v0/b/cloudy-drinks-website.appspot.com/o/images%2F_COT3938.jpg?alt=media&token=d83d4b44-2c0a-48b8-9265-5a4fcab17c05')">
      </div>
    </div>
  </div>
  <div class="member left row flex-md-row flex-column-reverse p-5">
    <div class="col-md-6 d-flex flex-column gap-md-3 gap-0 px-md-0 px-5 py-md-3 py-0">
      <div class="position fs-4">Thành viên dự án</div>
      <div class="fs-1 fw-bolder">Phạm Nguyễn Chí Khoa</div>
      <div class="d-flex align-items-center gap-3 fs-4 fb-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
          <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"></path>
        </svg>
        <a href="https://www.facebook.com/chikhoa.nguyen.10">chikhoa.nguyen.10</a>
      </div>
    </div>
    <div class="col-md-6 p-md-3 p-5">
      <div class="member_avatar"
           style="background-image: url('https://scontent.fsgn8-4.fna.fbcdn.net/v/t1.6435-9/187049538_2816589002004416_2728523802322470614_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=7a1959&_nc_ohc=WXv2m1jyzwQAX_v76X7&_nc_ht=scontent.fsgn8-4.fna&oh=00_AfAEVMOLyNO8cI3TynvAYprkEotFtEVU33lmHGJ4UPZ2cQ&oe=659A0A85')">

      </div>
    </div>
  </div>
  <div class="member right row flex-md-row flex-column-reverse p-5">
    <div class="col-md-6 d-flex flex-column gap-md-3 gap-0 px-md-0 px-5 py-md-3 py-0">
      <div class="position fs-4">Thành viên dự án</div>
      <div class="fs-1 fw-bolder">Phan Vũ Trường An</div>
      <div class="d-flex align-items-center gap-3 fs-4 fb-link">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-facebook" viewBox="0 0 16 16">
          <path d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951"></path>
        </svg>
        <a href="https://www.facebook.com/phanvutruongantensei">truongan.tensei</a>
      </div>
    </div>
    <div class="col-md-6 p-md-3 p-5">
      <div class="member_avatar"
           style="background-image: url('https://scontent.fsgn8-4.fna.fbcdn.net/v/t1.15752-9/386887666_7371700746181998_5417130811793907535_n.png?_nc_cat=103&ccb=1-7&_nc_sid=8cd0a2&_nc_ohc=_oUgQiSmJIwAX8eviw_&_nc_ht=scontent.fsgn8-4.fna&oh=03_AdRZmNEatLjnfps_7kDMkW4Fsp0xwTW6lsczGhH0nO3Olg&oe=659A16EE')">

      </div>
    </div>
  </div>

</div>

<%@include file="../components/footer.jsp" %>

<script src="../js/about.js"></script>
</body>
</html>
