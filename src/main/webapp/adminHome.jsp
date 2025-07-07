<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home - Health Logger</title>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f8f9fa, #e0f7fa);
        color: #2c3e50;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 80px;
    }

    h1 {
        font-size: 36px;
        margin-bottom: 10px;
        color: #1e88e5;
    }

    h2 {
        font-size: 16px;
        font-weight: 400;
        color: #616161;
        margin-bottom: 50px;
    }

    .button-container {
        display: flex;
        flex-direction: column;
        gap: 20px;
        width: 300px;
        max-width: 90%;
        align-items: center;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    }

    .btn {
        width: 100%;
        padding: 14px 20px;
        font-size: 16px;
        font-weight: bold;
        color: #ffffff;
        background: #0077c2;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .btn:hover {
        background: #005b9f;
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    form {
        width: 100%;
        margin: 0;
    }
</style>
</head>
<body>
	<h1>Health Logger</h1>
	<h2>Developed by Praneetha</h2>

	<div class="button-container">
		<form action="viewPatients" method="get">
			<button class="btn" type="submit">Manage Patients</button>
		</form>
		<form action="manageVitals" method="get">
			<button class="btn" type="submit">Manage Vitals</button>
		</form>
	</div>
</body>
</html>
