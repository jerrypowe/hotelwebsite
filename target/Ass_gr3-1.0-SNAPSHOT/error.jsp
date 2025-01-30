<%-- 
    Document   : erro
    Created on : Oct 26, 2024, 6:09:24 PM
    Author     : Macbook
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Error</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8d7da;
                color: #721c24;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .container {
                background-color: #f8d7da;
                padding: 20px;
                border: 1px solid #f5c6cb;
                border-radius: 5px;
                text-align: center;
                width: 400px;
            }
            h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            p {
                font-size: 18px;
                margin-bottom: 20px;
            }
            a {
                color: #0056b3;
                text-decoration: none;
                font-weight: bold;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Access Denied</h1>
            <p>You do not have permission to access this page or perform this action.</p>
            <p><a href="login.jsp">Return to Login</a> | <a href="CombineServlet">Go to Homepage</a></p>
        </div>
    </body>
</html>
