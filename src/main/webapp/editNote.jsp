<%@page import="com.notenest.dao.NoteDAO,com.notenest.bean.NoteBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>My Uploads &mdash; NoteNest</title>
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

		<!-- Include background.jsp -->
		<%@ include file="background.jsp"%>

		<%
		String noteIdParam = request.getParameter("id");
		if (noteIdParam == null) {
			out.println("<p>Error: Note ID is missing.</p>");
			return;
		}

		NoteBean note = null;
		try {
			int noteId = Integer.parseInt(noteIdParam);

			// Fetch the note directly in JSP using NoteDAO
			NoteDAO noteDAO = new NoteDAO();
			note = noteDAO.getNoteById(noteId);

			if (note == null) {
				out.println("<p>Error: Note not found.</p>");
				return;
			}
		} catch (NumberFormatException e) {
			out.println("<p>Error: Invalid Note ID.</p>");
			return;
		} catch (Exception e) {
			out.println("<p>Error: Unable to fetch the note details.</p>");
			e.printStackTrace();
			return;
		}
		%>
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mb-5">
						<h2>Edit note</h2>
						<form action="editNote" method="post"
							enctype="multipart/form-data">
							<!-- Note Title -->
							<div class="form-group" style="margin-bottom: 10px;">
								<label for="noteTitle">Note Title: <%=note.getNoteTitle()%></label>
								<input type="text" id="noteTitle" name="noteTitle"
									class="form-control" placeholder="Enter note title"><br>
							</div>

							<!-- Note Description -->
							<div class="form-group" style="margin-bottom: 10px;">
								<label for="noteDescription">Note Description: <%=note.getNoteDescription()%></label>
								<textarea id="noteDescription" name="noteDescription"
									class="form-control" rows="4" cols="50"
									placeholder="Enter note description"></textarea>
								<br>
							</div>

							<!-- Subject -->
							<div class="form-group" style="margin-bottom: 10px;">
								<label for="subject">Subject: <%=note.getSubject()%></label> <input
									type="text" id="subject" name="subject" class="form-control"
									placeholder="Enter subject"><br>
							</div>


							<h6>
								Uploaded file:
								<%=note.getFileName()%>
								(You can't edit uploaded file)
							</h6>
							<div class="embed-responsive embed-responsive-16by9">
								<iframe class="embed-responsive-item"
									src="<%= request.getContextPath() %>${note.filePath}"
									frameborder="0" allowfullscreen> </iframe>
							</div>
							<!-- Note ID (hidden) -->
							<input type="hidden" name="noteId" value="<%=note.getId()%>">

							<!-- Submit Button -->
							<div style="margin-top: 20px;">
								<button type="submit" class="btn btn-primary custom-btn">Save
									Changes</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>

		<!-- Include footer.jsp -->
		<%@ include file="footer.jsp"%>
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