package com.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.health.dao.PatientDAO;

//@WebServlet("/DeletePatientServlet")
public class DeletePatientServlet extends HttpServlet {

    private PatientDAO patientDAO;

    @Override
    public void init() throws ServletException {
        patientDAO = new PatientDAO(); // Or use dependency injection if you're managing DAO beans
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("patientId");

        try {
            int id = Integer.parseInt(idStr);
            System.out.println(id);
            boolean deleted = patientDAO.deletePatientById(id); // You'll implement this
            
            if (deleted) {
                request.getSession().setAttribute("msg", "Patient deleted successfully.");
            } else {
                request.getSession().setAttribute("msg", "Patient not found or couldn't be deleted.");
            }
        } catch (Exception e) {
            request.getSession().setAttribute("msg", "Error while deleting patient.");
            e.printStackTrace();
        }

        response.sendRedirect("viewPatients"); // Refresh the list
    }
}
