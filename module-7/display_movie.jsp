<%@ page import="module5.MovieDBBean" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Movie Details</title>
</head>
<body>

<h1>Movie Record Details</h1>
<p>The table below displays all fields for the selected movie.</p>

<jsp:useBean id="db" class="module5.MovieDBBean" scope="page" />

<%
    int movieID = Integer.parseInt(request.getParameter("movie_id"));
    ResultSet rs = db.getMovieByID(movieID);
%>

<table border="1" cellpadding="8" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Genre</th><th>Year</th><th>Rating</th><th>Director</th>
        </tr>
    </thead>
    <tbody>
    <%
        if (rs.next()) {
    %>
        <tr>
            <td><%= rs.getInt("movie_id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getInt("release_year") %></td>
            <td><%= rs.getDouble("rating") %></td>
            <td><%= rs.getString("director") %></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>