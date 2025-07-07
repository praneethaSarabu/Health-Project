package com.controller;

import com.health.dao.VitalsDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

//@WebServlet("/DeleteVitalServlet")
public class DeleteVitalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int vitalId = Integer.parseInt(request.getParameter("vitalId"));

        // Optional: capture patientId to redirect back to correct patient view
        String patientId = request.getParameter("patientId");

        boolean deleted = VitalsDAO.deleteVitalById(vitalId);

        if (deleted) {
            response.sendRedirect("manageVitals?pid=" + patientId);
        } else {
            response.getWriter().write("Failed to delete the record.");
        }
    }
}
