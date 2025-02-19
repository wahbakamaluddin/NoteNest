<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.notenest.dao.NoteDAO,com.notenest.bean.NoteBean"%>

<!doctype html>
<html lang="en">

<head>
<title>NoteNest</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap"
	rel="stylesheet">
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
		<%@ include file="header.jsp"%>
		<!-- Include the background JSP -->
		<%@ include file="background.jsp"%>

		<div class="site-section bg-light">
			<div class="container">
				<div class="row mb-5 align-items-center">
					<!--  <div class="col-lg-6 mb-4 mb-lg-0">
                        <form action="#" class="d-flex search-form">
                            <input type="search" id="searchNotes" class="form-control mr-2" placeholder="Search notes">
                        </form>
                    </div> -->

					<div class="col-lg-6 text-lg-right">
						<div class="d-inline-flex align-items-center ml-auto">
							<span class="mr-4">Share:</span> <a href="#"
								class="mx-2 social-item"><span class="icon-facebook"></span></a>
							<a href="#" class="mx-2 social-item"><span
								class="icon-twitter"></span></a> <a href="#"
								class="mx-2 social-item"><span class="icon-linkedin"></span></a>
						</div>
					</div>

				</div>

				<div class="row justify-content-center">
					<div class="col-12">
						<div class="heading mb-4 text-center">
							<span class="caption">Latest</span>
							<h2>Notes</h2>
						</div>
					</div>
					<div class="col-lg-8">
						<%
						try {
							// Fetch all notes using the NoteDAO
							NoteDAO noteDAO = new NoteDAO();
							List<NoteBean> notes = noteDAO.getAllNote(); // Get all notes
							session.setAttribute("note", notes); // Store notes in the session
						} catch (Exception e) {
							e.printStackTrace(); // Log any exception
						}

						// Retrieve notes from the session
						List<NoteBean> notes = (List<NoteBean>) session.getAttribute("note");
						%>

						<%
						if (notes != null && !notes.isEmpty()) {
						%>
						<%
						for (NoteBean note : notes) {
						%>
						<div class="d-flex tutorial-item mb-4 note-item"
							data-title="<%=note.getNoteTitle().toLowerCase()%>"
							data-description="<%=note.getNoteDescription().toLowerCase()%>"
							data-subject="<%=note.getSubject().toLowerCase()%>">
							<div class="img-wrap">
								<a href="#"> <img
									src="<%=request.getContextPath() + note.getThumbnailPath()%>"
									alt="Image" class="img-fluid">
								</a>
							</div>
							<div>
								<h3>
									<a><%=note.getNoteTitle()%></a>
								</h3>
								<p><%=note.getNoteDescription()%></p>
								<p class="meta">
									<span class="mr-2 mb-2"><%=note.getSubject()%></span> <span
										class="mr-2 mb-2"><%=note.getUploadDate()%></span>
								</p>
								<p>
									<a
										href="<%=request.getContextPath()%>/viewNote/<%=note.getId()%>"
										class="btn btn-primary custom-btn"> View</a>
								</p>
							</div>
						</div>
						<%
						}
						%>
						<%
						} else {
						%>
						<p>No notes available at the moment.</p>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    document.addEventListener("DOMContentLoaded", () => {
        const currentURL = encodeURIComponent(window.location.href);
        const pageTitle = encodeURIComponent(document.title);

        document.querySelector(".icon-facebook").parentNode.href = `https://www.facebook.com/sharer/sharer.php?u=${currentURL}`;
        document.querySelector(".icon-twitter").parentNode.href = `https://twitter.com/intent/tweet?url=${currentURL}&text=${pageTitle}`;
        document.querySelector(".icon-linkedin").parentNode.href = `https://www.linkedin.com/shareArticle?mini=true&url=${currentURL}&title=${pageTitle}`;

        const shareLinks = document.querySelectorAll(".social-item a");
        shareLinks.forEach(link => {
            link.addEventListener("click", (e) => {
                e.preventDefault();
                const url = link.href;
                window.open(url, "_blank", "width=600,height=400");
            });
        });
    });

    </script>

	<!-- Include footer.jsp -->
	<%@ include file="footer.jsp"%>

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
