package com.logistic.servlet;

import com.logistic.enums.UserType;
import com.logistic.entity.User;
import com.logistic.remote.Login;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/LoginBean")
    private Login login;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = login.login(email, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if (req.getUserPrincipal() == null) {
                String userType = user.getUserType();

                if (userType.equalsIgnoreCase(UserType.superadmin.name())) {
                    req.login("superadmin", "superadmin1234");
                } else if (userType.equalsIgnoreCase(UserType.admin.name())) {
                    req.login("admin", "admin1234");
                } else if (userType.equalsIgnoreCase(UserType.user.name())) {
                    req.login("user", "user1234");
                }
            }

            resp.sendRedirect("dashboard");
        } else {
            resp.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
