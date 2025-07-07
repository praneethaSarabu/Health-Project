<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.health.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Patient - Health Logger</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #f4f8fc;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
        }

        h2 {
            font-size: 28px;
            color: #1976d2;
            margin-bottom: 15px;
        }

        .top-buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 30px;
        }

        .top-buttons button {
            padding: 10px 18px;
            background-color: #1976d2;
            color: #fff;
            font-size: 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .top-buttons button:hover {
            background-color: #125ea9;
        }

        .search-bar {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 30px;
        }

        .search-bar input[type="text"] {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .search-bar button {
            padding: 10px 16px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            font-size: 14px;
            border-radius: 6px;
            cursor: pointer;
        }

        .search-bar button:hover {
            background-color: #388e3c;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            border-radius: 8px;
            overflow: hidden;
            background-color: #fff;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 12px 10px;
            text-align: center;
            font-size: 14px;
        }

        th {
            background-color: #e3f2fd;
            color: #333;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        td button {
            padding: 6px 12px;
            font-size: 13px;
            border-radius: 5px;
            background-color: #eeeeee;
            border: 1px solid #bbb;
            cursor: pointer;
            margin: 2px;
            transition: background-color 0.2s ease;
        }

        td button:hover {
            background-color: #cfd8dc;
        }

        .count-label {
            font-weight: bold;
            margin-bottom: 10px;
            font-size: 15px;
            color: #555;
        }

        .no-result {
            margin-top: 20px;
            text-align: center;
            color: #d32f2f;
        }

        form.inline {
            display: inline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Doctor Home Page</h2>

    <div class="top-buttons">
        <form action="viewPatients">
            <button type="submit">Home</button>
        </form>
        <form action="patientForm.jsp" method="get">
            <button type="submit">Add Patient</button>
        </form>
    </div>

    <h3 style="margin-bottom: 10px;">Search Patient</h3>
    <div class="search-bar">
        <form action="searchPatient" method="get">
            <input type="text" name="query" placeholder="Enter patient name, email, or phone..." required>
            <button type="submit">Search</button>
        </form>
    </div>

    <%
        List<Patient> patientList = (List<Patient>) request.getAttribute("patients");
        if (patientList != null && !patientList.isEmpty()) {
    %>
    <div class="count-label">Results Found: <%= patientList.size() %></div>
    <table>
        <thead>
            <tr>
                <th>Sl No</th>
                <th>ID</th>
                <th>Name / Age</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Diagnosis</th>
                <th>Remarks</th>
                <th>Gender</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                int count = 1;
                for (Patient p : patientList) {
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= p.getId() %></td>
                <td><%= p.getName() %> / <%= p.getAge() %></td>
                <td><%= p.getEmail() %></td>
                <td><%= p.getPhone() %></td>
                <td><%= p.getDiagnosis() %></td>
                <td><%= p.getRemarks() %></td>
                <td><%= p.getGender() %></td>
                <td>
                    <form class="inline" action="ManageVitals.jsp" method="get">
                        <input type="hidden" name="patientId" value="<%= p.getId() %>">
                        <button type="submit">Vitals</button>
                    </form>
                    <form class="inline" action="UpdatePatient.jsp" method="get">
                        <input type="hidden" name="patientId" value="<%= p.getId() %>">
                        <button type="submit">Update</button>
                    </form>
                    <form class="inline" action="DeletePatientServlet" method="post">
                        <input type="hidden" name="patientId" value="<%= p.getId() %>">
                        <button type="submit" onclick="return confirm('Are you sure you want to delete this patient?');">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <%
        } else if (patientList != null) {
    %>
    <div class="no-result">No matching patient found.</div>
    <%
        }
    %>
</div>
</body>
</html>
