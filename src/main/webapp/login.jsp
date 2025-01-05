<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        .full-page-section {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: hsl(0, 0%, 96%);
        }
    </style>
</head>
<body class="bg-light">
    <!-- Section: Full-page block -->
    <section class="full-page-section">
        <div class="px-4 py-5 px-md-5 text-center text-lg-start">
            <div class="container">
                <div class="row gx-lg-5 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <h1 class="my-5 display-3 fw-bold ls-tight">
                            NoteNest <br />
                            <span class="text-primary">for sharing notes</span>
                        </h1>
                        <p style="color: hsl(217, 10%, 50.8%)">
                            Share, collaborate, and explore a world of ideas. NoteNest empowers you to create and share notes 
                            effortlessly. Whether for business, education, or personal use, unlock the potential of your thoughts.
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card">
                            <div class="card-body py-5 px-md-5">
                               <form id="frm-login" name="frm-login">
                                    <div id="err" class="alert alert-danger mt-3 d-none" role="alert"></div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" required />
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required />
                                    </div>					
                                    <div class="text-center mt-3">
                                        <p>Don't have an account? <a href="register.jsp" class="link-info" onclick="register()">Register here</a></p>
                                    </div>
                                    <div class="d-flex justify-content-center mt-4">
                                        <button type="button" class="btn btn-primary px-5 rounded-pill" onclick="login()">Sign In</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <!-- jQuery -->
    <script src="jquery/jquery-3.4.1.js"></script>
    <script src="jquery/jquery.validate.min.js"></script>
    <script>
        var msg = null;

        function login() {
            var data = $("#frm-login").serialize();

            $.ajax({
                type: 'POST',
                url: 'validate.jsp',
                data: data,
                dataType: 'JSON',
                success: function (response) {
                    msg = response.msg;
                    console.log(msg);

                    if (msg == "1") {
                        window.location.replace("index.jsp");
                    } else if (msg == "3") {
                        $("#err").removeClass("d-none").html("Username or Password do not match").fadeIn('slow');
                    } else {
                        $("#err").removeClass("d-none").html("An unexpected error occurred").fadeIn('slow');
                    }
                }
            });
        }

        function register() {
            window.location.href = 'register.jsp'; // Replace 'register.jsp' with your registration page path
        }
    </script>
</body>
</html>

 --%>
 
 
 <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        .full-page-section {
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: hsl(0, 0%, 96%);
        }
    </style>
</head>

<body class="bg-light">
    <!-- Section: Full-page block -->
    <section class="full-page-section">
        <div class="px-4 py-5 px-md-5 text-center text-lg-start">
            <div class="container">
                <div class="row gx-lg-5 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <h1 class="my-5 display-3 fw-bold ls-tight">
                            NoteNest <br />
                            <span class="text-primary">for sharing notes</span>
                        </h1>
                        <p style="color: hsl(217, 10%, 50.8%)">
                            Share, collaborate, and explore a world of ideas. NoteNest empowers you to create and share notes
                            effortlessly. Whether for business, education, or personal use, unlock the potential of your thoughts.
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card">
                            <div class="card-body py-5 px-md-5">
                                <form id="frm-login" name="frm-login">
                                    <div id="err" class="alert alert-danger mt-3 d-none" role="alert"></div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="username">Username</label>
                                        <input type="text" class="form-control" id="username" name="username" required />
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required />
                                    </div>
                                    <div class="text-center mt-3">
                                        <p>Don't have an account? <a href="register.jsp" class="link-info" onclick="register()">Register here</a></p>
                                    </div>
                                    <div class="d-flex justify-content-center mt-4">
                                        <button type="button" class="btn btn-primary px-5 rounded-pill" onclick="login()">Sign In</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery (Ensure it's loaded before other scripts) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

    <!-- jQuery Validation (if required) -->
    <script src="jquery/jquery.validate.min.js"></script>
    
    <!-- Custom Script -->
    <script>
        var msg = null;

        function login() {
            var data = $("#frm-login").serialize();

            $.ajax({
                type: 'POST',
                url: 'validate.jsp',
                data: data,
                dataType: 'JSON',
                success: function (response) {
                    msg = response.msg;
                    console.log(msg);

                    if (msg == "1") {
                        window.location.replace("index.jsp");
                    } else if (msg == "3") {
                        $("#err").removeClass("d-none").html("Username or Password do not match").fadeIn('slow');
                    } else {
                        $("#err").removeClass("d-none").html("An unexpected error occurred").fadeIn('slow');
                    }
                }
            });
        }

        function register() {
            window.location.href = 'register.jsp'; // Replace 'register.jsp' with your registration page path
        }
    </script>
</body>

</html>
 