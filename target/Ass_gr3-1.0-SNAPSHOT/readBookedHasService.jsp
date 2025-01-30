<%-- 
    Document   : readBookedHasServie
    Created on : Oct 27, 2024, 1:10:47 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booked Room</title>

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                background-color: #343a40;
                color: white;
                margin: 20px;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #ffffff;
            }
            table {
                background-color: #495057;
            }
            th, td {
                color: white;
            }
            .thead-dark th {
                background-color: #212529;
            }
            .menu{
                display: flex;
                justify-content: center;
            }
            .dropdown {
                position: relative;
                display: inline-block;
                margin-right: 10px; /* Space between dropdowns */
            }

            .dropdown-menu {
                display: none; /* Hidden by default */
                position: absolute;
                background-color: #f9f9f9;
                box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
                padding: 10px;
                min-width: 160px;
                z-index: 1;
            }

            .dropdown-menu .dropdown-item {
                padding: 8px 12px;
                cursor: pointer;
                width: 100%;
                text-align: left;
                border: none;
                background: none;
            }

            .dropdown-menu .dropdown-item:hover {
                background-color: #ddd;
            }
            .header-container {
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 10px;
            }

            .title h1 {
                margin: 0;
            }

        </style>
        <script type="text/javascript">
            function displayCookies() {
                let displayCookies = document.getElementById("display");
                displayCookies.innerHTML = document.cookie;
            }

            function deleteCookies() {
                sessionStorage.clear();
                let allCookies = document.cookie.split(';');

                for (let i = 0; i < allCookies.length; i++)
                    document.cookie = allCookies[i] + "=;expires="
                            + new Date(0).toUTCString();

                displayCookies.innerHTML = document.cookie;
            }

            function redirectToJSP(nameData) {
                window.location.href = nameData;
            }
            function toggleDropdown(menuId) {
                const dropdownMenu = document.getElementById(menuId);
                const isDisplayed = dropdownMenu.style.display === "block";


                document.querySelectorAll('.dropdown-menu').forEach(menu => {
                    menu.style.display = 'none';
                });


                dropdownMenu.style.display = isDisplayed ? "none" : "block";
            }

            window.onclick = function (event) {
                if (!event.target.matches('.dropdown-toggle')) {
                    document.querySelectorAll('.dropdown-menu').forEach(menu => {
                        menu.style.display = 'none';
                    });
                }
            }
        </script>
    </head>
    <body>
        <div class="header-container">
            <div class="title">
                <h1>ROOM HAS SERVICE</h1>

            </div>
            <button class="btn btn-danger adlogout" onclick="redirectToJSP('CombineServlet'); deleteCookies()">LOGOUT</button>
        </div>
        <div class="text-center menu">
            <!--<button class="btn btn-danger adlogout" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>-->
            <button class="btn btn-primary" onclick="redirectToJSP('/Read')">READ</button>
            <!--<button class="btn btn-warning" onclick="redirectToJSP('/RoomManageServlet')">ROOM MANAGE</button>-->
            <div class="dropdown">
                <button class="btn btn-warning dropdown-toggle" onclick="toggleDropdown('roomDropdown')">ROOM MANAGE</button>
                <div id="roomDropdown" class="dropdown-menu">
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/RoomManageServlet')">ROOM MANAGE</button>
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/readPriceRoom')">ROOM PRICE</button>
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/readBookedHasService')">ROOM HAS SERVICE</button>
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/readAvailableRoom')">AVAILABLE</button>
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/readBookedRoom')">BOOKED</button>
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/readOccupiedRoom')">OCCUPIED</button>
                </div>
            </div>

            <div class="dropdown">
                <button class="btn btn-warning dropdown-toggle" onclick="toggleDropdown('serviceDropdown')">SERVICE MANAGE</button>
                <div id="serviceDropdown" class="dropdown-menu">
                    <button class="dropdown-item btn-light" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
                    <button class="dropdown-item btn-light"><a href="createService">CREATE SERVICE</a></button>
                </div>
            </div>

            <!--<button class="btn btn-light" onclick="redirectToJSP('/RoomManageServlet')">ROOM STATUS</button>-->
            <button class="btn btn-success" onclick="redirectToJSP('search.jsp')">SEARCH</button>
        </div>
        <div class="container">
            <table class="table table-bordered table-striped table-dark">
                <thead class="thead-dark">
                    <tr>
                        <th>Reservation ID</th>
                        <th>Room Code</th>
                        <th>Total Price</th>
                        <th>Check-in Date</th>
                        <th>Check-out Date</th>
                        <th>Customer Name</th>
                        <th>Phone Number</th>
                        <th>Service Name</th>
                        <th>Service Quantity</th>
                    </tr>
                </thead>


                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.reservationid}</td>
                            <td>${item.roomCode}</td>
                            <td>${item.totalPrice}</td>
                            <td>${item.checkin}</td>
                            <td>${item.checkOut}</td>
                            <td>${item.cusName}</td>
                            <td>${item.phoneNumber}</td>
                            <td>${item.serviceName}</td>
                            <td>${item.quantity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <button class="btn btn-success" onclick="redirectToJSP('/roomHasServiceBooked')">Booked</button>
            <button class="btn btn-outline-light" onclick="redirectToJSP('/roomHasServiceOccupied')">Occupied</button>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
