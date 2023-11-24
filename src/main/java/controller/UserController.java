package controller;

import database.UserDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import util.Email;
import util.Encode;
import util.RandomNumber;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "UserController", value = "/user-controller")
public class UserController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");
        if (action.equals("sign-in")) {
            signIn(request, response);
        } else if (action.equals("sign-out")) {
            signOut(request, response);
        } else if (action.equals("sign-up")) {
            signUp(request, response);
        } else if (action.equals("verify-account")) {
            confirmAccount(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void signIn(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            String username = request.getParameter("username");
            String pwd = request.getParameter("password");
            pwd = Encode.ToSHA1(pwd);
            ArrayList<String> errorList = new ArrayList<>();

            User user = new User();
            user.setUsername(username);
            user.setPassword(pwd);

            UserDAO userDAO = new UserDAO();
            User newUser = userDAO.selectByUsernameAndPwd(user);
            String url = "";
            if (newUser != null && newUser.isVerified()) {
                HttpSession session = request.getSession();
                session.setAttribute("user", newUser);
                url = "/index.jsp";
            } else if (username.isEmpty() || pwd.isEmpty()) {
                errorList.add("Please fill all the fields!");
                url = "/auth/index.jsp";
            } else if (newUser != null && !newUser.isVerified()) {
                errorList.add("You have not verified your account. Please check your EMAIL to verify!");
                url = "/auth/index.jsp";
            } else {
                errorList.add("The username or password is incorrect");
                url = "/auth/index.jsp";
            }

            request.setAttribute("signInError", errorList);
            request.setAttribute("username", username);
            request.setAttribute("password", pwd);

            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void signOut(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession();
            session.invalidate();

            String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
            response.sendRedirect(url + "/index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void signUp(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String conPassword = request.getParameter("confPwd");

            request.setAttribute("usernameSignUp", username);
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("conPassword", conPassword);

            String url;
            ArrayList<String> errorList = new ArrayList<>();
            UserDAO userDAO = new UserDAO();

            if (userDAO.checkUsernameExist(username)) {
                errorList.add("The username is already being used");
            }

            // Catch error of email
            Pattern emailPattern = Pattern.compile("\\w+@\\w+(\\.\\w+)+(\\.\\w+)*");
            Matcher emailMatcher = emailPattern.matcher(email);
            if (!emailMatcher.matches()) {
                errorList.add("Invalid email address");
            }

            if (password.length() < 8) {
                errorList.add("Your password must be at least 8 characters");
            }

            if (username.isEmpty() || email.isEmpty() || password.isEmpty() || conPassword.isEmpty()) {
                errorList.add("Please fill all the fields!");
            }

            if (!password.equals(conPassword)) {
                errorList.add("Passwords do not match");
            } else {
                password = Encode.ToSHA1(password);
            }

            request.setAttribute("signUpError", errorList);

            if (!errorList.isEmpty()) {
                url = "/auth/index.jsp";
            } else {
                Random random = new Random();
                String userId = System.currentTimeMillis() + random.nextInt(1000) + "";

                User user = new User(userId, username, password, email);
                if (userDAO.insert(user) > 0) {
                    String verificationCode = RandomNumber.getRandomNumber();
                    Date todaysDate = new Date(new java.util.Date().getTime());
                    Calendar c = Calendar.getInstance();
                    c.setTime(todaysDate);
                    c.add(Calendar.DATE, 1);
                    Timestamp authCodeValidTime = new Timestamp(c.getTimeInMillis());

                    boolean isVerified = false;

                    user.setVerificationCode(verificationCode);
                    user.setAuthCodeValidTime(authCodeValidTime);
                    user.setVerified(isVerified);

                    if (userDAO.updateVerifyInformation(user) > 0) {
                        Email.sendEmail(user.getEmail(), "Xác thực tài khoản tại Cloudy Drinks", getContent(user));
                    }
                }
                url = "/auth/success.jsp";
            }
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void confirmAccount(HttpServletRequest request, HttpServletResponse response) {
        try {
            String userId = request.getParameter("userId");
            String verificationCode = request.getParameter("verificationCode");

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());

            UserDAO userDAO = new UserDAO();

            User u = new User();
            u.setUserId(userId);
            User user = userDAO.selectById(u);

            String msg = "";
            if (user != null) {
                if (currentTime.compareTo(user.getAuthCodeValidTime()) < 0) {
                    if (user.getVerificationCode().equals(verificationCode)) {
                        user.setVerified(true);
                        userDAO.updateVerifyInformation(user);
                        msg = "Xác thực tài khoản thành công";
                    }
                } else {
                    msg = "Đã quá thời gian xác thực, vui lòng đăng ký lại";
                }
            }

            String url = "/auth/notifications.jsp";
            request.setAttribute("notifications", msg);
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);

        } catch (ServletException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public static String getContent(User user) {
        String link = "http://localhost:8080/CloudyDrinksWeb_war_exploded/user-controller?action=verify-account&userId=" + user.getUserId()+"&verificationCode="+user.getVerificationCode();
        String content = "<p>The Cloudy Drinks xin ch&agrave;o bạn <strong>"+user.getUsername()+"</strong>,</p>\r\n"
                + "<p>Vui l&ograve;ng x&aacute;c thực t&agrave;i khoản của bạn bằng c&aacute;ch nhập m&atilde; <strong>"+user.getVerificationCode()+"</strong>, hoặc click trực tiếp v&agrave;o đường link sau đ&acirc;y:</p>\r\n"
                + "<p><a href=\""+link+"\">"+link+"</a></p>\r\n"
                + "<p>Đ&acirc;y l&agrave; email tự động, vui l&ograve;ng kh&ocirc;ng phản hồi email n&agrave;y.</p>\r\n"
                + "<p>Tr&acirc;n trọng cảm ơn.</p>";

        return content;
    }
}
