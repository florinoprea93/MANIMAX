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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script src="index.js"></script>
        <title>Autentificare</title>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp" %>
        </div>

        <form id="autentificare-form" method="post" action="Authenticate">

            <div class="form-group col-md-12 col-lg-offset-0">
                <h2 class="col-lg-offset-3">Autentificare</h2>
            </div>

            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-user">Utilizator:
                    <input type="text" class="form-control" id="input-user" name="username" value="username"
                           onclick="this.value='';" maxlength="20">
                </label>
            </div>
            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-pass">Parola:
                    <input type="password" class="form-control" id="input-pass" name="password" value="password"
                           onclick="this.value='';" maxlength="20"></label>

            </div>
            <div class="col-md-12 col-lg-offset-0">
                <button type="submit" class="btn btn-primary center-block" value="Login">Login</button>
            </div>
        </form>


        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>

        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>

    </body>
</html>
