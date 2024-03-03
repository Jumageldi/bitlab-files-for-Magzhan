package kz.bitlab.shop.users.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kz.bitlab.shop.users.entity.User;
import kz.bitlab.shop.users.service.UserService;

import java.io.IOException;

@WebServlet("/signIn")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signIn.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password"); // Hash the password before checking
        User user = UserService.login(email, password);

        if (user == null) {
            resp.sendRedirect("/signIn?invalidCredentials=true");
            return;
        }
        HttpSession session = req.getSession();
        session.setAttribute("currentUser", user); // Store the User object, not just the ID
        resp.sendRedirect("/profile"); // Redirect to the ProfileServlet
    }
}
