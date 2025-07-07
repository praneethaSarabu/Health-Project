<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.health.model.Vitals" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vitals Alerts</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #f4f8fc;
            padding: 40px 20px;
            margin: 0;
        }

        h2 {
            color: #d32f2f;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #1976d2;
        }

        .top-buttons {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .top-buttons button {
            padding: 8px 16px;
            font-size: 14px;
            background-color: #1976d2;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .top-buttons button:hover {
            background-color: #125ea9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
            font-size: 14px;
        }

        th {
            background-color: #e3f2fd;
            font-weight: 600;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .alert {
            background-color: #ffebee;
            color: #d32f2f;
            font-weight: bold;
        }

        .button {
            padding: 6px 14px;
            font-size: 13px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
        }

        .delete-btn {
            background-color: #e0e0e0;
            color: #000;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
            color: #fff;
        }

        form {
            display: inline;
        }

        .no-alerts {
            text-align: center;
            padding: 20px;
            font-size: 15px;
            color: #555;
        }
    </style>
</head>
<body>

<h2>Vital Alerts</h2>

<div class="top-bar">
    <div class="section-title">Critical Vitals</div>
    <div class="top-buttons">
        <form action="viewPatients">
            <button type="submit">Manage Patients</button>
        </form>
        <form action="exportVitals" method="get">
            <input type="hidden" name="patientId" value="<%= request.getParameter("patientId") %>">
            <button type="submit">Export</button>
        </form>
        <form action="vitalForm" method="get">
            <input type="hidden" name="patientId" value="<%= request.getParameter("patientId") %>">
            <button type="submit">Record New Vital</button>
        </form>
    </div>
</div>

<table>
    <thead>
    <tr>
        <th>Sr. No</th>
        <th>Name</th>
        <th>Phone</th>
        <th>BP Low</th>
        <th>BP High</th>
        <th>SPO2</th>
        <th>Recorded On</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Vitals> alertVitals = (List<Vitals>) request.getAttribute("alertVitals");
        int sr = 1;
        if (alertVitals != null && !alertVitals.isEmpty()) {
            for (Vitals v : alertVitals) {
                int bpLow = v.getBpLow();
                int bpHigh = v.getBpHigh();
                int spo2 = v.getSpo2();
    %>
    <tr>
        <td><%= sr++ %></td>
        <td><%= v.getPatientName() %></td>
        <td><%= v.getPhone() %></td>
        <td class="<%= (bpLow < 60) ? "alert" : "" %>"><%= bpLow %></td>
        <td class="<%= (bpHigh > 140) ? "alert" : "" %>"><%= bpHigh %></td>
        <td class="<%= (spo2 < 90) ? "alert" : "" %>"><%= spo2 %></td>
        <td><%= v.getRecordedOn() %></td>
        <td>
            <form action="DeleteVitalServlet" method="post">
                <input type="hidden" name="vitalId" value="<%= v.getId() %>">
                <input type="hidden" name="patientId" value="<%= v.getPatientId() %>">
                <input type="submit" value="Delete" class="button delete-btn" onclick="return confirm('Delete this vital record?');">
            </form>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="8" class="no-alerts">No vital alerts found.</td></tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
