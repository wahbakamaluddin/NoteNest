<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login &mdash; NoteNest</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="jquery/jquery-3.4.1.js"></script>
    <script src="jquery/jquery.validate.min.js"></script>
    <style>
        body {
            background-color: #faf6f1;
            margin: 0;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        #welcome-message {
            font-size: 36px;
            color: #5e4420;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
        }

        #trademark {
            font-style: italic;
            font-family: 'Brush Script MT', cursive;
            color: #a47551;
            font-size: 20px;
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            padding: 20px;
            background-color: #ffffff;
            border: 1px solid #d6cbc0;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            text-align: center;
        }

        h2 {
            font-size: 24px;
            color: #5e4420;
            margin-bottom: 20px;
        }

        .form-control {
            margin-bottom: 15px;
            border: 1px solid #d6cbc0;
            border-radius: 4px;
            padding: 10px;
        }

        .btn {
            background-color: #a47551;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }

        .btn:hover {
            background-color: #8a5c3b;
        }

        .register-link {
            margin-top: 10px;
            color: #5e4420;
            text-decoration: none;
            display: block;
        }

        .register-link:hover {
            text-decoration: underline;
        }

        #err {
            margin-top: 10px;
            color: red;
            text-align: center;
        }
    </style>
</head>

<body>
    <!-- Welcome and Trademark -->
    <div id="welcome-message">WELCOME TO NOTENEST™</div>
    <div id="trademark">Your trusted note-sharing platform</div>

    <!-- Login Container -->
    <div class="container">
        <h2>Login</h2>
        <form id="frm-login">
            <input type="text" id="username" name="username" class="form-control" placeholder="Enter Username" required>
            <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" required>
            <button type="button" class="btn" onclick="login()">Login</button>
            <button type="button" class="btn" onclick="window.location.href='forgotpassword.jsp'">Forgot Password</button>
        </form>
        <div id="err"></div>
        <a href="register.jsp" class="register-link">Don't have an account? Register here</a>
    </div>

    <script>
        function login() {
            var data = $("#frm-login").serialize();
            $.ajax({
                type: 'POST',
                url: 'validate.jsp',
                data: data,
                dataType: 'JSON',
                success: function (data) {
                    if (data[0].msg === "1") {
                        window.location.replace("index.jsp");
                    } else {
                        $("#err").html("Invalid username or password.");
                    }
                }
            });
        }
    </script>
</body>

</html>
