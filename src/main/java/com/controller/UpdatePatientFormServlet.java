package com.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.health.dao.PatientDAO;
import com.health.model.Patient;

//@WebServlet("/updatePatientForm")
public class UpdatePatientFormServlet extends HttpServlet {
    private PatientDAO patientDAO;

    public void init() {
        patientDAO = new PatientDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("patientId"));
        Patient patient = patientDAO.getPatientById(id);
        request.setAttribute("patient", patient);
        //RequestDispatcher dispatcher = request.getRequestDispatcher("updatePatientForm.jsp");
        RequestDispatcher dispatcher = request.getRequestDispatcher("patientForm.jsp");
        dispatcher.forward(request, response);
    }
}
