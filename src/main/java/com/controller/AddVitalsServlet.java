package com.controller;

import com.health.dao.VitalsDAO;
import com.health.model.Vitals;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet("addVitals")
public class AddVitalsServlet extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Vitals v = new Vitals();
		v.setPatientId(Integer.parseInt(req.getParameter("patientId")));
		v.setBpHigh(Integer.parseInt(req.getParameter("bpHigh")));
		v.setBpLow(Integer.parseInt(req.getParameter("bpLow")));
		v.setSpo2(Integer.parseInt(req.getParameter("spo2")));

		boolean success = VitalsDAO.addVitals(v);

		if (success)
			// res.sendRedirect("manageVitals.jsp?patientId=" + v.getPatientId());
			res.sendRedirect("manageVitals?pid=" + v.getPatientId());

		else
			req.getRequestDispatcher("vitalForm.jsp").forward(req, res);
	}
}
