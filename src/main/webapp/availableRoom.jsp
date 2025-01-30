<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Room</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #121212; /* Nền màu đen */
                color: #ffffff; /* Màu chữ trắng */
                font-family: 'Arial', sans-serif; /* Font chữ hiện đại */
            }
            h1 {
                text-align: center;
                margin-top: 20px;
                color: #ffc107; /* Màu vàng sang trọng */
            }
            table {
                margin: auto;
                margin-top: 20px;
                width: 80%; /* Chiếm 80% chiều rộng */
                border-collapse: collapse; /* Xóa khoảng cách giữa các ô */
            }
            th, td {
                padding: 15px; /* Thêm khoảng cách */
                text-align: center; /* Căn giữa */
                color: #ffffff; /* Màu chữ trắng trong bảng */
            }
            th {
                background-color: #343a40; /* Màu nền cho tiêu đề */
                color: #ffc107; /* Màu chữ vàng cho tiêu đề */
            }
            tr:nth-child(even) {
                background-color: #1e1e1e; /* Nền cho hàng chẵn */
            }
            tr:nth-child(odd) {
                background-color: #2a2a2a; /* Nền cho hàng lẻ */
            }
            tr:hover {
                background-color: #444; /* Hiệu ứng hover */
            }
            .btn {
                margin: 10px; /* Khoảng cách giữa các nút */
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
                <h1>AVAILABLE ROOM</h1>
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
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ROOM CODE</th>
                    <th>ROOM ID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${data}" var="room">
                    <tr>
                        <td>${room.code}</td>
                        <td>${room.ID}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--        <div class="text-center">
                    <button onclick="displayCookies()" class="btn btn-warning">Display Cookies</button>
                    <button onclick="deleteCookies()" class="btn btn-danger">Delete Cookies</button>
                </div>-->
        <div id="display" class="text-center mt-3"></div>
    </body>
</html>
