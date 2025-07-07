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

//@WebServlet("/ViewVitalsAlertsServlet")
public class ViewVitalsAlertsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Vitals> alertVitals = VitalsDAO.getAbnormalVitals();
        request.setAttribute("alertVitals", alertVitals);

        // Forward to JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("vitalAlerts.jsp");
        dispatcher.forward(request, response);
    }
}
