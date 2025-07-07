package com.controller;

import com.health.dao.PatientDAO;
import com.health.model.Patient;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
//@WebServlet("/viewPatients")
public class ViewPatientsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        List<Patient> list = PatientDAO.getAllPatients();
        req.setAttribute("patients", list);
        RequestDispatcher rd = req.getRequestDispatcher("managePatients.jsp");
        rd.forward(req, res);
    }
}
