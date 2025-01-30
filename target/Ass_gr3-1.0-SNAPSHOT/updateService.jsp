<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Service</title>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background-color: #1c1c1c;
                color: #f8f9fa;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #e0a800;
            }
            .form-container {
                max-width: 600px;
                margin: auto;
                background-color: #343a40;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }
            .form-control {
                background-color: #495057;
                color: #f8f9fa;
            }
            .form-control:focus {
                background-color: #6c757d;
                color: #f8f9fa;
                box-shadow: none;
            }
            .btn-primary {
                background-color: #e0a800;
                border: none;
            }
            .btn-primary:hover {
                background-color: #c69500;
            }
        </style>
    </head>
    <body>
        <h1>UPDATE SERVICE</h1>
        <div class="form-container">
            <form action="updateService" method="POST">
                <div class="form-group">
                    <label for="id">ID</label>
                    <input type="text" class="form-control" name="id" value="${data.id}" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" name="name" value="${data.name}" required="required" />
                </div>
                <div class="form-group">
                    <label for="description">Description</label>
                    <input type="text" class="form-control" name="description" value="${data.description}" required="required" />
                </div>
                <div class="form-group">
                    <label for="price">Price</label>
                    <input type="number" class="form-control" name="price" value="${data.price}" required="required" />
                </div>
                <div class="form-group">
                    <label for="image">Current Image</label>
                    <input type="text" class="form-control" name="image" value="${data.images}" readonly="readonly" />
                </div>
                <div class="form-group">
                    <label for="images">Upload New Image</label>
                    <input type="file" class="form-control" name="images" />
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
