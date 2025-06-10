package Mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/storeUser")  // Maps this servlet to /storeUser URL
public class UserLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L; // ✅ Good practice

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get username from form input
        String username = request.getParameter("username");

        if (username != null && !username.trim().isEmpty()) {
            // ✅ Store username in session
            HttpSession session = request.getSession();
            session.setAttribute("user", username);

            // ✅ Redirect to welcome page
            response.sendRedirect("welcome.jsp");
        } else {
            // ❌ If username is empty, redirect back to form with message (optional)
            response.sendRedirect("index.jsp");
        }
    }
}