package com.controller;

import com.health.dao.PatientDAO;
import com.health.model.Patient;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
//@WebServlet("addPatient")
public class AddPatientServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        Patient p = new Patient();
        p.setName(req.getParameter("name"));
        p.setEmail(req.getParameter("email"));
        p.setPhone(req.getParameter("phone"));
        p.setAge(Integer.parseInt(req.getParameter("age")));
        p.setGender(req.getParameter("gender"));
        p.setDiagnosis(req.getParameter("diagnosis"));
        p.setRemarks(req.getParameter("remarks"));

        boolean success = PatientDAO.addPatient(p);

        if (success)
            res.sendRedirect("viewPatients");
        else {
            req.setAttribute("error", "Failed to add patient");
            RequestDispatcher rd = req.getRequestDispatcher("patientForm.jsp");
            rd.forward(req, res);
        }
    }
}

