<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login / Register</title>
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
                            Share, collaborate, and explore a world of ideas. NoteNest empowers you to create and share notes effortlessly.
                        </p>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card">
                            <div class="card-body py-5 px-md-5">
                                <!-- Nav pills for Login/Register -->
                                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link active" id="pills-login-tab" data-bs-toggle="pill" href="#pills-login" role="tab" aria-controls="pills-login" aria-selected="true">Login</a>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <a class="nav-link" id="pills-register-tab" data-bs-toggle="pill" href="#pills-register" role="tab" aria-controls="pills-register" aria-selected="false">Register</a>
                                    </li>
                                </ul>

                                <!-- Tab content for Login/Register -->
                                <div class="tab-content" id="pills-tabContent">
                                    <!-- Login Form -->
                                    <div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="pills-login-tab">
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
                                                <p>Don't have an account? <a href="#" class="link-info" data-bs-toggle="pill" data-bs-target="#pills-register">Register here</a></p>
                                            </div>
                                            <div class="d-flex justify-content-center mt-4">
                                                <button type="button" class="btn btn-primary px-5 rounded-pill" onclick="login()">Sign In</button>
                                            </div>
                                        </form>
                                    </div>

                                    <!-- Register Form -->
                                    <div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="pills-register-tab">
                                        <form id="frm-register" name="frm-register">
                                            <!-- Full Name -->
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="fullName">Full Name</label>
                                                <input type="text" class="form-control" id="fullName" name="fullName" required />
                                            </div>

                                            <!-- Username -->
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="username">Username</label>
                                                <input type="text" class="form-control" id="username" name="username" required />
                                            </div>
										    <!-- Email -->
										    <div class="form-outline mb-4">
										        <label class="form-label" for="email">Email</label>
										        <input type="email" class="form-control" id="email" name="email" required />
										    </div>
                                            <!-- Password -->
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="password">Password</label>
                                                <input type="password" class="form-control" id="password" name="password" required />
                                            </div>
                                            
                                            <!-- Confirm Password -->
                                            <div class="form-outline mb-4">
                                                <label class="form-label" for="confirmPassword">Confirm Password</label>
                                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required />
                                            </div>

                                            <div class="text-center mt-3">
                                                <p>Already have an account? <a href="#" class="link-info" data-bs-toggle="pill" data-bs-target="#pills-login">Login here</a></p>
                                            </div>

                                            <div class="d-flex justify-content-center mt-4">
                                                <button type="button" class="btn btn-primary px-5" onclick="addUser()">Sign up</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>

	    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- jQuery Validation Plugin -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script>
        function login() {
            var data = $("#frm-login").serialize();

            $.ajax({
                type: 'POST',
                url: 'validate.jsp',
                data: data,
                dataType: 'JSON',
                success: function(response) {
                    if (response.length > 0) {
                        var msg = response[0].msg;

                        if (msg == "1") {
                            window.location.replace("index.jsp");
                        } else if (msg == "3") {
                            $("#err").removeClass("d-none").html("Incorrect username or password. Please try again.").fadeIn('slow');
                        }
                    }
                },
                error: function(xhr, status, error) {
                    $("#err").removeClass("d-none").html("Unable to connect to the server. Please try again later.").fadeIn('slow');
                }
            });
        }

        function addUser() {
            // Validate form before proceeding
            if ($("#frm-register").valid()) {
                var url = 'addregister.jsp';
                var data = $("#frm-register").serialize();
                $.ajax({
                    type: 'POST',
                    url: url,
                    dataType: 'json', // Expect JSON response
                    data: data,
                    success: function (response) {
                        if (response && response[0]?.status === 'success') {
                            alert("User registered successfully!");
                            $("#frm-register")[0].reset(); // Reset form
                        } else {
                            alert("Error: " + response[0]?.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("An error occurred: " + error);
                    }
                });
            }
        }
    </script>
</body>

</html>
