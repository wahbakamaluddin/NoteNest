<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.notenest.dao.NoteDAO,com.notenest.bean.NoteBean"%>

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

		<div class="site-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8 mb-5">
						<!-- 						<h2>My Uploads</h2>
 -->
						<!-- Pills Navigation -->
						<ul class="nav nav-pills mb-4" role="tablist"
							style="margin-bottom: 20px;">
							<li class="nav-item"><a class="nav-link active"
								id="view-notes-tab" data-toggle="pill" href="#view-notes"
								role="tab" aria-controls="view-notes" aria-selected="true"
								style="margin-right: 10px;">My Notes</a></li>
							<li class="nav-item"><a class="nav-link"
								id="upload-notes-tab" data-toggle="pill" href="#upload-notes"
								role="tab" aria-controls="upload-notes" aria-selected="false">Upload
									Notes</a></li>
						</ul>

						<!-- Pills Content -->
						<div class="tab-content">
							<!-- View Notes Tab -->
							<div class="tab-pane fade show active" id="view-notes"
								role="tabpanel" aria-labelledby="view-notes-tab">
								<div class="tabpanel" style="margin-bottom: 20px;">
									<div class="card-body">
										<!-- 										<h5>Your Uploaded Notes</h5>
 -->
										<!-- Example Notes -->
										<%
										try {
											// Retrieve the userId from the session
											Integer userId = (Integer) session.getAttribute("userId");
											System.out.println(userId);

											// Check if userId is available
											if (userId != null) {
												// Fetch all notes for the specific user using the NoteDAO
												NoteDAO noteDAO = new NoteDAO();
												List<NoteBean> notesById = noteDAO.getNoteByUserId(userId); // Pass userId to the DAO method
												session.setAttribute("notesById", notesById); // Store notes in the session

											} else {
												// Handle the case where the user is not logged in or userId is not found
												System.out.println("User is not logged in.");
											}
										} catch (Exception e) {
											e.printStackTrace(); // Log any exception
										}
										%>


										<%
										// Retrieve notes from the session
										List<NoteBean> notesById = (List<NoteBean>) session.getAttribute("notesById");
										%>

										<%
										if (notesById != null && !notesById.isEmpty()) {
										%>
										<%
										for (NoteBean note : notesById) {
										%>
										<div class="d-flex tutorial-item mb-4">
											<div class="img-wrap">
												<a href="#"> <img
													src="<%=request.getContextPath() + note.getThumbnailPath()%>"
													alt="Image" class="img-fluid">
												</a>
											</div>
											<div>
												<h3>
													<a href="#"><%=note.getNoteTitle()%></a>
												</h3>
												<p><%=note.getNoteDescription()%></p>
												<p class="meta">
													<span class="mr-2 mb-2"><%=note.getSubject()%></span> <span
														class="mr-2 mb-2"><%=note.getUploadDate()%></span>
												</p>
												<p>
													<a
														href="<%=request.getContextPath()%>/viewNote/<%=note.getId()%>"
														class="btn btn-primary custom-btn"> View</a> <a
														href="editNote.jsp?id=<%=note.getId()%>"
														class="btn btn-primary custom-btn"> Edit</a>
												<form action="<%=request.getContextPath()%>/deleteNote" method="POST" 
      onsubmit="return confirm('Are you sure you want to delete this note?');">
    <input type="hidden" name="noteId" value="<%=note.getId()%>">
    <button type="submit" class="btn btn-danger custom-btn">Delete</button>
</form>

												

											</div>
										</div>
										<%
										}
										%>
										<%
										} else {
										%>
										<p>You haven't uploaded any notes!</p>
										<p>Click on Upload Notes to upload note.</p>
										<%
										}
										%>

									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="upload-notes" role="tabpanel"
								aria-labelledby="upload-notes-tab" style="color: #364d59;">
								<form action="addNote" method="post"
									enctype="multipart/form-data">
									<!-- Note Title -->
									<div class="form-group" style="margin-bottom: 10px;">
										<label for="noteTitle">Note Title:</label> <input type="text"
											id="noteTitle" name="noteTitle" class="form-control"
											placeholder="Enter note title" required><br>
									</div>

									<!-- Note Description -->
									<div class="form-group" style="margin-bottom: 10px;">
										<label for="noteDescription">Note Description:</label>
										<textarea id="noteDescription" name="noteDescription"
											class="form-control" placeholder="Enter note description"
											rows="4" cols="50" required></textarea>
										<br>
									</div>

									<!-- Subject -->
									<div class="form-group" style="margin-bottom: 10px;">
										<label for="subject">Subject:</label> <input type="text"
											id="subject" name="subject" class="form-control"
											placeholder="Enter subject" required><br>
									</div>

									<!-- File Upload -->
									<div class="form-group" style="margin-bottom: 10px;">
										<label for="file">Upload File:</label> <input type="file"
											id="file" name="file" class="form-control dropify"
											accept=".pdf" required><br>
									</div>

									<div class="form-group">
										<button type="submit"
											class="btn btn-primary btn-md text-white">Upload</button>
									</div>
								</form>
							</div>

						</div>
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
