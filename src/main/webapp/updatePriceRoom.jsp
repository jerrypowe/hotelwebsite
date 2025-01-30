<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Price Room</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #343a40;
                color: #ffffff;
            }
            h1 {
                text-align: center;
                margin-top: 20px;
                color: #ffc107;
            }
            .form-container {
                max-width: 600px;
                margin: auto;
                background-color: #495057;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }
            label {
                color: #ffc107;
            }
            input[type="text"], input[type="number"] {
                background-color: #2a2a2a;
                color: #ffffff;
                border: 1px solid #ffc107;
            }
            input[type="submit"] {
                background-color: #ffc107;
                color: #121212;
                border: none;
                margin-top: 10px;
            }
            input[type="submit"]:hover {
                background-color: #e0a800;
            }

        </style>
    </head>
    <body>
        <h1>UPDATE PRICE ROOM</h1>
        <div class="form-container">
            <form action="updatePriceRoom" method="POST">
                <div class="form-group">
                    <label for="id">ROOM ID:</label>
                    <input type="text" class="form-control" name="id" id="id" value="${data.ID}" readonly="readonly"/>
                </div>
                <div class="form-group">
                    <label for="type">Type:</label>
                    <input type="text" class="form-control" name="type" id="type" value="${data.type}" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="text" class="form-control" name="capacity" id="capacity" value="${data.capacity}" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label for="price">Price:</label>
                    <input type="number" class="form-control" name="price" id="price" value="${data.price}" required="required" />
                </div>
                <div class="form-group">
                    <label for="description">Description:</label>
                    <input type="text" class="form-control" name="description" id="description" value="${data.description}" readonly="readonly" />
                </div>
                <input type="submit" value="UPDATE" class="btn btn-warning btn-block" />
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
