package com.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.health.dao.VitalsDAO;
import com.health.model.Vitals;

//@WebServlet("/exportVitals")
public class ExportVitalsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Fetch all vitals (no filtering by patient)
        List<Vitals> vitals = VitalsDAO.getAllVitals(); 

        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=all_vitals.csv");

        PrintWriter out = response.getWriter();

        // 2. CSV Header
        out.println("Patient Name,Phone,BP Low,BP High,SPO2,Recorded On");

        // 3. Write each vital
        for (Vitals v : vitals) {
            out.printf("%s,%s,%d,%d,%d,%s%n",
                    v.getPatientName(),
                    v.getPhone(),
                    v.getBpLow(),
                    v.getBpHigh(),
                    v.getSpo2(),
                    v.getRecordedOn());
        }

        out.flush();
        out.close();
    }
}
