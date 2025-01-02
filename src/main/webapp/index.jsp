<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Notenest</title>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="fonts/brand/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="site-wrap" id="home-section">
        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <!-- Include header.jsp -->
        <%@ include file="header.jsp" %>

        <!-- Include the background JSP -->
        <%@ include file="background.jsp" %>

        <div class="site-section bg-light pb-0">
            <div class="container">
                <div class="row align-items-stretch overlap">
                    <div class="col-lg-8">
                        <div class="box h-100">
                            <div class="d-flex align-items-center">
                                <div class="img"><img src="images/img_1.jpg" class="img-fluid" alt="Image"></div>
                                <div class="text">
                                    <a href="#" class="category">Tutorial</a>
                                    <h3><a href="#">Learning React Native</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                    <p class="meta">
                                        <span class="mr-2 mb-2">1hr 24m</span>
                                        <span class="mr-2 mb-2">Advanced</span>
                                        <span class="mr-2 mb-2">Jun 18, 2020</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="box h-100">
                            <div class="d-flex align-items-center">
                                <div class="img"><img src="images/img_1.jpg" class="img-fluid" alt="Image"></div>
                                <div class="text">
                                    <a href="#" class="category">Tutorial</a>
                                    <h3><a href="#">Learning React Native</a></h3>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                                    <p class="meta">
                                        <span class="mr-2 mb-2">1hr 24m</span>
                                        <span class="mr-2 mb-2">Advanced</span>
                                        <span class="mr-2 mb-2">Jun 18, 2020</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="box small h-100">
                            <div class="d-flex align-items-center mb-2">
                                <div class="img"><img src="images/img_2.jpg" class="img-fluid" alt="Image"></div>
                                <div class="text">
                                    <a href="#" class="category">Tutorial</a>
                                    <h3><a href="#">Learning React Native</a></h3>
                                </div>
                            </div>
                            <div class="d-flex align-items-center">
                                <div class="img"><img src="images/img_3.jpg" class="img-fluid" alt="Image"></div>
                                <div class="text">
                                    <a href="#" class="category">Tutorial</a>
                                    <h3><a href="#">Learning React Native</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="container my-5">
            </div>
        </div>

        <!-- Include footer.jsp -->
        <%@ include file="footer.jsp" %>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    <script src="js/jquery.waypoints.min.js"></script>
    <script src="js/jquery.animateNumber.min.js"></script>
    <script src="js/jquery.fancybox.min.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
