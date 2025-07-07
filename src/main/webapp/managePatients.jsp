<%@ page session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.health.model.Patient"%>
<%
if (session.getAttribute("doctor") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Patients</title>
<style>
    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', Tahoma, sans-serif;
        background-color: #f7f9fc;
        padding: 30px;
        margin: 0;
    }

    .container {
        max-width: 1100px;
        margin: auto;
        background: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.07);
    }

    h1 {
        color: #1565c0;
        font-size: 28px;
        margin-bottom: 25px;
    }

    .button-bar {
        display: flex;
        flex-wrap: wrap;
        gap: 12px;
        margin-bottom: 20px;
        align-items: center;
    }

    .button-bar button {
        padding: 10px 18px;
        font-size: 14px;
        font-weight: 500;
        background-color: #1976d2;
        color: #fff;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .button-bar button:hover {
        background-color: #1565c0;
    }

    .count {
        font-weight: bold;
        color: #333;
        margin-right: auto;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
    }

    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: center;
        font-size: 14px;
    }

    th {
        background-color: #e3f2fd;
        font-weight: 600;
        color: #333;
    }

    tr:nth-child(even) {
        background-color: #f8f9fa;
    }

    .action-btn button {
        background-color: #eeeeee;
        border: 1px solid #bbb;
        padding: 6px 12px;
        font-size: 13px;
        margin-right: 5px;
        border-radius: 5px;
        transition: all 0.2s;
    }

    .action-btn button:hover {
        background-color: #d1e3f4;
        color: #1565c0;
        border-color: #90caf9;
    }

    .action-btn form {
        display: inline;
    }

    .message-alert {
        background-color: #d1ffd6;
        color: #2e7d32;
        padding: 10px 15px;
        border-radius: 6px;
        margin-bottom: 15px;
        font-size: 14px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.08);
    }
</style>
</head>
<body>
<div class="container">

<%
String msg = (String) session.getAttribute("msg");
if (msg != null) {
%>
    <div class="message-alert">
        <%= msg %>
    </div>
<%
    session.removeAttribute("msg");
}
%>

	<h1>Doctor Home Page</h1>

<%
	List<Patient> patientList = (List<Patient>) request.getAttribute("patients");
	if (patientList == null || patientList.isEmpty()) {
		out.println("<p>No patients found.</p>");
	} else {
%>

<div class="button-bar">
    <span class="count">Patients [ <%= patientList.size() %> ]</span>

    <form action="searchPatient.jsp">
        <button type="submit">Search Patient</button>
    </form>
    <form action="patientForm.jsp" method="get">
        <button type="submit">Add Patient</button>
    </form>
    <form action="manageVitals">
        <button type="submit">Manage Vitals</button>
    </form>
</div>

<table>
    <thead>
        <tr>
            <th>Sl No</th>
            <th>Name - Age</th>
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
            <td><%=count++%></td>
            <td><%=p.getName()%> - <%=p.getAge()%></td>
            <td><%=p.getEmail()%></td>
            <td><%=p.getPhone()%></td>
            <td><%=p.getDiagnosis()%></td>
            <td><%=p.getRemarks()%></td>
            <td><%=p.getGender()%></td>
            <td class="action-btn">
                <form action="vitalForm" method="get">
                    <input type="hidden" name="patientId" value="<%=p.getId()%>">
                    <button type="submit">Manage Vitals</button>
                </form>
                <form action="updatePatientForm" method="get">
                    <input type="hidden" name="patientId" value="<%=p.getId()%>">
                    <button type="submit">Update</button>
                </form>
                <form action="DeletePatientServlet" method="post">
                    <input type="hidden" name="patientId" value="<%=p.getId()%>">
                    <button type="submit"
                        onclick="return confirm('Are you sure you want to delete this patient?');">Delete</button>
                </form>
            </td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<%
	}
%>
</div>
</body>
</html>
