<%-- 
    Document   : signin
    Created on : Dec 22, 2014, 8:19:43 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
    <head>
        <title>Schimba parola</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
    </head>
    <body>


        <%
            String pass1 = request.getParameter("password1");
            String pass2 = request.getParameter("password2");

            if (pass1.equals(pass2)) {
                Object username = session.getAttribute("username");
                Object password = session.getAttribute("password");

        %>


        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://$localhost/petshop:$"
                                   user="root" password=""  />

        <sql:update dataSource="${snapshot}" var="count">

            UPDATE client SET password ="<% out.print(pass1); %>"  WHERE (username="<% out.print(username);%>")AND(password="<% out.print(password);%>") 

        </sql:update>

        <%
                String site = "delogare.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else {
                String site = "schimba-parola.html";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        %>


    </body>
</html>
