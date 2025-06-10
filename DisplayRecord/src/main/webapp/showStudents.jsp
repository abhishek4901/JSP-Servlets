<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Student List</title>
</head>
<body>
    <h2>All Student Records</h2>
    <table border="1" cellpadding="10">
        <tr>
            <th>Name</th><th>Email</th>
        </tr>

        <%
            try (
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentdb", "root", "abhishek");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT name, email FROM student1");
            ) {
                Class.forName("com.mysql.cj.jdbc.Driver");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("name") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                out.println("<tr><td colspan='2' style='color:red;'>❌ Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>

    <br>
    <form action="index.jsp" method="get">
        <input type="submit" value="➕ Register New Student">
    </form>
</body>
</html>
