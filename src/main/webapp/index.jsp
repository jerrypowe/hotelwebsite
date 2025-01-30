<%-- 
    Document   : index
    Created on : Oct 18, 2024, 12:50:16 AM
    Author     : Macbook
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!<!-- ForEach -->
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

        <!-- Libraries Stylesheet -->

        <link type="text/css" rel="stylesheet" href="lib/animate/animate.min.css">
        <link type="text/css" rel="stylesheet" href="lib/owlcarousel/assets/owl.carousel.min.css">
        <link type="text/css" rel="stylesheet" href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css">

        <!-- Customized Bootstrap Stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/bootstap.min.css">

        <!-- Template Stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css">
        <link type="text/css" rel="stylesheet" href="css/mystyle.css">
        <!<!-- ForEach -->
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                    <a href="CombineServlet"class="nav-item nav-link active">Home</a>
                                    <a href="about.jsp" class="nav-item nav-link">About</a>
                                    <a href="ServiceServlet" class="nav-item nav-link">Services</a>
                                    <a href="RoomServlet" class="nav-item nav-link">Rooms</a>
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
                                    Cookie[] cookies = request.getCookies();

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


            <!-- Carousel Start -->
            <div class="container-fluid p-0 mb-5">
                <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="w-100" src="img/hotel/carousel1.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h6 class="section-title text-white text-uppercase mb-3 animated slideInDown">Luxury Living</h6>
                                    <h1 class="display-3 text-white mb-4 animated slideInDown">Discover A Brand Luxurious Hotel</h1>
                                    <a href="RoomServlet" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Our Rooms</a>
                                    <a href="ReservationServlet" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Book A Room</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="w-100" src="img/hotel/carousel2.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h6 class="section-title text-white text-uppercase mb-3 animated slideInDown">Luxury Living</h6>
                                    <h1 class="display-3 text-white mb-4 animated slideInDown">Discover A Brand Luxurious Hotel</h1>
                                    <a href="RoomServlet" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Our Rooms</a>
                                    <a href="booking.jsp" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Book A Room</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img class="w-100" src="img/hotel/carousel3.jpg" alt="Image">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h6 class="section-title text-white text-uppercase mb-3 animated slideInDown">Luxury Living</h6>
                                    <h1 class="display-3 text-white mb-4 animated slideInDown">Discover A Brand Luxurious Hotel</h1>
                                    <a href="RoomServlet" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Our Rooms</a>
                                    <a href="booking.jsp" class="btn btn-light py-md-3 px-md-5 animated slideInRight">Book A Room</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                            data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                            data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <!-- Carousel End -->

            <!-- About Start -->
            <div class="container-xxl py-5">
                <div class="container">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-6">
                            <h6 class="section-title text-start text-primary text-uppercase">About Us</h6>
                            <h1 class="mb-4">Welcome to <span class="text-primary text-uppercase">Wonderland</span></h1>
                            <p class="mb-4">Wonderland Hotel, located in the heart of the city, is the ideal destination for travelers who want to explore the vibrant beauty of urban life. With its modern and luxurious design, the hotel offers a comfortable and convenient resting space. Each room is equipped with high-end furnishings and large windows, offering a stunning view of the cityscape. The hotel's restaurant serves a diverse menu combining local and international cuisine, satisfying every guest's preference. Additionally, the hotel provides numerous amenities such as a swimming pool, gym, and spa, ensuring a perfect holiday experience for every visitor.  </p>
                            <div class="row g-3 pb-4">
                                <div class="col-sm-4 wow fadeIn" data-wow-delay="0.1s">
                                    <div class="border rounded p-1">
                                        <div class="border rounded text-center p-4">
                                            <i class="fa fa-hotel fa-2x text-primary mb-2"></i>
                                            <h2 class="mb-1" data-toggle="counter-up">50</h2>
                                            <p class="mb-0">Rooms</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 wow fadeIn" data-wow-delay="0.3s">
                                    <div class="border rounded p-1">
                                        <div class="border rounded text-center p-4">
                                            <i class="fa fa-users-cog fa-2x text-primary mb-2"></i>
                                            <h2 class="mb-1" data-toggle="counter-up">15</h2>
                                            <p class="mb-0">Staffs</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4 wow fadeIn" data-wow-delay="0.5s">
                                    <div class="border rounded p-1">
                                        <div class="border rounded text-center p-4">
                                            <i class="fa fa-users fa-2x text-primary mb-2"></i>
                                            <h2 class="mb-1" data-toggle="counter-up">2000</h2>
                                            <p class="mb-0">Clients</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a class="btn btn-primary py-3 px-5 mt-2" href="CombineServlet">Explore More</a>
                        </div>
                        <div class="col-lg-6">
                            <div class="row g-3">
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.1s" src="img/hotel/about1.jpg" style="margin-top: 25%;">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.3s" src="img/hotel/about2.jpg">
                                </div>
                                <div class="col-6 text-end">
                                    <img class="img-fluid rounded w-50 wow zoomIn" data-wow-delay="0.5s" src="img/hotel/about3.jpg">
                                </div>
                                <div class="col-6 text-start">
                                    <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.7s" src="img/hotel/about4.jpg">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Room Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Rooms</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Rooms</span></h1>
                </div>
                <div class="row g-4">
                    <c:forEach items="${listR}" var="ro">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <div class="room-item shadow rounded overflow-hidden">
                                <div class="position-relative">
                                    <img class="img-fluid" src="${ro.imager}" alt="">
                                    <small class="position-absolute start-0 top-100 translate-middle-y bg-primary text-white rounded py-1 px-3 ms-4">${ro.price}VNĐ/Night</small>
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
                                        <small><i class="fa fa-wifi text-primary me-2"></i>Wifi</small>
                                    </div>
                                    <p class="text-body mb-3">${ro.description}</p>
                                    <div class="d-flex justify-content-between">
                                        <a class="btn btn-sm btn-primary rounded py-2 px-4" href="RoomServlet">View Detail</a>
                                        <a class="btn btn-sm btn-dark rounded py-2 px-4" href="ReservationServlet">Book Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>                                        
                </div>

            </div>
        </div>
        <!-- Room End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Services</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Services</span></h1>
                </div>
                <div class="row g-4">
                    <c:forEach items="${listS}" var="se">
                        <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                            <img style="height: 70%" src="${se.images}" class="img-fluid mb-3 rounded" alt="Responsive image">
                            <h5 class="mb-3 text-center">${se.name}</h5>
                            <p class="text-body mb-0 text-center">${se.description}</p>
                            <small style="display: flex; margin-top: 10px;" class="justify-content-center start-0 top-100 translate-middle-y text-white rounded py-1 px-3 ms-4">${se.price}VND</small>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- Team Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title text-center text-primary text-uppercase">Our Team</h6>
                    <h1 class="mb-5">Explore Our <span class="text-primary text-uppercase">Staffs</span></h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="img/about_us/aboutHuy.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100037327361860&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>

                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/yuh_hhoang/profilecard/?igsh=dHlqNWhicDVzc25j"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0">Hoàng Huy</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="img/about_us/aboutTu.png" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100047967561612"><i class="fab fa-facebook-f"></i></a>

                                    <a  target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/fsuan.0401/"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0">Thanh Tú</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="img/about_us/aboutLinh.png" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100081948576421&mibextid=LQQJ4d"><i class="fab fa-facebook-f"></i></a>

                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/linhor33/profilecard/?igsh=dWtkZ2d0bGF3NHNm"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0">Mỹ Linh</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="img/about_us/aboutPhuc.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100038927191598&mibextid=ZbWKwL"><i class="fab fa-facebook-f"></i></a>

                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/phuctruongcm2004?igsh=cG4wOTltYjVsZDhm"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0">Hoàng Phúc</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="rounded shadow overflow-hidden">
                            <div class="position-relative">
                                <img class="img-fluid" src="img/about_us/aboutHung.jpg" alt="">
                                <div class="position-absolute start-50 top-100 translate-middle d-flex align-items-center">
                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.facebook.com/profile.php?id=100033289996509"><i class="fab fa-facebook-f"></i></a>

                                    <a target="_blank" class="btn btn-square btn-primary mx-1" href="https://www.instagram.com/hunggomu15/"><i class="fab fa-instagram"></i></a>
                                </div>
                            </div>
                            <div class="text-center p-4 mt-3">
                                <h5 class="fw-bold mb-0">Chấn Hưng</h5>
                                <small>Designation</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->

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
                        <div class="col-md-12 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">2024 Wonderland</a>, All Right Reserved. 

                            <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                            Designed By <a class="border-bottom">Group 3</a>
                            <br>Distributed By: <a class="border-bottom"target="_blank">Group 3</a>
                        </div>
                        <!--                        <div class="col-md-6 text-center text-md-end">
                                                    <div class="footer-menu">
                                                        <a href="index.jsp">Home</a>
                                                        <a href="">Cookies</a>
                                                        <a href="">Help</a>
                                                        <a href="">FQAs</a>
                                                    </div>
                                                </div>-->
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