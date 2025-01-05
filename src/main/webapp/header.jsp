<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="site-navbar light site-navbar-target" role="banner">
	<style>
/* General styling for navigation links */
.nav-link {
	position: relative;
	transition: transform 0.3s, box-shadow 0.3s, color 0.3s, font-weight
		0.3s, font-size 0.3s;
	text-decoration: none;
	font-weight: normal;
	font-size: 16px;
	color: black; /* Keep text colour black for contrast */
	margin-right: 30px; /* Added right margin */
}

.nav-link:hover {
	transform: scale(1.1);
	box-shadow: 0 4px 15px rgba(255, 0, 0, 0);
}

.nav-link::before {
	content: '';
	position: absolute;
	bottom: -5px; /* Position layer below text */
	left: 0;
	right: 0;
	height: 5px;
	background: rgba(1, 1, 1, 0.1); /* Transparent black background */
	border-radius: 5px;
	z-index: -1;
	transition: height 0.3s, opacity 0.3s;
	opacity: 0;
}

.nav-link:hover::before {
	height: 10px;
	opacity: 1;
}

/* Active page styling */
.active {
	font-weight: 900; /* Extra bold font weight */
	color: red; /* Active link colour */
	font-size: 18px; /* Slightly larger font size */
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
	/* Enhances the bold effect */
}

/* Styling for Log In button */
.login-btn {
	background-color: red;
	color: white;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 5px;
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
	margin-right: 30px; /* Consistent margin for alignment */
}

.login-btn:hover {
	transform: scale(1.1);
	box-shadow: 0 4px 15px rgba(255, 0, 0, 0.5);
	background-color: darkred;
}

/* Animation for NoteNest title */
.site-logo a {
	font-size: 32px; /* Increased font size */
	font-weight: bold;
	color: black;
	transition: transform 0.3s, color 0.3s;
	text-decoration: none;
}

.site-logo a:hover {
	transform: scale(1.2); /* Larger scale effect */
	color: red;
}

/* Floating container layer for navigation links */
.floating-container {
	background: rgba(0, 0, 0, 0.35); /* Light grey transparent background */
	border-radius: 10px;
	padding: 10px 20px;
	display: inline-flex;
	align-items: center;
	gap: 20px; /* Space between links */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.68); /* Soft shadow */
}

.site-menu-wrapper {
	display: flex;
	align-items: center;
	justify-content: space-between; /* Pushes items to opposite ends */
}
</style>
	<div class="container">
		<div class="row align-items-center position-relative">
			<div class="col-3">
				<div class="site-logo">
					<a href="<%=request.getContextPath()%>/index.jsp"><strong>NoteNest</strong></a>
				</div>
			</div>

			<div class="col-9 text-right">
				<span class="d-inline-block d-lg-none"> <a href="#"
					class="site-menu-toggle js-menu-toggle py-5"> <span
						class="icon-menu h3 text-black"></span>
				</a>
				</span>

				<div class="site-menu-wrapper">
					<!-- Floating container for navigation links -->
					<div class="floating-container">
						<nav class="site-navigation d-none d-lg-block" role="navigation">
							<ul class="site-menu main-menu js-clone-nav ml-auto">
								<li><a href="<%=request.getContextPath()%>/index.jsp"
									class="nav-link" id="home-link">Home</a></li>
								<li><a href="<%=request.getContextPath()%>/profile.jsp"
									class="nav-link" id="profile-link">Profile</a></li>
								<li><a href="<%=request.getContextPath()%>/myupload.jsp"
									class="nav-link" id="myuploads-link">My Uploads</a></li>
								<li><a href="<%=request.getContextPath()%>/tutorials.jsp"
									class="nav-link" id="tutorials-link">Tutorials</a></li>
								<li><a href="<%=request.getContextPath()%>/about.jsp"
									class="nav-link" id="about-link">About Us</a></li>
							</ul>

						</nav>
					</div>
					<%
					String username = (String) session.getAttribute("username");
					if (username != null) {
					%>
					<div class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
							<%=username%>
						</a>
						<ul
							class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0"
							aria-labelledby="userDropdown">
							<li><a class="dropdown-item" href="#">My Profile</a></li>
							<li><a class="dropdown-item" href="#">Settings</a></li>
							<li><a class="dropdown-item" href="#">Log Out</a></li>
						</ul>
					</div>

					<%
					} else {
					%>
					<!-- Log In Button -->
					<a href="login.jsp" class="login-btn">Log In</a>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</div>
	<script>
		// JavaScript to highlight the active page
		const page = window.location.pathname.split('/').pop(); // Get the current page name
		const links = {
			"index.jsp" : "home-link",
			"profile.jsp" : "profile-link",
			"myupload.jsp" : "myuploads-link",
			"tutorials.jsp" : "tutorials-link",
			"about.jsp" : "about-link"
		};

		if (links[page]) {
			document.getElementById(links[page]).classList.add('active');
		}
	</script>
</header>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NoteNest</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Styles -->
<style>
/* General styling for navigation links */
.nav-link {
	position: relative;
	transition: transform 0.3s, box-shadow 0.3s, color 0.3s, font-weight
		0.3s, font-size 0.3s;
	text-decoration: none;
	font-weight: normal;
	font-size: 16px;
	color: black; /* Keep text colour black for contrast */
	margin-right: 30px; /* Added right margin */
}

.nav-link:hover {
	transform: scale(1.1);
	box-shadow: 0 4px 15px rgba(255, 0, 0, 0);
}

.nav-link::before {
	content: '';
	position: absolute;
	bottom: -5px; /* Position layer below text */
	left: 0;
	right: 0;
	height: 5px;
	background: rgba(1, 1, 1, 0.1); /* Transparent black background */
	border-radius: 5px;
	z-index: -1;
	transition: height 0.3s, opacity 0.3s;
	opacity: 0;
}

.nav-link:hover::before {
	height: 10px;
	opacity: 1;
}

/* Active page styling */
.active {
	font-weight: 900; /* Extra bold font weight */
	color: red; /* Active link colour */
	font-size: 18px; /* Slightly larger font size */
	text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
	/* Enhances the bold effect */
}

/* Styling for Log In button */
.login-btn {
	background-color: red;
	color: white;
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	padding: 10px 20px;
	border-radius: 5px;
	transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
	margin-right: 30px; /* Consistent margin for alignment */
}

.login-btn:hover {
	transform: scale(1.1);
	box-shadow: 0 4px 15px rgba(255, 0, 0, 0.5);
	background-color: darkred;
}

/* Animation for NoteNest title */
.site-logo a {
	font-size: 32px; /* Increased font size */
	font-weight: bold;
	color: black;
	transition: transform 0.3s, color 0.3s;
	text-decoration: none;
}

.site-logo a:hover {
	transform: scale(1.2); /* Larger scale effect */
	color: red;
}

/* Floating container layer for navigation links */
.floating-container {
	background: rgba(0, 0, 0, 0.35); /* Light grey transparent background */
	border-radius: 10px;
	padding: 10px 20px;
	display: inline-flex;
	align-items: center;
	gap: 20px; /* Space between links */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.68); /* Soft shadow */
}

.site-menu-wrapper {
	display: flex;
	align-items: center;
	justify-content: space-between; /* Pushes items to opposite ends */
}

/* Custom styling for the dropdown menu */
.custom-dropdown {
	background-color: rgba(0, 0, 0, 0.8);
	/* Dark semi-transparent background */
	color: white; /* White text for contrast */
	border: none; /* Remove border */
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.5); /* Soft shadow */
}

.custom-dropdown .dropdown-item {
	color: white; /* White text for dropdown items */
	transition: background-color 0.3s, color 0.3s;
}

.custom-dropdown .dropdown-item:hover {
	background-color: rgba(255, 255, 255, 0.2);
	/* Slightly lighter hover effect */
	color: #0a58ca; /* Optional: Highlight text on hover */
}
/* Adjust dropdown toggle button size */
.nav-link.dropdown-toggle {
	font-size: 1.4rem; /* Larger font for the toggle button */
	padding: 8px 16px; /* Adjust padding for better spacing */
}
</style>
</head>
<body>
	<header class="site-navbar light site-navbar-target" role="banner">
		<div class="container">
			<div class="row align-items-center position-relative">
				<div class="col-3">
					<div class="site-logo">
						<a href="<%=request.getContextPath()%>/index.jsp"><strong>NoteNest</strong></a>
					</div>
				</div>

				<div class="col-9 text-right">
					<span class="d-inline-block d-lg-none"> <a href="#"
						class="site-menu-toggle js-menu-toggle py-5"> <span
							class="icon-menu h3 text-black"></span>
					</a>
					</span>

					<div class="site-menu-wrapper">
						<!-- Floating container for navigation links -->
						<div class="floating-container">
							<nav class="site-navigation d-none d-lg-block" role="navigation">
								<ul class="site-menu main-menu js-clone-nav ml-auto">
									<li><a href="<%=request.getContextPath()%>/index.jsp"
										class="nav-link" id="home-link">Home</a></li>
									<li><a href="<%=request.getContextPath()%>/myupload.jsp"
										class="nav-link" id="myuploads-link">My Uploads</a></li>
									<li><a href="<%=request.getContextPath()%>/profile.jsp"
										class="nav-link" id="profile-link">Profile</a></li>
									<li><a href="<%=request.getContextPath()%>/about.jsp"
										class="nav-link" id="about-link">About Us</a></li>
								</ul>
							</nav>
						</div>

						<%
                            String username = (String) session.getAttribute("username");
                            if (username != null) {
                        %>
						<div class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<%=username%>
							</a>
							<ul class="dropdown-menu dropdown-menu-end custom-dropdown"
								aria-labelledby="userDropdown">
								<li><a class="dropdown-item"
									href="<%=request.getContextPath()%>/profile.jsp">My Profile</a></li>
								<li><a class="dropdown-item"
									href="<%= request.getContextPath() %>/logout.jsp">Log Out</a></li>
							</ul>
						</div>
						<%
                            } else {
                        %>
						<!-- Log In Button -->
						<a href="login.jsp" class="login-btn">Log In</a>
						<%
                            }
                        %>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Bootstrap JS and Popper.js -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

	<!-- JavaScript to highlight the active page -->
	<script>
        const page = window.location.pathname.split('/').pop();
        const links = {
            "index.jsp": "home-link",
            "profile.jsp": "profile-link",
            "myupload.jsp": "myuploads-link",
            "tutorials.jsp": "tutorials-link",
            "about.jsp": "about-link"
        };
        if (links[page]) {
            document.getElementById(links[page]).classList.add('active');
        }
    </script>
</body>
</html>
