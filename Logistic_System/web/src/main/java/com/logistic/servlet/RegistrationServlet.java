package com.logistic.servlet;

import com.logistic.remote.Register;
import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @EJB(lookup = "java:global/ear-1.0/com.logistic-web-1.0/RegisterBean")
    private Register register;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String userType = request.getParameter("role");


//        response.getWriter().write(username+" "+ email+" "+password+" "+utype);

       boolean reg = register.register(username, email, password, userType);
       if(reg){
           response.sendRedirect("index.jsp");
       }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().write("Register page");
    }
}
