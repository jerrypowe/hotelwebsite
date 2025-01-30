<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Service</title>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background-color: #343a40;
                color: white;
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
            .btn {
                margin: 5px;
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

        <script>
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
                })


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

        <!--        <div class="text-center">
                    <button class="btn btn-danger" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
                    <button class="btn btn-primary" onclick="redirectToJSP('/Read')">READ</button>
                    <button class="btn btn-warning" onclick="redirectToJSP('/RoomManageServlet')">Room Manage</button>
                    <button class="btn btn-success"><a href="createService" style="color: white; text-decoration: none;">CREATE SERVICE</a></button>
                    <button class="btn btn-light" onclick="redirectToJSP('/readPriceRoom')">ROOM PRICE</button>
                </div>-->

        <div class="header-container">
            <div class="title">
                <h1>MANAGE SERVICE</h1>
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
        <br>

        <div class="container">
            <table class="table table-bordered table-striped table-dark">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>DESCRIPTION</th>
                        <th>Price</th>
                        <th>IMAGES</th>
                        <th>OPTION</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${data}" var="ser">
                        <tr>
                            <td>${ser.id}</td>
                            <td>${ser.name}</td>
                            <td>${ser.description}</td>
                            <td>${ser.price}</td>
                            <td>${ser.images}</td>
                            <td>
                                <button class="btn btn-warning"><a href="updateService?service_id=${ser.id}" style="color: white; text-decoration: none;">UPDATE</a></button>
<!--                                <button class="btn btn-danger"><a href="deleteService?service_id=${ser.id}" style="color: white; text-decoration: none;">DELETE</a></button>-->
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
