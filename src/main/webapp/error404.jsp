<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Not Found</title>

    <!-- Google Fonts (if you want to use the same font as NoteNest) -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: #f4f7f6; /* Light background to match NoteNest's aesthetic */
            color: #333; /* Dark text color for readability */
            text-align: center;
            padding: 50px 0;
        }

        h1 {
            font-size: 100px;
            font-weight: 600;
            color: #ff6347; /* Accent color that matches the NoteNest theme */
            margin: 0 0 20px;
        }

        p {
            font-size: 1.2em;
            color: #555; /* Subtle color for descriptive text */
            margin-bottom: 40px;
        }

        code {
            display: block;
            font-size: 1.1em;
            color: #555;
            background-color: #fff;
            border-radius: 8px;
            padding: 15px;
            margin: 20px auto;
            width: fit-content;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        a {
            text-decoration: none;
            color: #fff;
            background-color: #008CBA; /* Consistent with NoteNest's button colors */
            padding: 12px 30px;
            border-radius: 30px;
            font-size: 18px;
            margin-top: 30px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #005f6a; /* Darker hover effect */
        }

        @media screen and (max-width: 880px) {
            h1 {
                font-size: 70px;
            }

            p {
                font-size: 1em;
            }

            a {
                padding: 10px 25px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
    <h1>404</h1>
    <p>Oops! The page you're looking for doesn't exist.</p>

    <code><span>this_page</span>.<em>not_found</em> = true;</code>
    <code><span>if</span> (<b>you_spelt_it_wrong</b>) {<span>try_again()</span>;}</code>
    <code><span>else if (<b>we_screwed_up</b>)</span> {<em>alert</em>(<i>"We're really sorry about that."</i>); <span>window</span>.<em>location</em> = home;}</code>

    <a href="index.jsp">Back to Home</a>

    <script>
        function type(n, t) {
            var str = document.getElementsByTagName("code")[n].innerHTML.toString();
            var i = 0;
            document.getElementsByTagName("code")[n].innerHTML = "";

            setTimeout(function() {
                var se = setInterval(function() {
                    i++;
                    document.getElementsByTagName("code")[n].innerHTML =
                        str.slice(0, i) + "|";
                    if (i == str.length) {
                        clearInterval(se);
                        document.getElementsByTagName("code")[n].innerHTML = str;
                    }
                }, 10);
            }, t);
        }

        type(0, 0);
        type(1, 600);
        type(2, 1300);
    </script>
</body>
</html>
