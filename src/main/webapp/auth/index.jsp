<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.GsonBuilder" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Authentication</title>
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
    <link rel="stylesheet" href="<%=url%>/css/auth.css" />
</head>
<body>

<%
    String signInError = request.getAttribute("signInError") + "";
    ArrayList<String> signUpError = (ArrayList<String>) request.getAttribute("signUpError");
    String username = request.getAttribute("username") + "";
    String usernameSignUp = request.getAttribute("usernameSignUp") + "";
    String email = request.getAttribute("email") + "";


    signInError = (!signInError.equals("null")) ? signInError : "";
    username = (!username.equals("null")) ? username : "";
    usernameSignUp = (!usernameSignUp.equals("null")) ? usernameSignUp : "";
    email = (!email.equals("null")) ? email : "";

%>

<div class="page-container">
    <div class="layer">
        <div class="d-flex justify-content-center">
            <div class="auth-wrapper">

                <!--<editor-fold desc="Form đăng nhập">-->
                <form id="sign-in" action="<%=url%>/user-controller" method="post">
                    <input type="hidden" name="action" value="sign-in">
                    <h2 class="title">Sign in</h2>
                    <div class="text-danger" id="error-sign-in"><%= signInError %></div>
                    <div class="d-flex flex-column gap-3">
                        <div class="input-wrapper">
                            <input
                                    type="text"
                                    name="username"
                                    id="username"
                                    placeholder=""
                                    value="<%=username%>"
                            />
                            <label for="username">Username</label>
                        </div>
                        <div class="input-wrapper">
                            <input
                                    type="password"
                                    name="password"
                                    id="password"
                                    placeholder=""
                            />
                            <label for="password">Password</label>
                        </div>
                        <button type="submit">Login</button>
                        <!--<editor-fold desc="Đăng nhập bằng phương thức khác">-->
                        <div
                                class="other-methods d-flex justify-content-center gap-3 mt-4"
                        >
                            <div
                                    class="icon-wrapper d-flex justify-content-center align-items-center"
                                    title="Login with Google"
                                    onclick=""
                            >
                                <svg
                                        stroke="currentColor"
                                        fill="currentColor"
                                        stroke-width="0"
                                        version="1.1"
                                        x="0px"
                                        y="0px"
                                        viewBox="0 0 48 48"
                                        enable-background="new 0 0 48 48"
                                        height="30"
                                        width="30"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            fill="#FFC107"
                                            d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12
                        c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24
                        c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"
                                    ></path>
                                    <path
                                            fill="#FF3D00"
                                            d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657
                        C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"
                                    ></path>
                                    <path
                                            fill="#4CAF50"
                                            d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36
                        c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"
                                    ></path>
                                    <path
                                            fill="#1976D2"
                                            d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571
                        c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"
                                    ></path>
                                </svg>
                            </div>
                            <div
                                    class="icon-wrapper d-flex justify-content-center align-items-center"
                                    title="Login with Github"
                                    onclick=""
                            >
                                <svg
                                        stroke="currentColor"
                                        fill="black"
                                        stroke-width="0"
                                        viewBox="0 0 496 512"
                                        height="30"
                                        width="30"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"
                                    ></path>
                                </svg>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        <p class="form-footer">
                            New to Cloudy Drinks? <span>Sign up now</span>.
                        </p>
                    </div>
                </form>
                <!--</editor-fold>-->

                <!--<editor-fold desc="Form đăng nhập">-->
                <form id="register" action="<%=url%>/user-controller" class="hidden" method="post">
                    <%
                        if (!(signUpError == null)) {
                    %>
                    <script>
                        document.getElementById('sign-in').classList.toggle('hidden');
                        document.getElementById('register').classList.remove('hidden');
                    </script>
                    <div id="dialog-container">
                        <script>
                            // Phải để trong hàm window.onload để code bên trong thực thi sau code của file auth.js (code khởi tạo các hàm)
                            window.onload = () => {
                                let typeOfDialog = "error"; // success, error
                                let title = "ERROR";
                                // Mỗi phần tử của array sẽ được render trong 1 thẻ p
                                let arrayOfMess = [
                                    <%
                                        Gson gson = new Gson();
                                    %>
                                ];
                                let buttonContent = "OK";

                                createDialog(typeOfDialog, title, <%=gson.toJson(signUpError)%>, buttonContent);
                                showDialog();
                            }
                        </script>

                    </div>
                    <%
                        }
                    %>
                    <input type="hidden" name="action" value="sign-up">
                    <h2 class="title">Register</h2>
                    <div class="d-flex flex-column gap-3">
                        <div class="input-wrapper">
                            <input
                                    type="text"
                                    name="username"
                                    id="res-username"
                                    placeholder=""
                                    value="<%=usernameSignUp%>"
                            />
                            <label for="res-username">Username</label>
                        </div>
                        <div class="input-wrapper">
                            <input type="email" name="email" id="email" placeholder="" value="<%=email%>"/>
                            <label for="email">Email</label>
                        </div>
                        <div class="input-wrapper">
                            <input
                                    type="password"
                                    name="password"
                                    id="res-password"
                                    placeholder=""
                            />
                            <label for="res-password">Password</label>
                        </div>
                        <div class="input-wrapper">
                            <input
                                    type="password"
                                    name="confPwd"
                                    id="confPwd"
                                    placeholder=""
                            />
                            <label for="confPwd">Confirm Password</label>
                        </div>
                        <button type="submit">Sign up</button>
                        <!--<editor-fold desc="Đăng ký bằng phương thức khác">-->
                        <div
                                class="other-methods d-flex justify-content-center gap-3 mt-4"
                        >
                            <div
                                    class="icon-wrapper d-flex justify-content-center align-items-center"
                                    title="Login with Google"
                                    onclick=""
                            >
                                <svg
                                        stroke="currentColor"
                                        fill="currentColor"
                                        stroke-width="0"
                                        version="1.1"
                                        x="0px"
                                        y="0px"
                                        viewBox="0 0 48 48"
                                        enable-background="new 0 0 48 48"
                                        height="30"
                                        width="30"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            fill="#FFC107"
                                            d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12
                        c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24
                        c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"
                                    ></path>
                                    <path
                                            fill="#FF3D00"
                                            d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657
                        C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"
                                    ></path>
                                    <path
                                            fill="#4CAF50"
                                            d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36
                        c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"
                                    ></path>
                                    <path
                                            fill="#1976D2"
                                            d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571
                        c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"
                                    ></path>
                                </svg>
                            </div>
                            <div
                                    class="icon-wrapper d-flex justify-content-center align-items-center"
                                    title="Login with Github"
                                    onclick=""
                            >
                                <svg
                                        stroke="currentColor"
                                        fill="black"
                                        stroke-width="0"
                                        viewBox="0 0 496 512"
                                        height="30"
                                        width="30"
                                        xmlns="http://www.w3.org/2000/svg"
                                >
                                    <path
                                            d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3.3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5.3-6.2 2.3zm44.2-1.7c-2.9.7-4.9 2.6-4.6 4.9.3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3.7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3.3 2.9 2.3 3.9 1.6 1 3.6.7 4.3-.7.7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3.7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3.7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"
                                    ></path>
                                </svg>
                            </div>
                        </div>
                        <!--</editor-fold>-->
                        <p class="form-footer">
                            Already have an account? <span>Go to login</span>.
                        </p>
                    </div>
                </form>
                <!--</editor-fold>-->

            </div>

            <!--<editor-fold desc="Container chứa dialog của trang">-->
<%--            <div id="dialog-container">--%>
<%--                <script>--%>
<%--                    // Phải để trong hàm window.onload để code bên trong thực thi sau code của file auth.js (code khởi tạo các hàm)--%>
<%--                    window.onload = () => {--%>
<%--                        let typeOfDialog = "success"; // success, error--%>
<%--                        let title = "SUCCESS";--%>
<%--                        // Mỗi phần tử của array sẽ được render trong 1 thẻ p--%>
<%--                        let arrayOfMess = [--%>
<%--                            "Line 1",--%>
<%--                            "Now you can use this account to log in."--%>
<%--                        ];--%>
<%--                        let buttonContent = "Continue";--%>

<%--                        createDialog(typeOfDialog, title, arrayOfMess, buttonContent);--%>
<%--                        showDialog();--%>
<%--                    }--%>
<%--                </script>--%>

<%--            </div>--%>
            <!--</editor-fold>-->

        </div>
    </div>
</div>

<!-- Dùng để ngăn điều hướng của phương thức post (tạm thời trên fe) -->
<iframe
        name="hiddenFrame"
        width="0"
        height="0"
        border="0"
        style="display: none"
></iframe>

<script defer src="<%=url%>/js/auth.js"></script>

</body>
</html>