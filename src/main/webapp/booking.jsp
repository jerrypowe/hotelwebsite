<%-- 
    Document   : booking
    Created on : Oct 18, 2024, 12:58:47 AM
    Author     : Macbook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
v<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Wonderland</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link type="text/css" rel="stylesheet" href="lib/animate/animate.min.css">
        <link type="text/css" rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">
        <link type="text/css" rel="stylesheet" href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css">


        <!-- Customized Bootstrap Stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/bootstap.min.css">

        <!-- Template Stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <link type="text/css" rel="stylesheet" href="css/mystyle.css">

    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Header Start -->
            <div class="container-fluid bg-dark px-0">
                <div class="row gx-0">
                    <div class="col-lg-2 bg-dark d-none d-lg-block logo">
                        <a href="index.jsp" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
                            <img class="img-fluid" src="img/logo_hotel.png" alt="">
                        </a>
                    </div>
                    <div class="col-lg-10">
                        <div class="row gx-0 bg-white d-none d-lg-flex">
                            <div class="col-lg-7 px-5 text-start">
                                <div class="h-100 d-inline-flex align-items-center py-2 me-4">
                                    <i class="fa fa-envelope text-primary me-2"></i>
                                    <p class="mb-0">hungnhcce180150@fpt.edu.vn</p>
                                </div>
                                <div class="h-100 d-inline-flex align-items-center py-2">
                                    <i class="fa fa-phone-alt text-primary me-2"></i>
                                    <p class="mb-0">+8496 405 7841</p>
                                </div>
                            </div>
                            <div class="col-lg-5 px-5 text-end">
                                <div class="d-inline-flex align-items-center py-2">
                                    <a class="me-3" href="https://www.facebook.com/hotel.wonderland.2024/" target="_blank"><i class="fab fa-facebook-f"></i></a>
                                    <a class="me-3" href="https://x.com/NSawayu"><i class="fab fa-twitter" target="_blank"></i></a>
                                    <a class="me-3"  target="_blank" href="https://www.linkedin.com/in/hotel-wonderland-832463336/"><i class="fab fa-linkedin-in"></i></a>
                                    <a class="me-3" href="https://www.instagram.com/hote.lwonderland/" target="_blank"><i class="fab fa-instagram"></i></a>
                                    <a class="" href="https://www.youtube.com/@HotelWonderLand-k4p" target="_blank"><i class="fab fa-youtube"></i></a>
                                </div>
                            </div>
                        </div>
                        <nav class="navbar navbar-expand-lg bg-dark navbar-dark p-3 p-lg-0">
                            <a href="index.jsp" class="navbar-brand d-block d-lg-none">
                                <h1 class="m-0 text-primary text-uppercase">Wonderland</h1>
                            </a>
                            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav mr-auto py-0">
                                    <a href="CombineServlet?page=index" class="nav-item nav-link">Home</a>
                                    <a href="about.jsp" class="nav-item nav-link">About</a>
                                    <a href="ServiceServlet?page=service" class="nav-item nav-link">Services</a>
                                    <a href="RoomServlet?page=room" class="nav-item nav-link">Rooms</a>
                                    <div class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                                        <div class="dropdown-menu rounded-0 m-0">
                                            <a href="ReservationServlet" class="dropdown-item  active">Booking</a>
                                            <a href="team.jsp" class="dropdown-item">Our Team</a>
                                            <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                                        </div>
                                    </div>
                                </div>
                                <!--                                <div class="navbar-nav mr-auto py-0">                                 
                                                                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                                
                                                                </div>-->
                                <%
                                    String username = null;
                                    Cookie[] cookies = request.getCookies();  // Correctly declare as Cookie array

                                    if (cookies != null) {
                                        for (Cookie cookie : cookies) {
                                            if ("user".equals(cookie.getName())) {
                                                username = cookie.getValue();
                                                break;
                                            }
                                        }
                                    }
                                %>
                                <div class="navbar-nav mr-auto py-0">                                 
                                    <%
                                        if (username != null) {
                                    %>

                                    <span class="nav-item nav-link text-white">Welcome, <%= username%></span>
                                    <a href="logout.jsp" class="nav-item nav-link">Logout</a>
                                    <%
                                    } else {
                                    %>
                                    <a href="login.jsp" class="nav-item nav-link">Login</a>
                                    <%
                                        }
                                    %>

                                </div>

                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Header End -->


            <!-- Page Header Start -->
            <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-1.jpg);">
                <div class="container-fluid page-header-inner py-5">
                    <div class="container text-center pb-5">
                        <h1 class="display-3 text-white mb-3 animated slideInDown">Booking</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Booking</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->


<!--             Booking Start 
            <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <div class="bg-white shadow" style="padding: 35px;">
                        <div class="row g-2">
                            <div class="col-md-10">
                                <div class="row g-2">
                                    <div class="col-md-3">
                                        <div class="date" id="date1" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input"
                                                   placeholder="Check in" data-target="#date1" data-toggle="datetimepicker" />
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="date" id="date2" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" placeholder="Check out" data-target="#date2" data-toggle="datetimepicker"/>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-select">
                                            <option selected>Adult</option>
                                            <option value="1">Adult 1</option>
                                            <option value="2">Adult 2</option>
                                            <option value="3">Adult 3</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <select class="form-select">
                                            <option selected>Child</option>
                                            <option value="1">Child 1</option>
                                            <option value="2">Child 2</option>
                                            <option value="3">Child 3</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <button class="btn btn-primary w-100">Submit</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             Booking End -->


            <!-- Booking Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title text-center text-primary text-uppercase">Room Booking</h6>
                        <h1 class="mb-5">Book A <span class="text-primary text-uppercase">Luxury Room</span></h1>
                    </div>
                    <div class="row g-5">
                        <div class="col-lg-6">
                            <div class="row g-3">
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.1s" src="img/about-1.jpg" style="margin-top: 25%;">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.3s" src="img/about-2.jpg">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-50 wow zoomIn" data-wow-delay="0.5s" src="img/about-3.jpg">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.7s" src="img/about-4.jpg">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="wow fadeInUp" data-wow-delay="0.2s">
                                <form action="ReservationServlet" method="post">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="text" class="form-control" id="name" name="name" placeholder="Your Name"value="${cus.name}" required>
                                                <label for="name">Your Name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="Your Email"value="${cus.email}" required>
                                                <label for="email">Your Email</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating date" id="date3" data-target-input="nearest">
                                                <input type="date" class="form-control datetimepicker-input" id="checkin" name="checkin" placeholder="Check In" required />
                                                <label for="checkin">Check In</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating date" id="date4" data-target-input="nearest">
                                                <input type="date" class="form-control datetimepicker-input" id="checkout" name="checkout" placeholder="Check Out"  required />
                                                <label for="checkout">Check Out</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-floating">
                                                <select class="form-select" id="select"  name="roomType" required>
                                                    <c:forEach var="ro" items="${listR}">
                                                        <option value="${ro.roomType}">${ro.roomType}</option>
                                                    </c:forEach>
                                                </select>
                                                <label for="select">Select A Room</label>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <c:forEach items="${listS}" var="se">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="${se.id}" id="flexCheckDefault${se.id}" name="service">
                                                    <label class="form-check-label" for="flexCheckDefault${se.id}">
                                                        ${se.name}
                                                    </label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100 py-3" type="submit">Book Now</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Booking End -->

            <!-- Footer Start -->
            <div class="container-fluid bg-dark text-light footer wow fadeIn" data-wow-delay="0.1s">
                <div class="container pb-5">
                    <div class="row g-5 footer-content ">
                        <div class="col-md-6 col-lg-3">
                            <h6 class="section-title text-start text-primary text-uppercase mb-4">Contact</h6>
                            <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>No. 123 Tran Phu Street, Ward 3, Da Lat, Lam Dong, Vietnam</p>
                            <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+8496 405 7841</p>
                            <p class="mb-2"><i class="fa fa-envelope me-3"></i>hungnhcce180150@fpt.edu.vn</p>
                            <div class="d-flex pt-2">
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://x.com/NSawayu"><i class="fab fa-twitter"></i></a>
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://www.facebook.com/hotel.wonderland.2024/"><i class="fab fa-facebook-f"></i></a>
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://www.youtube.com/@HotelWonderLand-k4p"><i class="fab fa-youtube"></i></a>
                                <a target="_blank" class="btn btn-outline-light btn-social" href="https://www.linkedin.com/in/hotel-wonderland-832463336/"><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-12">
                            <div class="row gy-5 g-4">
                                <div class="col-md-6">
                                    <h6 class="section-title text-start text-primary text-uppercase mb-4">Company</h6>
                                    <a class="btn btn-link" href="about.jsp">About Us</a>
                                    <a class="btn btn-link" href="PrivacyPolicy.jsp">Privacy Policy</a>
                                    <a class="btn btn-link" href="TermsConditions.jsp">Terms & Condition</a>
                                </div>
                                <div class="col-md-6">
                                    <h6 class="section-title text-start text-primary text-uppercase mb-4">Services</h6>
                                    <a class="btn btn-link" href="service.jsp">Food & Restaurant</a>
                                    <a class="btn btn-link" href="service.jsp">Spa & Fitness</a>
                                    <a class="btn btn-link" href="service.jsp">Sports & Gaming</a>
                                    <a class="btn btn-link" href="service.jsp">Event & Party</a>
                                    <a class="btn btn-link" href="service.jsp">GYM & Yoga</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="copyright">
                        <div class="row">
                            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                &copy; <a class="border-bottom" href="#">2024 Wonderland</a>, All Right Reserved. 

                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Designed By <a class="border-bottom">Group 3</a>
                                <br>Distributed By: <a class="border-bottom"target="_blank">Group 3</a>
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <!-- JavaScript Libraries -->       
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="lib/wow/wow.min.js" type="text/javascript"></script>
        <script src="lib/easing/easing.min.js" type="text/javascript"></script>
        <script src="lib/waypoints/waypoints.min.js" type="text/javascript"></script>
        <script src="lib/counterup/counterup.min.js" type="text/javascript"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js" type="text/javascript"></script>
        <script src="lib/tempusdominus/js/moment.min.js" type="text/javascript"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js" type="text/javascript"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js" type="text/javascript"></script>


        <!-- Template Javascript -->
        <script src="js/main.js" type="text/javascript"></script>
    </body>

</html>