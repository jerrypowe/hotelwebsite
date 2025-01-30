<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Your Profile</title>
        <style>

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                background-color: #f4f4f9;
            }

            .container {
                background-color: #ffffff;
                padding: 40px;
                max-width: 500px;
                width: 100%;
                border-radius: 10px;
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            h2 {
                margin-bottom: 20px;
                color: #333;
                font-size: 24px;
            }

            label {
                display: block;
                margin: 15px 0 5px;
                color: #555;
                font-size: 14px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"],
            input[type="date"] {
                width: 100%;
                padding: 12px;
                margin-bottom: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
            }

            .back button {
                background-color: #4caf50;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: 100%;
                margin-top: 15px;
            }

            .back button:hover {
                background-color: #388e3c; /* Màu nền khi rê chuột vào */
            }


            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                padding: 12px 20px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                width: 100%;
                margin-top: 15px;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
        <script>
            function redirectToPage() {
                window.location.href = 'CombineServlet';
            }
        </script>
    </head>
    <body>

        <div class="container">
            <h2>Edit Profile</h2>

            <form action="${pageContext.request.contextPath}/update" method="post">
                <label for="customerName">New Name:</label>  
                <input type="text" id="customerName" value="${data.customerName}" name="customerName" required>

                <label for="address">New Address:</label>
                <input type="text" id="address" value="${data.address}" name="address" required>

                <label for="phoneNumber">New Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" required>

                <label for="password">New Password or Old Pass:</label>
                <input type="password" id="password" name="password" required>

                <label for="birthday">Enter your new birthday:</label>
                <input type="date" id="birthday" name="birthday" required>

                <label for="email">Your Email(you must enter your email):</label>
                <input type="email" id="email" name="email" required>

                <input type="submit" value="Update">  <br><!-- comment -->
                <div class="back">
                    <button type="button"onclick="redirectToPage()" >Back</button>
                </div>

            </form>
        </div>

    </body>
</html>