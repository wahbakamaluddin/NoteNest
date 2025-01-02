<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>About Us &mdash; NoteNest</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

        <!-- Include background.jsp -->
        <%@ include file="background.jsp" %>

        <!-- About Section -->
        <div class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 mb-5 mb-lg-0 order-lg-2">
                        <img src="images/hero_bg.jpg" alt="Image" class="img-fluid rounded">
                    </div>
                    <div class="col-lg-4 mr-auto">
                        <div class="heading mb-4">
                            <span class="caption">About Us</span>
                            <h2>Our Company</h2>
                        </div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit suscipit, repudiandae similique accusantium eius nulla quam laudantium sequi.</p>
                        <p>Debitis voluptates corporis saepe molestias tenetur ab quae, quo earum commodi, laborum dolore, fuga aliquid delectus cum ipsa?</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Meet the Team Section -->
        <div class="site-section bg-light">
            <div class="container">
                <div class="row justify-content-center text-center mb-5 section-2-title">
                    <div class="col-md-6">
                        <div class="heading mb-4">
                            <span class="caption">The Team</span>
                            <h2>Meet Our Team</h2>
                        </div>
                    </div>
                </div>
                <div class="row align-items-stretch">
                    <!-- Add team member cards here -->
                    <%-- Repeat similar cards for team members --%>
                </div>
            </div>
        </div>

        <!-- Contact Info Section -->
        <div class="site-section bg-light" id="contact-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5">
                        <form action="#" method="post">
                            <div class="form-group row">
                                <div class="col-md-6 mb-4 mb-lg-0">
                                    <input type="text" class="form-control" placeholder="First name">
                                </div>
                                <div class="col-md-6">
                                    <input type="text" class="form-control" placeholder="Last name">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <input type="text" class="form-control" placeholder="Email address">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-12">
                                    <textarea name="" id="" class="form-control" placeholder="Write your message." cols="30" rows="10"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-md-6 mr-auto">
                                    <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="Send Message">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4 ml-auto">
                        <div class="bg-white p-3 p-md-5">
                            <h3 class="text-black mb-4">Contact Info</h3>
                            <ul class="list-unstyled footer-link">
                                <li class="d-block mb-3">
                                    <span class="d-block text-black">Address:</span>
                                    <span>34 Street Name, City Name Here, United States</span>
                                </li>
                                <li class="d-block mb-3">
                                    <span class="d-block text-black">Phone:</span>
                                    <span>+1 242 4942 290</span>
                                </li>
                                <li class="d-block mb-3">
                                    <span class="d-block text-black">Email:</span>
                                    <span>info@yourdomain.com</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
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
