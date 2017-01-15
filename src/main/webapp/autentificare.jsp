<%-- 
    Document   : autentificare
    Created on : Dec 22, 2014, 8:20:42 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <title>Autentificare</title>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp" %>
        </div>
        <form method="post" id="autentificare-form" action="Autentificare">
            <label>User:&nbsp;&nbsp;&nbsp;
                <input type="text" id="input-user" name="username" value="username" onclick="this.value='';">
                <span style="color:red;font-size: 10px;padding: 0px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Username incorect!!!</em></span>
            </label>
            
            <label>Parola:
                <input type="password" id="input-pass" name="password" value="password" onclick="this.value='';">
                <span style="color:red;font-size: 10px;padding: 0px;"><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Parola incorecta!!!</em></span>
            </label>
                        
            <input type="submit" id="input-sub" value="Login">
            
        </form>
        
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
