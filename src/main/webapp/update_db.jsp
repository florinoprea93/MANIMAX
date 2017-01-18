<%@page import="JDBC.Functions" %>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update DATABASE</title>
    </head>
    <body>
        <div id="header">

            <%@include file="header.jsp"%>

        </div>


        <div id="add-produs">

            <form method="get" id="update-form" action="UpdateDatabase">

                <div class="form-group col-md-12 col-md-offset-0">
                    <h2 class="col-lg-offset-2">Adauga produs</h2>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-produs">Produs:
                        <input type="text" class="form-control" id="input-produs" name="produs" value="produs..."
                               onclick="this.value='';" maxlength="20">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-pret">Pret:
                        <input type="text" class="form-control" id="input-pret" name="pret" value="pret..."
                               onclick="this.value='';" maxlength="20">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-stoc">Pret:
                        <input type="text" class="form-control" id="input-stoc" name="stoc" value="stoc..."
                               onclick="this.value='';" maxlength="20">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-unitate">Pret:
                        <input type="text" class="form-control" id="input-unitate" name="unitate" value="unitate..."
                               onclick="this.value='';" maxlength="20">
                    </label>
                </div>

                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-imagine">Pret:
                        <input type="text" class="form-control" id="input-imagine" name="imagine" value="imagine..."
                               onclick="this.value='';" maxlength="20">
                    </label>
                </div>


                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="input-categorie">Categorie:
                        <select name="categorie" id="input-categorie">

                            <%
                                ArrayList categorie = (ArrayList) session.getAttribute("categorie");
                                for (Object itr : categorie) {
                                    out.print("<option value='" + itr + "'");
                                    if (request.getParameter("categorie") == itr) {
                                        out.print("select=selected");
                                    } else {
                                        out.print(">'" + itr + "'</option>");
                                    }

                                }
                            %>
                        </select>
                    </label>
                </div>


                <div class="form-group col-md-5 col-lg-offset-0">
                    <label for="input-animal">Animal:
                        <select name="animal" id="input-animal">
                            <%
                                ArrayList animal = (ArrayList) session.getAttribute("animal");
                                for (Object itr : animal) {
                                    out.print("<option value='" + itr + "'");
                                    if (request.getParameter("categorie") == itr) {
                                        out.print("select=selected");
                                    } else {
                                        out.print(">'" + itr + "'</option>");
                                    }
                                }
                            %>
                        </select>
                    </label>
                </div>


                <div class="form-group col-md-12 col-lg-offset-0">
                    <label for="textarea-descriere">Descriere:
                        <textarea cols="22" rows="3" class="form-control" id="textarea-descriere" name="descriere"
                                  onclick="this.value='';" maxlength="20">
                         Introduceti descrierea produsului...
                    </textarea>
                    </label>
                </div>

                <div class="col-md-12 col-lg-offset-0">
                    <button type="submit" class="btn btn-primary center-block" value="Adauga produs">Adauga produs</button>
                </div>

            </form>
        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
