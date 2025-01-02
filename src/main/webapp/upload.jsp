<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Notes</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropify/0.2.2/css/dropify.min.css">
</head>
<body>
    <h2>Upload Your Note</h2>
    <form action="addNote" method="post" enctype="multipart/form-data">

        <!-- Note Title -->
        <label for="noteTitle">Note Title:</label>
        <input type="text" id="noteTitle" name="noteTitle" placeholder="Enter note title" required><br><br>

        <!-- Note Description -->
        <label for="noteDescription">Note Description:</label>
        <textarea id="noteDescription" name="noteDescription" placeholder="Enter note description" rows="4" cols="50" required></textarea><br><br>

        <!-- Subject -->
        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" placeholder="Enter subject" required><br><br>

        <!-- File Upload -->
        <label for="file">Upload File:</label>
        <input type="file" id="file" name="file" class="dropify" accept=".pdf" required><br><br>

        <button type="submit">Upload</button>
    </form>

    <!-- jQuery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- Dropify JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/dropify/0.2.2/js/dropify.min.js"></script>
    <script>
        $(document).ready(function () {
            // Initialize Dropify
            $('.dropify').dropify();
        });
    </script>
</body>
</html>
