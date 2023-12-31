<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thay đổi mật khẩu | Cloudy Drinks</title>
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

    <% String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath(); %>

    <link rel="stylesheet" href="<%=url%>/css/global.css" />
    <link rel="stylesheet" href="<%=url%>/css/actions.css">
</head>
<body>

<div class="page-container">
    <div class="layer">
        <div class="d-flex justify-content-center">
            <div class="action-wrapper">
                <form id="change-psw" action="<%=url%>/user-controller" method="post">
                    <%
                        ArrayList<String> error = new ArrayList<>();
                        error = (ArrayList<String>) request.getAttribute("error");
                        System.out.println(error);
                        if (error != null) {
                    %>
                    <div id="dialog-container">
                        <script>
                            window.onload = () => {
                                <%
                                    Gson gson = new Gson();
                                %>
                                createDialog("error", "ERROR", <%=gson.toJson(error)%>, "OK");
                                showDialog();
                            }
                        </script>

                    </div>
                    <%
                        }
                    %>
                    <input type="hidden" name="action" value="change-password">
                    <h2 class="title">Change Password</h2>
                    <div class="d-flex flex-column gap-3">
                        <div class="input-wrapper">
                            <input type="password" name="oldPass" id="oldPass" placeholder=""/>
                            <label for="oldPass">Old Password</label>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-wrapper">
                            <input type="password" name="newPass" id="newPass" placeholder=""/>
                            <label for="newPass">New Password</label>
                            <span class="form-message"></span>
                        </div>
                        <div class="input-wrapper">
                            <input type="password" name="confPwd" id="confPwd" placeholder=""/>
                            <label for="confPwd">Confirm Password</label>
                            <span class="form-message"></span>
                        </div>
                        <button type="submit" id="update">Update</button>
                    </div>
                </form>
                <!--</editor-fold>-->
            </div>
        </div>
    </div>
</div>

<script src="<%=url%>/js/actions.js"></script>
<script src="<%=url%>/js/validator.js"></script>
<script>
    Validator({
        form: "#change-psw",
        formGroupSelector: ".input-wrapper",
        message: ".form-message",
        rules: [
            Validator.isRequired("#oldPass",
                "Vui lòng nhập mật khẩu hiện tại"),
            Validator.isRequired("#newPass",
                "Vui lòng nhập mật khẩu mới"),
            Validator.isRequired("#confPwd",
                "Vui lòng xác nhận lại mật khẩu"),
            Validator.isConfirmed('#confPwd',
                '#change-psw #newPass',
                'Nhập lại mật khẩu không chính xác'),
        ],
        // onSubmit: function (data) {
        //     // callAPI
        //     console.log(data);
        // }
    });
</script>

</body>
</html>
