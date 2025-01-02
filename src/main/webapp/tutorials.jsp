<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Tutorials &mdash; NoteNest</title>
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

        <!-- Include the background JSP -->
        <%@ include file="background.jsp" %>

        <div class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <div class="heading mb-4">
                            <span class="caption">Tutorial Courses</span>
                            <h2>Choose Course</h2>
                        </div>
                    </div>
                </div>
                <div class="row align-items-stretch">
                    <div class="col-lg-2">
                        <a href="#" class="course">
                            <span class="wrap-icon brand-adobeillustrator"></span>
                            <h3>Illustrator</h3>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a href="#" class="course">
                            <span class="wrap-icon brand-adobephotoshop"></span>
                            <h3>Photoshop</h3>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a href="#" class="course">
                            <span class="wrap-icon brand-angular"></span>
                            <h3>Angular</h3>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a href="#" class="course">
                            <span class="wrap-icon brand-javascript"></span>
                            <h3>JavaScript</h3>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a href="#" class="course">
                            <span class="wrap-icon brand-react"></span>
                            <h3>React</h3>
                        </a>
                    </div>
                    <div class="col-lg-2">
                        <a href="#" class="course">
                            <span class="wrap-icon brand-vue-dot-js"></span>
                            <h3>Vue</h3>
                        </a>
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
