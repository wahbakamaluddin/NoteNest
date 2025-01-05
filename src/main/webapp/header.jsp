<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header class="site-navbar light site-navbar-target" role="banner">
    <style>
        /* General styling for navigation links */
        .nav-link {
            position: relative;
            transition: transform 0.3s, box-shadow 0.3s, color 0.3s, font-weight 0.3s, font-size 0.3s;
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
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3); /* Enhances the bold effect */
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
                    <a href="<%= request.getContextPath() %>/index.jsp"><strong>NoteNest</strong></a>
                </div>
            </div>

            <div class="col-9 text-right">
                <span class="d-inline-block d-lg-none">
                    <a href="#" class="site-menu-toggle js-menu-toggle py-5">
                        <span class="icon-menu h3 text-black"></span>
                    </a>
                </span>

                <div class="site-menu-wrapper">
                    <!-- Floating container for navigation links -->
                    <div class="floating-container">
                        <nav class="site-navigation d-none d-lg-block" role="navigation">
						<ul class="site-menu main-menu js-clone-nav ml-auto">
    						<li><a href="<%= request.getContextPath() %>/index.jsp" class="nav-link" id="home-link">Home</a></li>
   							<li><a href="<%= request.getContextPath() %>/profile.jsp" class="nav-link" id="profile-link">Profile</a></li>
   							<li><a href="<%= request.getContextPath() %>/myupload.jsp" class="nav-link" id="myuploads-link">My Uploads</a></li>
							<li><a href="<%= request.getContextPath() %>/tutorials.jsp" class="nav-link" id="tutorials-link">Tutorials</a></li>
    						<li><a href="<%= request.getContextPath() %>/about.jsp" class="nav-link" id="about-link">About Us</a></li>
    						  <% 
            String username = (String) session.getAttribute("username");
            if (username != null) { 
        %>
            <div class="welcome-message">
                <span>Welcome, <strong><%= username %></strong></span>
                <a href="<%= request.getContextPath() %>/logout.jsp" class="logout-btn">Log Out</a>
            </div>
        <% } else { %>
            <a href="<%= request.getContextPath() %>/login.jsp" class="login-btn">Log In</a>
        <% } %>
						</ul>

                        </nav>
                    </div>
                    <!-- Log In Button -->
                    <a href="login.jsp" class="login-btn">Log In</a>
                </div>
            </div>
        </div>
    </div>
    <script>
        // JavaScript to highlight the active page
        const page = window.location.pathname.split('/').pop(); // Get the current page name
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
</header>
