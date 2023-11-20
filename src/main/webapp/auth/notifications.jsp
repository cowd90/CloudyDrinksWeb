<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>
  <h1 class="container"><%= request.getAttribute("notifications")+"" %></h1>
  <script type="text/javascript">
    setTimeout(function() {
      window.location.href = "auth/index.jsp";
    }, 2000);
  </script>
</body>
</html>