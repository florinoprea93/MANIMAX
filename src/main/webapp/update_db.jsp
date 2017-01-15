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

            <form method="get" id="update-form" action="Update_db">

                <label id="sign-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Produs<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="input-produs" name="produs" value="produs..." onclick="this.value = '';">
                </label>

                <label id="update-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pret<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="input-pret" name="pret" value="pret..." onclick="this.value = '';">
                </label>

                <label id="update-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Stoc<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="input-stoc" name="stoc" value="stoc..." onclick="this.value = '';">
                </label>

                <label id="update-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Unitate<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="input-unitate" name="unitate" value="unitate..." onclick="this.value = '';">
                </label>

                <label id="update-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Imagine<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" id="input-imagine" name="imagine" value="imagine..." onclick="this.value = '';">
                </label>


                <label id="update-label">
                    Categorie<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;
                    <select name="categorie">

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


                <label id="update-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Animal<span style="color:red">*</span>:&nbsp;&nbsp;&nbsp;&nbsp;
                    <select name="animal">

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


                <label id="update-label">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descriere<span style="color:red">*</span>:
                    <textarea cols="22" rows="3" name="descriere" id="textarea-descriere" onclick="this.value = '';">
                Introduceti descrierea produsului...
                    </textarea>
                </label>

                <input type="submit" id="input-sub" value="Adauga produs">

                &nbsp;&nbsp;&nbsp;<span style="color:red"><em>*campuri obligatorii!</em></span>

            </form>
        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>

    </body>
</html>
