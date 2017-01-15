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


            <form method="post" id="edit-form" action="Editare_cont">
                <label id="sign-label">
                    Nume<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="input-nume" name="surname" value=<% out.println(session.getAttribute("surname"));%> >
                </label>

                <label id="sign-label">
                    Prenume<span style="color:red">*</span>:
                    <input type="text" id="input-prenume" name="forename" value=<% out.println(session.getAttribute("forename"));%> >
                </label>


                <label id="sign-label">Telefon<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp; 
                    <input type="text" id="input-telefon" name="phone" value=<% out.println(session.getAttribute("phone"));%> >
                </label>

                <label id="sign-label">Adresa<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;
                    <textarea cols="22" rows="3" name="address" id="textarea-adresa">
                        <% out.println(session.getAttribute("address"));%>
                    </textarea>
                </label>

                <input type="submit" id="input-sub" value="Continuati">

                &nbsp;&nbsp;&nbsp;<span style="color:red"><em>*campuri obligatorii!</em></span>

            </form>

        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
