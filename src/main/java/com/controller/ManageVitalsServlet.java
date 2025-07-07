package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.health.dao.VitalsDAO;
import com.health.model.Vitals;

//@WebServlet("/manageVitals")
public class ManageVitalsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String pid = req.getParameter("patientId");
		List<Vitals> vitalsList;

		if (pid != null) {
			int patientId = Integer.parseInt(pid);
			vitalsList = VitalsDAO.getVitalsByPatientId(patientId);
		} else {
			vitalsList = VitalsDAO.getAllVitals(); // fallback
		}

		req.setAttribute("vitals", vitalsList);
		RequestDispatcher dispatcher = req.getRequestDispatcher("manageVitals.jsp");
		dispatcher.forward(req, res);
	}
}
