<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Management Admin</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #000000;
                color: white;
            }
            .button-link {
                margin: 5px;
                padding: 10px 15px;
                font-size: 16px;
                color: white;
                border-radius: 5px;
                border: none;
                cursor: pointer;
            }

            .button-link.logout {
                background-color: #dc3545;
            }

            .button-link.read {
                background-color: #007bff;
            }

            .button-link.booked {
                background-color: #28a745;
            }

            .button-link.occupied {
                background-color: #ffc107;
            }
            .button-link.availble {
                background-color: #ffd08b;
            }
            .button-link.service {
                background-color: #17a2b8;
            }

            .button-link:hover {
                opacity: 0.8;
            }

            table {
                background-color: #495057;
            }
            th, td {
                text-align: center;
            }

            input[type="radio"] {
                display: none;
            }

            input[type="radio"] + label {
                position: relative;
                padding-left: 30px;
                cursor: pointer;
                color: white;
            }

            input[type="radio"] + label:before {
                content: '';
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
                width: 20px;
                height: 20px;
                border: 2px solid #007BFF;
                border-radius: 50%;
                background-color: transparent;
            }

            input[type="radio"]:checked + label:before {
                background-color: #007BFF;
                border-color: #0056b3;
            }

            .header-container {
                display: flex;
                text-align: center;
                align-items: center;
                justify-content: space-between;
                margin: auto;
                /*                padding: 10px;*/
            }

            .title h2 {
                margin: 20px 20px 20px 20px;
                /*margin: 0px;*/
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
    <!--<body class="container">-->
    <body>
        <!--        <div class="header-container">
                    <div class="title">
                        <h2 class="text-center">Information of Room's Status</h2>
                    </div>
                    <button class="btn btn-danger" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
                </div>
                        <h2 class="text-center mt-4">Information of Room's Status</h2>
                <div class="text-center mb-4">
                                <button class="button-link logout" onclick="redirectToJSP('index.jsp'); deleteCookies()">LOGOUT</button>
                    <button class="button-link read" onclick="redirectToJSP('/Read')">READ</button>
                    <button class="button-link service" onclick="redirectToJSP('/readService')">SERVICE MANAGE</button>
                    <button class="btn btn-light" onclick="redirectToJSP('/readPriceRoom')">ROOM PRICE</button>
                    <button class="button-link service" onclick="redirectToJSP('/readBookedHasService')">ROOM HAS SERVICE</button><br>
                    <button class="button-link availble " onclick="redirectToJSP('/readAvailableRoom')">AVAILABLE</button>
                    <button class="button-link booked" onclick="redirectToJSP('/readBookedRoom')">BOOKED</button>
                    <button class="button-link occupied" onclick="redirectToJSP('/readOccupiedRoom')">OCCUPIED</button>
                </div>-->
        <div class="header-container">
            <div class="title">
                <h1 class="text-center">Information of Room's Status</h1>
            </div>
            <button class="btn btn-danger adlogout" onclick="redirectToJSP('CombineServlet'); deleteCookies()">LOGOUT</button>
        </div>
        <div class="text-center menu ">
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

        <h3 class="text-center">Room Status Percentages</h3>
        <div class="mb-4">
            <div class="progress">
                <div class="progress-bar bg-success" role="progressbar" style="width: ${b}%" aria-valuenow="${b}" aria-valuemin="0" aria-valuemax="100">${b}% Booked</div>
            </div><br>
            <div class="progress">
                <div class="progress-bar bg-warning" role="progressbar" style="width: ${o}%" aria-valuenow="${o}" aria-valuemin="0" aria-valuemax="100">${o}% Occupied</div>
            </div><br>
            <div class="progress">
                <div class="progress-bar bg-info" role="progressbar" style="width: ${a}%" aria-valuenow="${a}" aria-valuemin="0" aria-valuemax="100">${a}% Available</div>
            </div><br>
        </div>

        <table class="table table-dark table-bordered">
            <thead>
                <tr>
                    <th>Room_Code</th>
                    <th>Room_ID</th>
                    <th>Available</th>
                    <th>Booked</th>
                    <th>Occupied</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${dataRoom}" var="room">
                    <tr>
                        <td>${room.code}</td>
                        <td>${room.ID}</td>
                        <td>
                            <input type="radio" id="avai_${room.code}" name="avai_${room.code}" value="ON" disabled <c:if test="${room.available}">checked="checked" disabled</c:if> />
                            <label for="avai_${room.code}"></label>
                        </td>
                        <td>
                            <input type="radio" id="booked_${room.code}" name="booked_${room.code}" value="ON" disabled <c:if test="${room.booked}">checked="checked" disabled</c:if> />
                            <label for="booked_${room.code}"></label>
                        </td>
                        <td>
                            <input type="radio" id="occup_${room.code}" name="occup_${room.code}" value="ON" disabled <c:if test="${room.occupied}">checked="checked" disabled</c:if> />
                            <label for="occup_${room.code}"></label>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
