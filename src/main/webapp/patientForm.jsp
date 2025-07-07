<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.health.model.Patient" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("doctor") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Patient patient = (Patient) request.getAttribute("patient");
    boolean isUpdate = (patient != null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= isUpdate ? "Update" : "Add" %> Patient</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 40px 20px;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: #f4f8fc;
            color: #333;
        }

        .title-container {
            text-align: center;
            margin-bottom: 40px;
        }

        .title-container h1 {
            font-size: 32px;
            color: #1976d2;
            margin-bottom: 5px;
        }

        .title-container p {
            color: #607d8b;
            font-size: 14px;
        }

        form {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.07);
        }

        label {
            display: block;
            margin-top: 16px;
            margin-bottom: 6px;
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border-color 0.2s ease;
        }

        input:focus, textarea:focus {
            outline: none;
            border-color: #42a5f5;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        .gender-options {
            margin-top: 10px;
            display: flex;
            gap: 20px;
        }

        .gender-options label {
            display: flex;
            align-items: center;
            gap: 6px;
            font-weight: normal;
        }

        .submit-btn {
            margin-top: 30px;
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

        .submit-btn:hover {
            background-color: #1565c0;
        }

        .error-message {
            text-align: center;
            color: #d32f2f;
            font-size: 14px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>

<% String error = (String) request.getAttribute("error");
   if (error != null) { %>
   <div class="error-message"><%= error %></div>
<% } %>

<div class="title-container">
    <h1>Health Logger</h1>
    <p><%= isUpdate ? "Update Existing Patient Details" : "Add New Patient Record" %></p>
</div>

<form action="<%= isUpdate ? "updatePatient" : "addPatient" %>" method="post">
    <% if (isUpdate) { %>
        <input type="hidden" name="id" value="<%= patient.getId() %>">
    <% } %>

    <label for="name">Full Name</label>
    <input type="text" id="name" name="name" required value="<%= isUpdate ? patient.getName() : "" %>">

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required value="<%= isUpdate ? patient.getEmail() : "" %>">

    <label for="phone">Phone Number</label>
    <input type="text" id="phone" name="phone" required value="<%= isUpdate ? patient.getPhone() : "" %>">

    <label for="age">Age</label>
    <input type="number" id="age" name="age" required min="0" value="<%= isUpdate ? patient.getAge() : "" %>">

    <label for="diagnosis">Diagnosis</label>
    <input type="text" id="diagnosis" name="diagnosis" required value="<%= isUpdate ? patient.getDiagnosis() : "" %>">

    <label for="remarks">Remarks</label>
    <textarea id="remarks" name="remarks" placeholder="Enter medical notes or history..."><%= isUpdate ? patient.getRemarks() : "" %></textarea>

    <label>Gender</label>
    <div class="gender-options">
        <label><input type="radio" name="gender" value="Male" <%= isUpdate && "Male".equalsIgnoreCase(patient.getGender()) ? "checked" : "" %>> Male</label>
        <label><input type="radio" name="gender" value="Female" <%= isUpdate && "Female".equalsIgnoreCase(patient.getGender()) ? "checked" : "" %>> Female</label>
    </div>

    <button class="submit-btn" type="submit"><%= isUpdate ? "Update Patient" : "Add Patient" %></button>
</form>

</body>
</html>
