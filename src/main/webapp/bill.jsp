<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Bill - Wonderland</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
            }
            .container {
                width: 100%;
                max-width: 700px; 
                margin: 40px auto; 
                background: #ffffff;
                padding: 40px;
                box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15); 
                border-radius: 10px; 
                border: 1px solid #e0e0e0; 
            }
            h2, h3 {
                color: #333;
            }
            .details {
                margin-top: 20px;
                line-height: 2;
            }
            .details span {
                font-weight: bold;
            }
            .services {
                margin-top: 10px;
            }
            .footer {
                margin-top: 20px;
                text-align: center;
                color: #777;
            }
            .button-container {
                text-align: center;
                margin-top: 20px;
            }
        </style>
        <script>
            function redirectToPage() {
                window.location.href = 'CombineServlet';
            }
        </script>
    </head>
    <body>

        <div class="container">
            <h2>Payment Bill - Wonderland</h2>

            <h3>Payment Information</h3>
            <div class="details">
                <p><span>Name:</span> ${cus.name}</p>
                <p><span>Phone number:</span> ${cus.phoneNumber}</p>
                <p><span>E-mail:</span> ${cus.email}</p>
                <p><span>Address:</span> ${cus.address}</p>
            </div>

            <h3>Booking Information</h3>
            <div class="details">
                <p><span>Room type:</span> ${roomType}</p>
                <p><span>Check-in / Check-out time:</span> ${checkinTime} - ${checkoutTime}</p>
                <p><span>Number of nights:</span> ${numberofNights}</p>
            </div>

            <h3>Payment Details</h3>
            <div class="details">
                <p><span>Room fee:</span> ${roomPrice} VND</p>
                <div class="services">
                    <c:forEach items="${listser}" var="ser">
                        <p>Service ${ser.name}: ${ser.price} VND</p>
                    </c:forEach>
                </div>
                <p><span>Total amount:</span> ${totalcost} VND</p>
                <p><span>Payment method:</span> ${paymentMethod}</p>
            </div>
            <div class="footer">
                <p>Thank you for using Wonderland's services. Wishing you a wonderful experience and see you again!</p>
            </div>
            <div class="button-container">
                <button type="button" class="btn btn-primary" onclick="redirectToPage()">Back</button>
            </div>
        </div>
    </body>
</html>
