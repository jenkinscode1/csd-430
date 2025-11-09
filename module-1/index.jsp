<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>My First JSP Page</title>
</head>
<body>
    <h1>Welcome to My JSP Page!</h1>
    <%
        String user = "Jelani";
        out.println("<p>Testing Testing by , " + user</p>");
    %>
</body>
</html>