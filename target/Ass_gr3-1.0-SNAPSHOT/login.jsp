<%-- 
    Document   : login
    Created on : Oct 18, 2024, 10:05:38 PM
    Author     : Macbook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="css/mystyle.css">
        <script>
            function redirectToPage() {
                window.location.href = 'CombineServlet';
            }
        </script>
    </head>
    <body class="login"  >
        <form class="form-login" method="post" action="Login">
            <h3>Login Here</h3>

            <p class="text-danger alert"> ${mess}</p>
            <label for="username">Email</label>
            <input type="text" placeholder="Enter Email" id="username" name="user" required="">

            <label for="password">Password</label>
            <input type="password" placeholder="Password" id="password" name="pass" required="">

            <button>Log In</button>
            <p style="margin-top: 15px; color: white">New to Wonderland?<a href="signup.jsp" class="nav-item nav-link"> Sign up</a></p>
            <div class="back">
                <button type="button"onclick="redirectToPage()" >Back</button>
            </div>
        </form>
    </body>
</html>
