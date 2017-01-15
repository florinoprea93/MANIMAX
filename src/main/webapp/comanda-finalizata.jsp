<%-- 
    Document   : contulmeu
    Created on : Dec 21, 2014, 12:17:32 PM
    Author     : RAFA_4_EVER
--%>

<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <title>
            Comanda Finalizata
        </title>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp"%>
        </div>

        <div id="contul-meu">
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
            <h1 id="cont-title">Comanda finalizata</h1>
            
            <%
                HashMap<String, String> produse = (HashMap<String, String>) session.getAttribute("cos");
                produse.clear();
            
            %>
            <div id="modificare-date">
                <h2>Comanda dumneavostra a fost finalizata cu succes!</h2>
                <p>Va vom contacta telefonic pentru confirmarea comenzii.Va multumim!</p>
            </div>
        </div>

        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
