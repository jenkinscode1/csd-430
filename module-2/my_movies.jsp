<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Jelani Jenkins Movies</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<h1>Jelani's Movies Favorite Movies</h1>
<p>This table lists some of my favorite movies, including the release year and genre. The data is generated dynamically using JSP scriptlets.</p>

<%
    String[][] movies = {
        {"Inception", "2010", "Science Fiction"},
        {"The Dark Knight", "2008", "Action"},
        {"Interstellar", "2014", "Adventure"},
        {"Gladiator", "2000", "Historical Drama"},
        {"The Matrix", "1999", "Science Fiction"}
    };
%>
<table>
    <thead>
        <tr>
            <th>Movie Title</th>
            <th>Release Year</th>
            <th>Genre</th>
        </tr>
    </thead>
    <tbody>
        <%
            for (int i = 0; i < movies.length; i++) {
        %>
            <tr>
                <td><%= movies[i][0] %></td>
                <td><%= movies[i][1] %></td>
                <td><%= movies[i][2] %></td>
            </tr>
        <%
            }
        %>
    </tbody>
</table>
</body>
</html>