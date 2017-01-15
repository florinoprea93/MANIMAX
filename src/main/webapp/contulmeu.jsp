<%-- 
    Document   : contulmeu
    Created on : Dec 21, 2014, 12:17:32 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <title>
            <%
                out.println(session.getAttribute("name"));
            %>
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
            <h1 id="cont-title">Contul meu</h1>
            
            
            <div id="modificare-date">
                <ul id="date-modify">
                    <li>
                        <u>
                            <a href="editare-cont.jsp" style="color: black;font-size: 15px";>Editati Informatiile Contului</a>
                        </u>
                    </li>
                    <li>
                        <u>
                            <a href="schimba-parola.html" style="color: black;font-size: 15px";>Schimbati Parola</a>
                        </u>
                    </li>
                </ul>
            </div>
        </div>

        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
