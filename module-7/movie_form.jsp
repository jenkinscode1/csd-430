<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Movie</title>
</head>
<body>

<h1>Add a New Movie</h1>
<p>Use this form to add a new movie record to the CSD430 database.</p>

<form action="add_movie.jsp" method="post">
    <p>
        <label>Title:</label><br>
        <input type="text" name="title" required>
    </p>

    <p>
        <label>Genre:</label><br>
        <input type="text" name="genre" required>
    </p>

    <p>
        <label>Release Year:</label><br>
        <input type="number" name="release_year" required>
    </p>

    <p>
        <label>Rating:</label><br>
        <input type="text" name="rating" required>
    </p>

    <p>
        <label>Director:</label><br>
        <input type="text" name="director" required>
    </p>

    <p>
        <input type="submit" value="Add Movie">
    </p>
</form>

<p><a href="index.jsp">Back to index</a></p>

</body>
</html>
