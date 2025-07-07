<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.health.model.Vitals" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Home Page - Vitals</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: #f4f8fc;
            padding: 30px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        h2 {
            font-size: 26px;
            color: #1565c0;
        }

        .header form button {
            padding: 8px 16px;
            background-color: #f44336;
            color: #fff;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        .header form button:hover {
            background-color: #d32f2f;
        }

        .top-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 30px 0 20px;
        }

        .section-title {
            font-size: 20px;
            font-weight: bold;
            color: #333;
        }

        .top-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }

        .top-buttons button {
            padding: 8px 16px;
            background-color: #1976d2;
            color: #fff;
            border: none;
            border-radius: 6px;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .top-buttons button:hover {
            background-color: #125ea9;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 12px 10px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #e3f2fd;
            font-weight: bold;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .delete-btn {
            padding: 6px 12px;
            border: none;
            background-color: #eeeeee;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
            transition: background-color 0.2s ease;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
            color: #fff;
        }

        #vitalsChart {
            margin-top: 40px;
        }
    </style>
</head>
<body>

<div class="header">
    <h2>Doctor Home Page</h2>
    <form action="logout" method="post">
        <button type="submit">Logout</button>
    </form>
</div>

<div class="top-bar">
    <div class="section-title">Vitals</div>
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
        <form action="ViewVitalsAlertsServlet" method="get">
            <button type="submit">Vital Alerts</button>
        </form>
    </div>
</div>

<canvas id="vitalsChart" width="600" height="300"></canvas>

<%
    List<Vitals> vitals = (List<Vitals>) request.getAttribute("vitals");
%>

<script>
    const labels = [];
    const bpLowData = [];
    const bpHighData = [];
    const spo2Data = [];

    <% if (vitals != null) {
        for (Vitals v : vitals) { %>
            labels.push("<%= v.getRecordedOn() %>");
            bpLowData.push(<%= v.getBpLow() %>);
            bpHighData.push(<%= v.getBpHigh() %>);
            spo2Data.push(<%= v.getSpo2() %>);
    <%  }
    } %>

    const ctx = document.getElementById('vitalsChart').getContext('2d');
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'BP Low',
                    data: bpLowData,
                    borderColor: '#0288d1',
                    fill: false,
                    tension: 0.3
                },
                {
                    label: 'BP High',
                    data: bpHighData,
                    borderColor: '#43a047',
                    fill: false,
                    tension: 0.3
                },
                {
                    label: 'SPO2',
                    data: spo2Data,
                    borderColor: '#ef5350',
                    fill: false,
                    tension: 0.3
                }
            ]
        },
        options: {
            responsive: true,
            plugins: {
                title: {
                    display: true,
                    text: "Patient's Vitals"
                }
            },
            scales: {
                y: {
                    title: {
                        display: true,
                        text: 'Vitals'
                    }
                },
                x: {
                    title: {
                        display: true,
                        text: 'Recorded On'
                    }
                }
            }
        }
    });
</script>

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
        if (vitals != null && !vitals.isEmpty()) {
            int i = 1;
            for (Vitals v : vitals) {
    %>
    <tr>
        <td><%= i++ %></td>
        <td><%= v.getPatientName() %></td>
        <td><%= v.getPhone() %></td>
        <td><%= v.getBpLow() %></td>
        <td><%= v.getBpHigh() %></td>
        <td><%= v.getSpo2() %></td>
        <td><%= v.getRecordedOn() %></td>
        <td>
           <form action="DeleteVitalServlet" method="post" style="display:inline;">
    		<input type="hidden" name="vitalId" value="<%= v.getId() %>">
    		<input type="hidden" name="patientId" value="<%= request.getParameter("patientId") %>">
    		<button class="delete-btn" type="submit" onclick="return confirm('Are you sure you want to delete this vital?');">Delete</button>
			</form>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr><td colspan="8">No vitals found.</td></tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
