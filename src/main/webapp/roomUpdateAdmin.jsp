<%-- 
    Document   : roomUpdateAdmin
    Created on : Oct 25, 2024, 3:06:48 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function checkOnlyOne(selectedCheckbox) {

                var checkboxes = document.querySelectorAll('input[type="checkbox"]');
                checkboxes.forEach((checkbox) => {
                    if (checkbox !== selectedCheckbox) {
                        checkbox.checked = false;
                    }
                });
            }
        </script>
    </head>
    <body>

        <h2> UPDATE INFOMATION OF ROOM' STATUS</h2>


        <br></br>

        <form action="UpdateRoom" method="POST">
            Room Code:
            <input type="text" name="RoomCode" value="${room.code}" readonly /><br></br>
            Room ID 
            <input type="text" name="RoomID" value="${room.ID}" readonly/><br></br>
            Available
            <input type="radio" name="RoomStatus" value="Available"  <c:if test="${room.available}">checked="checked" onclick="checkOnlyOne(this)"</c:if> />
                Booked
                <input type="radio" name="RoomStatus" value="Booked"  <c:if test="${room.booked}">checked="checked" onclick="checkOnlyOne(this)"</c:if> />
                Occupied
                <input type="radio" name="RoomStatus" value="Occupied" <c:if test="${room.occupied}">checked="checked" onclick="checkOnlyOne(this)"</c:if>/>
            <br></br>

            <input type="submit" value="Update"/>
        </form>
    </body>
</html>
