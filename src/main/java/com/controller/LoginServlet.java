package com.controller;

import com.health.dao.DoctorDAO;
import com.health.model.Doctor;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
//@WebServlet("login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        Doctor doctor = DoctorDAO.login(email, password);

        if (doctor != null) {
            HttpSession session = req.getSession();
            session.setAttribute("doctor", doctor);
            res.sendRedirect("adminHome.jsp");
        } else {
            req.setAttribute("error", "Invalid credentials");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, res);
        }
    }
}
