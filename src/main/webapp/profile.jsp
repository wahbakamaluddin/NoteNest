<%@ page import="com.notenest.bean.UserBean"%>
<%@ page import="com.notenest.dao.UserDAO2"%>
<%@ page import="com.notenest.util.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    // Get userId from session
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Fetch user details
            UserDAO2 userDAO = new UserDAO2();
            UserBean user = userDAO.getUserByUserId(userId);

%>

<!DOCTYPE html>
<html lang="en">

<head>
<title>Profile &mdash; NoteNest</title>
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
		<!-- Include header.jsp -->
		<%@ include file="header.jsp"%>
		<!-- Include the background JSP -->
		<%@ include file="background.jsp"%>

		<div class="site-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-8 mb-5">
						<h2>My Profile</h2>

						<%
                            if (user != null) {
                        %>
						<div>
							<ul class="nav nav-pills justify-content-center mb-3"
								id="pills-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="pills-view-tab" data-toggle="pill" href="#pills-view"
									role="tab" aria-controls="pills-view" aria-selected="true">View
										Profile</a></li>
								<li class="nav-item"><a class="nav-link"
									id="pills-edit-tab" data-toggle="pill" href="#pills-edit"
									role="tab" aria-controls="pills-edit" aria-selected="false">Edit
										Profile</a></li>
							</ul>

							<!-- Tab Content -->
							<div class="tab-content" id="pills-tabContent">
								<!-- View Profile Tab -->
								<div class="tab-pane fade show active" id="pills-view"
									role="tabpanel" aria-labelledby="pills-view-tab">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">View Profile</h5>
											<table class="table table-borderless">
												<tr>
													<th>Full Name:</th>
													<td><%= user.getFullName() %></td>
												</tr>
												<tr>
													<th>Username:</th>
													<td><%= user.getUsername() %></td>
												</tr>
												<tr>
													<th>Email:</th>
													<td><%= user.getEmail() %></td>
												</tr>
											</table>
										</div>
									</div>
								</div>

								<!-- Edit Profile Tab -->
								<div class="tab-pane fade" id="pills-edit" role="tabpanel"
									aria-labelledby="pills-edit-tab">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">Edit Profile</h5>
											<form action="editUser" method="post">
												<input type="hidden" name="userId"
													value="<%= user.getUserId() %>">

												<div class="form-group">
													<label for="fullName">Full Name</label> <input type="text"
														class="form-control" id="fullName" name="fullName"
														value="<%= user.getFullName() %>" required>
												</div>
												<div class="form-group">
													<label for="username">Username</label> <input type="text"
														class="form-control" id="username" name="username"
														value="<%= user.getUsername() %>" required>
												</div>
												<div class="form-group">
													<label for="email">Email</label> <input type="email"
														class="form-control" id="email" name="email"
														value="<%= user.getEmail() %>" required>
												</div>
<!-- 												<div class="form-group">
													<label for="password">New Password</label> <input
														type="password" class="form-control" id="password"
														name="password">
												</div> -->
												<button type="submit" class="btn btn-primary">Update
													Profile</button>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
						<% } else { %>
						<p class="text-danger">Unable to fetch user details. Please
							check the database or contact support.</p>
						<% } %>
					</div>
				</div>
			</div>
		</div>

		<%@ include file="footer.jsp"%>
	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>

</html>
