<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Notenest</title>
<link
	href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/brand/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
</head>

<body>

	<div class="site-wrap" id="home-section">

		<!-- Include header.jsp -->
		<%@ include file="header.jsp"%>

		<!-- Include the background JSP -->
		<%@ include file="background.jsp"%>

		<!-- Main Content -->
		<div class="container mt-5 mb-5">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-10 text-center">
					<h1>
						<strong>${note.noteTitle}</strong>
					</h1>
					<p>
						<span class="mr-2 mb-2">${note.subject}</span> <span
							class="mr-2 mb-2">${note.uploadDate}</span>
					</p>
				</div>
			</div>

			<!-- PDF Display Section -->
			<h2 class="text-center mb-4">${note.fileName}</h2>
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item"
					src="<%= request.getContextPath() %>${note.filePath}"
					frameborder="0" allowfullscreen> </iframe>
			</div>



		</div>
		<!-- Include footer.jsp -->
		<%@ include file="footer.jsp"%>
		<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.waypoints.min.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/jquery.animateNumber.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.fancybox.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery.easing.1.3.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/aos.js"></script>
		<script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>

</html>
