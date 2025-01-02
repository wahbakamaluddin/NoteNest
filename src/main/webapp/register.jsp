<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Register &mdash; NoteNest</title>
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
                            <h2>Register</h2>
                            <form action="register" method="post">
                                <div class="form-group">
                                    <label for="username">Username</label>
                                    <input type="text" class="form-control" id="username" name="username" placeholder="Your Username" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="icon-envelope"></i></span>
                                        <input type="email" class="form-control" id="email" name="email" placeholder="Your Email" required>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Your Password" required minlength="6">
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Register" class="btn btn-primary btn-md text-white w-100">
                                </div>
                                <p class="text-center">
                                    Already have an account? <a href="login.jsp">Login here</a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Include footer.jsp -->
   
