<!doctype html>
<html lang="en">

<head>
    <title>Tutor &mdash; Free Website Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/fonts/icomoon/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/fonts/brand/style.css">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
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

        <header class="site-navbar light site-navbar-target" role="banner">

            <div class="container">
                <div class="row align-items-center position-relative">

                    <div class="col-3">
                        <div class="site-logo">
                            <a href="index.jsp"><strong>Tutor</strong></a>
                        </div>
                    </div>

                    <div class="col-9 text-right">

                        <span class="d-inline-block d-lg-none"><a href="#" class="site-menu-toggle js-menu-toggle py-5"><span
                                    class="icon-menu h3 text-black"></span></a></span>

                        <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
                            <ul class="site-menu main-menu js-clone-nav ml-auto ">
                                <li><a href="index.jsp" class="nav-link">Home</a></li>
                                <li class="active"><a href="tutorials.jsp" class="nav-link">Tutorials</a></li>
                                <li><a href="testimonials.jsp" class="nav-link">Testimonials</a></li>
                                <li><a href="blog.jsp" class="nav-link">Blog</a></li>
                                <li><a href="about.jsp" class="nav-link">About</a></li>
                                <li><a href="contact.jsp" class="nav-link">Contact</a></li>
                            </ul>
                        </nav>
                    </div>

                </div>
            </div>

        </header>

        <div class="site-section-cover overlay" style="background-image: url('<%= request.getContextPath() %>/images/hero_bg.jpg');">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1>Learn <strong>React Native</strong></h1>
                        <p>
                            <span class="mr-2 mb-2">1hr 24m</span>
                            <span class="mr-2 mb-2">Advanced</span>
                            <span class="mr-2 mb-2">Jun 18, 2020</span>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- PDF Display Section -->
        <div class="container mt-5 mb-5">
            <h2 class="text-center mb-4">React Native Tutorial PDF</h2>
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="<%= request.getContextPath() %>/images/testPDF.pdf" frameborder="0" allowfullscreen></iframe>
            </div>
        </div>

        <footer class="site-footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <h2 class="footer-heading mb-4">About Us</h2>
                        <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live
                            the blind texts.</p>
                        <ul class="list-unstyled social">
                            <li><a href="#"><span class="icon-facebook"></span></a></li>
                            <li><a href="#"><span class="icon-instagram"></span></a></li>
                            <li><a href="#"><span class="icon-twitter"></span></a></li>
                            <li><a href="#"><span class="icon-linkedin"></span></a></li>
                        </ul>
                    </div>
                    <!-- Other footer content -->
                </div>
            </div>
        </footer>

    </div>

    <script src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/popper.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/owl.carousel.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.sticky.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.waypoints.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.animateNumber.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.fancybox.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/jquery.easing.1.3.js"></script>
    <script src="<%= request.getContextPath() %>/js/bootstrap-datepicker.min.js"></script>
    <script src="<%= request.getContextPath() %>/js/aos.js"></script>
    <script src="<%= request.getContextPath() %>/js/main.js"></script>

</body>

</html>
