<%-- 
    Document   : cauta
    Created on : Dec 17, 2014, 3:12:43 AM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <title>Lista comenzilor</title>
    </head>
    <body>

        <div id="header">
            <%@include file="header.jsp" %>
        </div>

        <div id="main-content">

            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
            <h1 id="cont-title">Comenzi:</h1>
            <hr>

            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/petshop"
                                   user="root" password=""  />


            <sql:query dataSource="${snapshot}" var="result">
                SELECT C.nume_cl,C.prenume_cl,C.telefon,COM.data,COM.id_com, (SELECT SUM(P.pret_unitar*DC.cantitate)
                                                                   FROM produs P,detalii_comanda DC
                                                                   WHERE (DC.id_p = P.id_p)AND(DC.id_com = COM.id_com)) AS total_comanda
                FROM client C ,comanda COM
                WHERE (C.id_cl = COM.id_cl)
                ORDER BY COM.data DESC
            </sql:query>

            <br>

            <center>
                <form action="Sterge_comenzi" method="get">

                    <table class="blue">
                        <thead>
                            <tr>
                                <th>Check</th>
                                <th>Detalii</th>
                                <th>Nume</th>
                                <th>Prenume</th>
                                <th>Telefon</th>
                                <th>Data</th>
                                <th>Pret total</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:forEach var="row" items="${result.rows}">
                                
                                <tr>
                                    <td>
                                        <input type="checkbox" name="comanda" value="${row.id_com}">
                                    </td>
                                    <td>
                                        » Comanda »
                                    </td>
                                    <td>
                                        <c:out value="${row.nume_cl}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.prenume_cl}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.telefon}"/>
                                    </td>
                                    <td>
                                        <c:out value="${row.data}"/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber var="pret_tot" value="${row.total_comanda - 0.0000000005}" maxFractionDigits="2"/>
                                        <c:out value="${pret_tot}"/> Lei
                                    </td>

                                </c:forEach>  
                            </tr>
                        </tbody>

                    </table>
                    <br>
                    <input type="submit" value="sterge">
                </form>

            </center>
            <br>
            <center>
                <span style="color:black;font-size: 15px;font-weight: bold;">
                    Click <a href="altele.jsp" style="color:blue">aici</a> pentru a te intoarce.
                </span> 
            </center>
        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
