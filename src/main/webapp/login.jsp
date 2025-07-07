<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Login - Health Logger</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffffff;
            text-align: center;
            padding-top: 100px;
        }

        h2 {
            color: #333;
        }

        .subtitle {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }

        .login-box {
            display: inline-block;
            padding: 30px 50px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        input[type="email"],
        input[type="password"] {
            width: 250px;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px 40px;
            border: none;
            background-color: #00c200;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            border-radius: 20px;
        }

        input[type="submit"]:hover {
            background-color: #009900;
        }

        label {
            display: block;
            text-align: left;
            margin: 10px 0 5px 0;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Health Logger</h2>
        <div class="subtitle">Doctor Login</div>
        <form action="login" method="post">
            <label for="email">Enter Email</label>
            <input type="email" id="email" name="email" placeholder="abc@example.com" required />

            <label for="password">Enter Password</label>
            <input type="password" id="password" name="password" placeholder="********" required />

            <br/>
            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>
