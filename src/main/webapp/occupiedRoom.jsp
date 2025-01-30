
<%-- 
    Document   : occupiedRoom
    Created on : Oct 26, 2024, 5:16:38 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Occupied Room</title>

        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background-color: #121212;
                color: #ffffff;
                font-family: 'Montserrat', sans-serif;
            }
            h1 {
                text-align: center;
                margin-top: 20px;
                font-weight: 600;
            }
            table {
                margin: 20px auto;
                width: 80%;
                border-collapse: collapse;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ffffff;
            }
            th {
                background-color: #1e1e1e;
            }
            tr:nth-child(even) {
                background-color: #232323;
            }
            tr:hover {
                background-color: #333333;
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
        <div class="container">

            <div class="header-container">
                <div class="title">
                    <h1>OCCUPIED ROOM</h1>
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
            <table class="table table-dark table-bordered">

                <tr>
                    <th>RESERVATION ID</th>
                    <th>ROOM CODE</th>
                    <th>TOTAL PRICE</th>
                    <th>CHECK IN DATE</th>
                    <th>CHECK OUT DATE</th>
                    <th>CUSTOMER ID</th>
                    <th>CUSTOMER NAME</th>
                    <th>PHONE NUMBER</th>
                </tr>
                <c:set var="amountReservationID" value="1" />
                <c:set var="amountReservationIDCurrent" value="0" />

                <c:forEach items="${datare}" var="data">
                    <tr>
                        <td>${data.reservation_ID}</td>
                        <td>${data.room_Code}</td>
                        <td>${data.totalPrice}</td>
                        <td>${data.check_In_Date}</td>
                        <td>${data.check_Out_Date}</td>
                        <td>${data.customer_ID}</td>
                        <c:forEach items="${datacustomer}" var="customer">
                            <c:if test="${customer.ID == data.customer_ID }">

                                <td>${customer.name}</td>
                                <td>${customer.phoneNumber}</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>

            </table>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
