<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Forgot Password &mdash; NoteNest</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <div class="site-wrap">

        <!-- Include header.jsp -->
        <%@ include file="header.jsp" %>

        <div class="login-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card">
                            <h2>Forgot Password</h2>
                            <form action="forgotpassword" method="post">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="icon-envelope"></i></span>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Submit" class="btn btn-primary btn-md text-white w-100">
                                </div>
                            </form>
                        </div>
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
</body>

</html>
