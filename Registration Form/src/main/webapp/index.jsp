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
        ID: <input type="number" name="id" required><br><br>
        Name: <input type="text" name="name" required><br><br>
        Age: <input type="number" name="age" min="1" max="120" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        <input type="submit" name="register" value="Register">
    </form>

    <%
        if (request.getParameter("register") != null) {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String email = request.getParameter("email");

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/studentdb", "root", "abhishek");

                PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO students (id, name, age, email) VALUES (?, ?, ?, ?)");

                ps.setInt(1, id);
                ps.setString(2, name);
                ps.setInt(3, age);
                ps.setString(4, email);

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

    
</body>
</html>
