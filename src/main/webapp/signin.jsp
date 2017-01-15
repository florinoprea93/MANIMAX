<%-- 
    Document   : signin
    Created on : Dec 22, 2014, 8:19:43 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign in</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
    </head>
    <body>
        
        <div id="header">
            <%@include file="header.jsp"%>
        </div>
        
        <form method="post" id="signin-form" action="Signin">
            <label id="sign-label">
                Nume<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" id="input-nume" name="surname" value="nume..." onclick="this.value='';">
            </label>
            
            <label id="sign-label">
                Prenume<span style="color:red">*</span>:
                <input type="text" id="input-prenume" name="forename" value="prenume..." onclick="this.value='';">
            </label>
            
            <label id="sign-label">User<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" id="input-user" name="username" value="username..." onclick="this.value='';">
            </label>
            
            <label id="sign-label">Parola<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="password" id="input-pass" name="password" value="password" onclick="this.value='';">
            </label>
            
            <label id="sign-label">Telefon<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;
                <input type="text" id="input-telefon" name="phone" value="telefon..." onclick="this.value='';">
            </label>
            
            <label id="sign-label">Adresa<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;
                <textarea cols="22" rows="3" name="address" id="textarea-adresa" onclick="this.value='';">
                Introduceti adresa...
                </textarea>
            </label>
                        
            <input type="submit" id="input-sub" value="Sign in">
            
            &nbsp;&nbsp;&nbsp;<span style="color:red"><em>*campuri obligatorii!</em></span>
            
        </form>
        
        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
