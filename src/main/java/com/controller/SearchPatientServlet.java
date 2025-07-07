package com.controller;

import com.health.dao.PatientDAO;
import com.health.model.Patient;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
//@WebServlet("searchPatient")
public class SearchPatientServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String keyword = req.getParameter("query");
        List<Patient> result = PatientDAO.searchPatients(keyword);
        
        req.setAttribute("patients", result);
        RequestDispatcher rd = req.getRequestDispatcher("searchPatient.jsp");
        rd.forward(req, res);
    }
}
