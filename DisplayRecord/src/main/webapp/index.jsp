<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register Student</title>
</head> 
<body> 
    <h2>Student Registration Form</h2>
    <form method="post">
        Name: <input type="text" name="name" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        <input type="submit" name="register" value="Register">
    </form>

    <%
        if (request.getParameter("register") != null) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ Load driver first

                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentdb", "root", "abhishek");

                PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO student1 (name, email) VALUES (?, ?)");
                
                ps.setString(1, name);
                ps.setString(2, email);

                int result = ps.executeUpdate();
                if (result > 0) {
                    out.println("<p style='color:green;'>✅ Student Registered Successfully!</p>");
                } else {
                    out.println("<p style='color:red;'>❌ Registration Failed!</p>");
                }

                ps.close();
                conn.close();

            } catch (Exception e) {
                out.println("<p style='color:red;'>❌ Error: " + e.getMessage() + "</p>");
            }
        }
    %>

    <br>
    <form action="showStudents.jsp" method="get">
        <input type="submit" value="📋 Show All Students">
    </form>
</body>
</html>
