package Mypackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current session, don't create if not exists
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Clear session
        }

        // Redirect to login page (index.jsp)
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
