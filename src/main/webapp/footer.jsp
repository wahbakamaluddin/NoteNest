<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.site-footer {
	background-color: #343a40;
	/* Dark grey background for better contrast */
	color: #adb5bd; /* Light grey text color for body */
	padding: 15px 0; /* Reduced padding for compactness */
	font-size: 13px; /* Compact font size */
}

.site-footer a {
	color: #ced4da; /* Softer link color */
	text-decoration: none;
}

.site-footer a:hover {
	color: #f8f9fa; /* Slightly brighter hover color */
}

.site-footer h2 {
	font-size: 14px; /* Smaller heading size */
	margin-bottom: 8px; /* Reduced margin */
	color: #ffffff; /* Brighter heading color for visibility */
	font-weight: bold; /* Added bold for emphasis */
}

.site-footer .social span {
	font-size: 16px; /* Compact icon size */
	margin-right: 8px;
}

.site-footer .border-top {
	border-top: 1px solid #495057;
	margin-top: 10px; /* Reduced margin */
	padding-top: 5px; /* Reduced padding */
}
</style>
<footer class="site-footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<h2 class="footer-heading">About Us</h2>
				<p>A small corner for learners to share and grow.</p>
				<ul class="list-unstyled social">
					<li><a href="#"><span class="icon-facebook"></span></a></li>
					<li><a href="#"><span class="icon-instagram"></span></a></li>
					<li><a href="#"><span class="icon-twitter"></span></a></li>
					<li><a href="#"><span class="icon-linkedin"></span></a></li>
				</ul>
			</div>
			<div class="col-lg-9">
				<div class="row">
					<div class="col-lg-3">
						<h2 class="footer-heading">Quick Links</h2>
						<ul class="list-unstyled">
							<li><a href="<%=request.getContextPath()%>/about.jsp">About
									Us</a></li>

						</ul>
					</div>
					<div class="col-lg-3">
						<h2 class="footer-heading">Resources</h2>
						<ul class="list-unstyled">
							<li><a href="#">Learning Materials</a></li>
							<li><a href="<%=request.getContextPath()%>/FAQs.jsp">FAQs</a></li>
						</ul>
					</div>
					<div class="col-lg-3">
						<h2 class="footer-heading">Legal</h2>
						<ul class="list-unstyled">
							<li><a href="<%=request.getContextPath()%>/tos.jsp">Terms
									of Service</a></li>
							<li><a
								href="<%=request.getContextPath()%>/privacyPolicy.jsp">Privacy
									Policy</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row text-center">
			<div class="col-md-12">
				<div class="border-top">
					<p>
						&copy;
						<script>document.write(new Date().getFullYear());</script>
						NoteNest. All Rights Reserved.
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>
