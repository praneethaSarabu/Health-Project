package com.controller;

import com.health.dao.PatientDAO;
import com.health.model.Patient;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet("updatePatient")
public class UpdatePatientServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Patient p = new Patient();
		p.setId(Integer.parseInt(req.getParameter("id")));
		p.setName(req.getParameter("name"));
		p.setEmail(req.getParameter("email"));
		p.setPhone(req.getParameter("phone"));
		p.setAge(Integer.parseInt(req.getParameter("age")));
		p.setGender(req.getParameter("gender"));
		p.setDiagnosis(req.getParameter("diagnosis"));
		p.setRemarks(req.getParameter("remarks"));

		boolean success = PatientDAO.updatePatient(p);
		if (success) {
		    req.getSession().setAttribute("msg", "Patient updated successfully!");
		    res.sendRedirect("viewPatients"); // Redirect if successful
		} else {
		    req.setAttribute("error", "Failed to Update patient");
		    RequestDispatcher rd = req.getRequestDispatcher("patientForm.jsp");
		    rd.forward(req, res); // Forward only if unsuccessful
		}

	}
}
