<%-- 
    Document   : deleteService
    Created on : Oct 26, 2024, 10:18:39 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>DELETE SERVICE</h1>
        <form action="deleteService" method="POST">
            ID:    <input type="text" name="id" value="${data.id}" readonly="readonly" /><br></br>
            NAME:    <input type="text" name="name" value="${data.name}" readonly="readonly"/><br></br>
            DESCRIPTION:    <input type="text" name="description" value="${data.description}" readonly="readonly" /><br></br>
            PRICE:    <input type="text" name="price" value="${data.price}" readonly="readonly" /><br></br>
            IMAGE:    <input type="text" name="image" value="${data.images}"readonly="readonly"  /><br></br>

            <input type="submit" value="DELETE" />
        </form>

    </body>
</html>
