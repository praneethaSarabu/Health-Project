<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.health.model.Patient" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Vitals - Health Logger</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background-color: #f4f8fc;
            margin: 0;
            padding: 40px 20px;
        }

        .form-container {
            max-width: 450px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            color: #1976d2;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #607d8b;
            margin-bottom: 30px;
            font-size: 14px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #333;
        }

        select, input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.2s ease;
        }

        select:focus, input[type="text"]:focus {
            border-color: #42a5f5;
            outline: none;
        }

        button[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #1976d2;
            color: white;
            font-size: 15px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #125ea9;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Health Logger</h2>
    <div class="subtitle">Add Patient's Vital Information</div>

    <form action="addVitals" method="post">
        <label for="patientId">Select Patient</label>
        <select name="patientId" id="patientId" required>
            <%
                List<Patient> patientList = (List<Patient>) request.getAttribute("patients");
                if (patientList != null && !patientList.isEmpty()) {
                    for (Patient p : patientList) {
            %>
                <option value="<%= p.getId() %>"><%= p.getName() %> (ID: <%= p.getId() %>)</option>
            <%
                    }
                } else {
            %>
                <option disabled>No patients available</option>
            <%
                }
            %>
        </select>

        <label for="bpLow">BP Low</label>
        <input type="text" name="bpLow" id="bpLow" placeholder="e.g., 70" required>

        <label for="bpHigh">BP High</label>
        <input type="text" name="bpHigh" id="bpHigh" placeholder="e.g., 120" required>

        <label for="spo2">SPO2</label>
        <input type="text" name="spo2" id="spo2" placeholder="e.g., 98" required>

        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
