<%@ page import="module5.MovieDBBean" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<title>Select Movie</title>
</head>
<body>

<h1>Select a Movie ID</h1>
<p>Choose a movie from the dropdown menu to display its full record.</p>

<jsp:useBean id="db" class="module5.MovieDBBean" scope="page" />

<%
    ArrayList<Integer> movieIDs = db.getMovieIDs();
%>

<form action="display_movie.jsp" method="post">
    <label>Select Movie ID:</label><br>
    <select name="movie_id">
        <% for (int id : movieIDs) { %>
            <option value="<%= id %>"><%= id %></option>
        <% } %>
    </select><br><br>

    <input type="submit" value="View Movie">
</form>

</body>
</html>