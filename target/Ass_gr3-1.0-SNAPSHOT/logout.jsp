<%-- 
    Document   : newjsp
    Created on : Oct 26, 2024, 5:52:07 PM
    Author     : Macbook
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>  <%-- We don't need session in logout --%>
<!DOCTYPE html>
<html>
    <head>
        <title>Logging Out</title>
    </head>
    <body>
        <%
            // Get all cookies from the request
            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
       
                for (Cookie cookie : cookies) {
                    if ("user".equals(cookie.getName())) {
               
                        cookie.setMaxAge(0);
 
                        response.addCookie(cookie);  
                    }
                }
            }
            response.sendRedirect("CombineServlet");
        %>
    </body>
</html>
