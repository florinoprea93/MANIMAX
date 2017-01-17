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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script src="index.js"></script>
    </head>
    <body>
        
        <div id="header">
            <%@include file="header.jsp"%>
        </div>
        
        <%--<form method="post" id="signin-form" action="Signin">

            
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
            
        </form>--%>

        <form id="signin-form" method="post" action="Signin">

            <div class="form-group col-md-12 col-lg-offset-0">
                <h2 class="col-lg-offset-4">Sign in</h2>
            </div>

            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-nume">Nume:
                    <input type="text" class="form-control" id="input-nume" name="surname" value="nume..."
                           onclick="this.value='';" maxlength="20">
                </label>
            </div>

            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-prenume">Prenume:
                    <input type="text" class="form-control" id="input-prenume" name="forename" value="prenume..."
                           onclick="this.value='';" maxlength="20">
                </label>
            </div>

            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-prenume">User:
                    <input type="text" class="form-control" id="input-user" name="username" value="username..."
                           onclick="this.value='';" maxlength="20">
                </label>
            </div>
            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-pass">Parola:
                    <input type="password" class="form-control" id="input-pass" name="password" value="password"
                           onclick="this.value='';" maxlength="20"></label>
            </div>

            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="input-prenume">Telefon:
                    <input type="text" class="form-control" id="input-telefon" name="phone" value="telefon..."
                           onclick="this.value='';" maxlength="14">
                </label>
            </div>

            <div class="form-group col-md-12 col-lg-offset-0">
                <label for="textarea-adresa">Adresa:
                    <textarea cols="22" rows="3" class="form-control" id="textarea-adresa" name="address"
                           onclick="this.value='';" maxlength="20">
                         adresa...
                    </textarea>
                </label>
            </div>
            <div class="col-md-12 col-lg-offset-0">
                <button type="submit" class="btn btn-primary center-block" value="Sign in">Sign in</button>
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
