<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>My Uploads &mdash; NoteNest</title>
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

        <div class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5">
                        <h2>My Uploads</h2>
						 <form action="addNote" method="post" enctype="multipart/form-data">
						    <!-- Note Title -->
						    <div class="form-group" style="margin-bottom: 10px;">
						        <label for="noteTitle">Note Title:</label>
						        <input type="text" id="noteTitle" name="noteTitle" class="form-control" placeholder="Enter note title" required><br>
						    </div>
						
						    <!-- Note Description -->
						    <div class="form-group" style="margin-bottom: 10px;">
						        <label for="noteDescription">Note Description:</label>
						        <textarea id="noteDescription" name="noteDescription" class="form-control" placeholder="Enter note description" rows="4" cols="50" required></textarea><br>
						    </div>
						
						    <!-- Subject -->
						    <div class="form-group" style="margin-bottom: 10px;">
						        <label for="subject">Subject:</label>
						        <input type="text" id="subject" name="subject" class="form-control" placeholder="Enter subject" required><br>
						    </div>
						
						    <!-- File Upload -->
						    <div class="form-group" style="margin-bottom: 10px;">
						        <label for="file">Upload File:</label>
						        <input type="file" id="file" name="file" class="form-control dropify" accept=".pdf" required><br>
						    </div>
						
						    <div class="form-group">
						        <button type="submit" class="btn btn-primary btn-md text-white">Upload</button>
						    </div>
						</form>
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
