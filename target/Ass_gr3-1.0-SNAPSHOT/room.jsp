<%-- 
    Document   : room
    Created on : Oct 18, 2024, 12:51:45 AM
    Author     : Macbook
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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


        <!-- Libraries Stylesheet-->
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
                        <a href="CombineServlet" class="navbar-brand w-100 h-100 m-0 p-0 d-flex align-items-center justify-content-center">
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
                            <a href="CombineServlet" class="navbar-brand d-block d-lg-none">
                                <h1 class="m-0 text-primary text-uppercase">Wonderland</h1>
                            </a>
                            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav mr-auto py-0">
                                    <a href="CombineServlet" class="nav-item nav-link">Home</a>
                                    <a href="about.jsp" class="nav-item nav-link">About</a>
                                    <a href="ServiceServlet" class="nav-item nav-link">Services</a>
                                    <a href="RoomServlet" class="nav-item nav-link  active">Rooms</a>
                                    <div class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                        <div class="dropdown-menu rounded-0 m-0">
                                            <a href="ReservationServlet" class="dropdown-item">Booking</a>
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
                                    <a href="personal.jsp" class="nav-item nav-link">Update Your Info</a>
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
                        <h1 class="display-3 text-white mb-3 animated slideInDown">Rooms</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center text-uppercase">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                                <li class="breadcrumb-item text-white active" aria-current="page">Rooms</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Page Header End -->

            <!-- Room Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                        <h6 class="section-title text-center text-primary text-uppercase">Our Rooms</h6>
                        <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Rooms</span></h1>
                    </div>


                    <div class="row g-4">
                        <c:forEach var="ro" items="${listR}" >
                            <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                <div class="room-item shadow rounded overflow-hidden">
                                    <div class="position-relative">
                                        <img class="img-fluid" src="${ro.imager}" alt="">
                                        <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">$100/Night</small>
                                    </div>
                                    <div class="p-4 mt-2">
                                        <div class="d-flex justify-content-between mb-3">
                                            <h5 class="mb-0">${ro.roomType}</h5>
                                            <div class="ps-2">
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                                <small class="fa fa-star text-primary"></small>
                                            </div>
                                        </div>
                                        <div class="d-flex mb-3">
                                            <small class="border-end me-3 pe-3"><i class="fa fa-bed text-primary me-2"></i>${ro.capacity} Bed</small>
                                            <small class="border-end me-3 pe-3"><i class="fa fa-bath text-primary me-2"></i>2 Bath</small>
                                            <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                        </div>
                                        <p class="text-body mb-3">You can click VIEW DETAIL to show more picture of room we have.</p>
                                        <div class="d-flex justify-content-between">
                                            <a class="btn btn-sm btn-dark rounded py-2 px-4" href="ReservationServlet">Book Now</a>
                                            <div class="d-flex justify-content-between">
                                                <a class="btn btn-sm btn-primary rounded py-2 px-4" href="javascript:void(0);" onclick="openViewDetail()">View Detail</a>

                                                <style>
                                                    /* Style for the view detail box */
                                                    .view-detail {
                                                        position: fixed;
                                                        top: 20%;
                                                        left: 50%;
                                                        transform: translate(-50%, -20%);
                                                        width: 80%;
                                                        max-width: 600px;
                                                        background-color: white;
                                                        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                                                        border-radius: 12px;
                                                        padding: 20px;
                                                        z-index: 1000;
                                                    }

                                                    /* Close button (circular X) */
                                                    .close-btn {
                                                        position: absolute;
                                                        top: 10px;
                                                        left: 10px;
                                                        width: 30px;
                                                        height: 30px;
                                                        background-color: #ff5c5c;
                                                        border: none;
                                                        border-radius: 50%;
                                                        display: flex;
                                                        align-items: center;
                                                        justify-content: center;
                                                        cursor: pointer;
                                                    }

                                                    .close-btn span {
                                                        color: white;
                                                        font-size: 18px;
                                                        font-weight: bold;
                                                    }

                                                    /* Grid layout for images */
                                                    .image-container {
                                                        display: grid;
                                                        grid-template-columns: repeat(3, 1fr);
                                                        gap: 10px;
                                                        margin-top: 10px;
                                                    }

                                                    .image-container img {
                                                        width: 100%;
                                                        border-radius: 8px;
                                                    }

                                                    /* Reaction (small text) */
                                                    .reaction-text {
                                                        margin-top: 15px;
                                                        font-size: 14px;
                                                        color: gray;
                                                        text-align: center;
                                                    }

                                                    /* Overlay to disable background interaction */
                                                    .overlay {
                                                        position: fixed;
                                                        top: 0;
                                                        left: 0;
                                                        width: 100%;
                                                        height: 100%;
                                                        background-color: rgba(0, 0, 0, 0.5);
                                                        display: none;
                                                        z-index: 999;
                                                    }
                                                </style>

                                                <!-- Overlay for view detail -->
                                                <div id="overlay" class="overlay" onclick="closeViewDetail()"></div>

                                                <!-- View Detail -->
                                                <div id="viewDetail" class="view-detail" style="display: none;">
                                                    <button class="close-btn" onclick="closeViewDetail()">
                                                        <span>&times;</span>
                                                    </button>
                                                    <div class="message">
                                                        <h3>View Detail of the item</h3>
                                                    </div>

                                                    <!-- Image Container -->
                                                    <div class="image-container">
                                                        <img src="${ro.imager1}" alt="Image 1">
                                                        <img src="${ro.imager2}" alt="Image 2">
                                                        <img src="${ro.imager3}" alt="Image 3">
                                                        <img src="${ro.imager4}" alt="Image 4">
                                                        <img src="${ro.imager5}" alt="Image 5">
                                                        <img src="${ro.imager6}" alt="Image 6">
                                                    </div>

                                                    <!-- Reaction Text Section -->
                                                    <div class="reaction-text">
                                                        This is a small reaction text giving more context about the images above.
                                                    </div>
                                                </div>

                                                <!-- JavaScript -->
                                                <script>
                                                    function openViewDetail() {
                                                        document.getElementById("viewDetail").style.display = "block";
                                                        document.getElementById("overlay").style.display = "block";
                                                    }

                                                    function closeViewDetail() {
                                                        document.getElementById("viewDetail").style.display = "none";
                                                        document.getElementById("overlay").style.display = "none";
                                                    }
                                                </script>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>
            </div>

            <!-- Room End -->


            <!-- Testimonial Start -->
            <div class="container-xxl testimonial mt-5 py-5 bg-dark wow zoomIn" data-wow-delay="0.1s" style="margin-bottom: 90px;">
                <div class="container">
                    <div class="owl-carousel testimonial-carousel py-5">
                        <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                            <p>I recently stayed at WonderLand and had a generally positive experience. The staff was friendly and attentive, making check-in and check-out smooth and efficient. The room was well-maintained, clean, and comfortable, providing a restful environment</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/thaykhanh.jpg" style="width: 80px; height: 70px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Vo Hong Khanh</h6>
                                    <small>Lecturer of FPT </small>
                                </div>
                            </div>
                            <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                        </div>
                        <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                            <p>My stay at WonderLand was quite enjoyable! The ambiance of the hotel was inviting, with a comfortable bed and all the amenities needed for a relaxing stay. The hotel restaurant served delicious meals, with plenty of options to choose from.</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/Cophi.jpg" style="width: 80px; height: 70px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Nguyen Thi Phi</h6>
                                    <small>せんせい </small>
                                </div>
                            </div>
                            <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                        </div>
                        <div class="testimonial-item position-relative bg-white rounded overflow-hidden">
                            <p>I had a memorable stay at WonderLand and was impressed by the excellent customer service. The staff went above and beyond to make sure my needs were met. The location was perfect, close to public transport and popular spots.</p>
                            <div class="d-flex align-items-center">
                                <img class="img-fluid flex-shrink-0 rounded" src="img/AHieu.png" style="width: 80px; height: 70px;">
                                <div class="ps-3">
                                    <h6 class="fw-bold mb-1">Nguyen Trung Hieu</h6>
                                    <small>IT</small>
                                </div>
                            </div>
                            <i class="fa fa-quote-right fa-3x text-primary position-absolute end-0 bottom-0 me-4 mb-n1"></i>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Testimonial End -->

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
                            <div class="col-md-6 text-center text-md-end">
                                <!--                                <div class="footer-menu">
                                                                    <a href="index.jsp">Home</a>
                                                                    <a href="">Cookies</a>
                                                                    <a href="">Help</a>
                                                                    <a href="">FQAs</a>
                                                                </div>-->
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
