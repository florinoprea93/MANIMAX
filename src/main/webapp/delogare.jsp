<%-- 
    Document   : autentificare
    Created on : Dec 16, 2014, 10:57:54 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <title>Delogare</title>
    </head>
    <body>
        
        <%
                session.setAttribute("pt", 0);
                session.setAttribute("ct", 0);
                session.setAttribute("log", 0);
                session.setAttribute("username", "");
                session.setAttribute("password", "");
                session.setAttribute("role", "");
                String site = new String("index.jsp");
                response.setStatus(response.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
        %>
    </body>
</html>
