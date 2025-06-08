<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Login Form</title>
</head>
<body>
    <h2>Enter Your Username</h2>
   <form method="post">
        Enter your name: <input type="text" name="username" />
        <input type="submit" value="Submit" />
    </form>

    <%
        String user = request.getParameter("username");
        if(user != null && !user.trim().equals("")) {
    %>
        <h3>Welcome  <%= user %> 😎</h3>
    <%
        }
    %>
</body>
</html>
