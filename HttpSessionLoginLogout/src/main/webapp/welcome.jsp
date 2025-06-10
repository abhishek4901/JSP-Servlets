<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*" %>

<%
    String name = null;

    if (session != null) {
        Object userObj = session.getAttribute("user");
        if (userObj != null) {
            name = userObj.toString();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome</title>
</head>
<body>
    <% if (name != null) { %>
        <h2>Welcome, <%= name %>!</h2>
      <a href="logout">Logout</a>

 <!-- Optional logout link if you add logout servlet -->
    <% } else { %>
        <h2>No username found. Please <a href="index.jsp">login again</a>.</h2>
    <% } %>
</body>
</html>