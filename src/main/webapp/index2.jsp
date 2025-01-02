<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="com.notenest.dao.NoteDAO, com.notenest.model.NoteBean" %>
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
        <!-- Mobile menu and close button -->
        <div class="site-mobile-menu site-navbar-target">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>

        <!-- Include header and background -->
        <%@ include file="header.jsp" %>
        <%@ include file="background.jsp" %>

        <div class="site-section bg-light pb-0">
            <div class="container">
                <div class="row align-items-stretch overlap">
                    <!-- Main content area for Notes -->
                    <div class="col-lg-8">
                        <div class="container my-5">
                            <div class="d-flex flex-wrap align-items-center mb-3 gap-2">
                                <!-- Sorting dropdown and search form -->
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Sort by
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="?sort=popular">Most Popular</a></li>
                                        <li><a class="dropdown-item" href="?sort=recent">Recently Posted</a></li>
                                    </ul>
                                </div>
                                <form class="d-flex" role="search" method="GET" action="index.jsp">
                                    <input class="form-control me-2" type="search" name="search" placeholder="Search" aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit">Search</button>
                                </form>
                            </div>

                            <div class="row">
                                <!-- Fetch and Display Notes -->
                                <%
                                    try {
                                        NoteDAO noteDAO = new NoteDAO();
                                        List<NoteBean> notes = noteDAO.getAllNote(); // Get all notes

                                        for (NoteBean note : notes) {
                                %>
                                    <div class="col-md-4 mb-4">
                                        <div class="card h-100">
                                            <div class="card-body">
                                                <h5 class="card-title"><%= note.getNoteTitle() %></h5>
                                                <p class="card-text"><%= note.getNoteDescription() %></p>
                                                <p class="text-muted">Uploaded on: <%= note.getUploadDate() %></p>
                                                <p class="text-muted">Total Likes: <%= note.getTotalLike() %></p>
                                                <p class="text-muted">Author ID: <%= note.getUploaderId() %></p>
                                            </div>
                                        </div>
                                    </div>
                                <%
                                        }
                                    } catch (Exception e) {
                                        out.println("<div class='alert alert-danger'>Error fetching notes: " + e.getMessage() + "</div>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>

                    <!-- Sidebar content (small section) -->
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

                <!-- Footer Section -->
                <%@ include file="footer.jsp" %>
            </div>
        </div>
    </div>

    <!-- Scripts -->
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
