<%-- 
    Document   : signin
    Created on : Dec 22, 2014, 8:19:43 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editare cont</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
    </head>
    <body>

        <div id="header">
            <%@include file="header.jsp"%>
        </div>
        <div id="contul-meu">

            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
            <a href="contulmeu.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Contul meu</u></a>
            <h1 id="cont-title">Informatiile Contului Meu</h1>

            <form id="edit-form" method="post" action="Editare_cont">

                <div class="form-group col-md-12 col-lg-offset-0">
                    <h2 class="col-lg-offset-3">Editare cont</h2>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-nume">Nume:
                        <input type="text" class="form-control" id="input-nume" name="surname"
                               value=<% out.println(session.getAttribute("surname"));%> maxlength="20">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-prenume">Prenume:
                        <input type="text" class="form-control" id="input-prenume" name="forename"
                               value=<% out.println(session.getAttribute("forename"));%> maxlength="20">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-prenume">Telefon:
                        <input type="text" class="form-control" id="input-telefon" name="phone"
                               value=<% out.println(session.getAttribute("phone"));%> maxlength="14">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="textarea-adresa">Adresa:
                        <textarea cols="22" rows="3" class="form-control" id="textarea-adresa"
                                  name="address"><% out.println(session.getAttribute("address"));%>
                        </textarea>
                    </label>
                </div>
                <div class="col-md-12 col-lg-offset-0">
                    <button type="submit" class="btn btn-primary center-block" value="Sign in">Salveaza</button>
                </div>
            </form>
        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
