<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Service</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #000000; /* Nền màu đen */
                color: white; /* Màu chữ sáng */
            }
            h1 {
                text-align: center;
                margin-top: 20px;
            }
            .form-container {
                max-width: 600px;
                margin: auto;
                background-color: #495057; /* Màu nền của form */
                padding: 20px;
                border-radius: 10px; /* Bo góc */
            }
            .btn-create {
                background-color: #28a745; /* Màu xanh lá cho nút CREATE */
                color: white;
            }
            .btn-create:hover {
                opacity: 0.8; /* Hiệu ứng khi hover */
            }
            label {
                margin-top: 10px;
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
                <h1>ROOM PRICE</h1>
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
        <h1>CREATE SERVICE</h1>
        <div class="form-container">
            <form action="createService" method="POST" >
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input type="text" class="form-control" name="id" value="${data}" />
                </div>
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" name="name" required="required" />
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" name="description" required="required" />
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" class="form-control" name="price" required="required" />
                </div>
                <div class="form-group">
                    <label for="images">Images:</label>
                    <input type="file" class="form-control" name="images" required="required" />
                </div >
                <div  class="text-center">
                    <button type="submit" class="btn btn-create text-center">CREATE</button>
                </div>
            </form>
        </div>
    </body>
</html>
