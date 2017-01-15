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
        <title>Altele</title>
    </head>
    <body>

        <div id="header">
            <%@include file="header.jsp" %>
        </div>

        <div id="main-content">

            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
            <h1 id="cont-title">Alte detalii:</h1>
            <hr>

            <%                Object username = session.getAttribute("username");
                Object password = session.getAttribute("password");

                if ((username.equals("florin_93_vl")) && (password.equals("florinoprea"))) {

            %>
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/petshop"
                                   user="root" password="" />


            <sql:query dataSource="${snapshot}" var="maxim">
                SELECT L.nume_cl, L.prenume_cl,L.telefon,L.data,L.max_com
                FROM (SELECT C.nume_cl, C.prenume_cl, C.telefon, COM.data, (SELECT SUM( P.pret_unitar * DC.cantitate )            
                FROM produs P, detalii_comanda DC
                WHERE (DC.id_p = P.id_p)AND (DC.id_com = COM.id_com)) AS max_com
                FROM client C, comanda COM
                WHERE (C.id_cl = COM.id_cl)) AS L,comanda COM
                GROUP BY L.max_com
                HAVING L.max_com = MAX((SELECT SUM( P.pret_unitar * DC.cantitate ) 
                FROM produs P, detalii_comanda DC                            
                WHERE (DC.id_p = P.id_p)AND (DC.id_com = COM.id_com)))
            </sql:query>


            <sql:query dataSource="${snapshot}" var="minim">
                SELECT L.nume_cl, L.prenume_cl,L.telefon,L.data,L.min_com 
                FROM (SELECT C.nume_cl, C.prenume_cl, C.telefon, COM.data, (SELECT SUM( P.pret_unitar * DC.cantitate )            
                FROM produs P, detalii_comanda DC
                WHERE (DC.id_p = P.id_p)AND (DC.id_com = COM.id_com)) AS min_com
                FROM client C, comanda COM
                WHERE (C.id_cl = COM.id_cl)) AS L,comanda COM
                GROUP BY L.data
                HAVING L.min_com = MIN((SELECT SUM( P.pret_unitar * DC.cantitate ) 
                FROM produs P, detalii_comanda DC                            
                WHERE (DC.id_p = P.id_p)AND (DC.id_com = COM.id_com)))


            </sql:query>


            <sql:query dataSource="${snapshot}" var="medie">
                SELECT AVG(total_comanda) AS med_com
                FROM (SELECT (SELECT SUM(P.pret_unitar*DC.cantitate)
                FROM produs P,detalii_comanda DC
                WHERE (DC.id_p = P.id_p)AND(DC.id_com = COM.id_com)) AS total_comanda
                FROM comanda COM
                WHERE (id_cl = COM.id_cl)) AS medie
            </sql:query>


            <sql:query dataSource="${snapshot}" var="fidel">

                SELECT L.nume_cl, L.prenume_cl,L.telefon,L.aparitii
                FROM (SELECT C.nume_cl, C.prenume_cl, C.telefon,C.id_cl, (SELECT COUNT( id_cl ) 
                FROM comanda COM
                WHERE COM.id_cl = C.id_cl) AS aparitii
                FROM client C, comanda COM
                WHERE (C.id_cl = COM.id_cl)) AS L,client C
                GROUP BY L.id_cl
                HAVING L.aparitii = MAX((SELECT COUNT( id_cl )                                                   
                FROM comanda COM
                WHERE COM.id_cl = C.id_cl))
            </sql:query>

            <br>

            <center>
                <table class="blue">
                    <thead>
                        <tr>
                            <th>Detaliu</th>
                            <th>Nume</th>
                            <th>Prenume</th>
                            <th>Telefon</th>
                            <th>Data</th>
                            <th>Valoare</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="row" items="${maxim.rows}">

                            <tr>

                                <td>
                                    » Cea mai mare comanda:
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
                                    <fmt:formatNumber var="max" value="${row.max_com - 0.0000000005}" maxFractionDigits="2"/>
                                    <c:out value="${max}"/> Lei
                                </td>
                            </tr>

                        </c:forEach>

                        <c:forEach var="row" items="${minim.rows}">

                            <tr>
                                <td>
                                    » Cea mai mica comanda:
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
                                    <fmt:formatNumber var="min" value="${row.min_com - 0.0000000005}" maxFractionDigits="2"/>
                                    <c:out value="${min}"/> Lei
                                </td>

                            </tr>    
                        </c:forEach>

                        <c:forEach var="row" items="${medie.rows}">

                            <tr>
                                <td>
                                    » Media comenzilor:
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    -
                                </td>
                                <td>
                                    <fmt:formatNumber var="med_com" value="${row.med_com - 0.0000000005}" maxFractionDigits="2"/>
                                    <c:out value="${med_com}"/> Lei
                                </td>    
                            </tr>
                        </c:forEach>    



                        <c:forEach var="row" items="${fidel.rows}">    
                            <tr>
                                <td>
                                    » Cel mai fidel client:
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
                                    -
                                </td>
                                <td>
                                    <c:out value="${row.aparitii}"/> comenzi
                                </td>
                            </tr>
                        </c:forEach>

                    </tbody>

                </table>
            </center>
            <br>
            <center>
                <span style="color:black;font-size: 15px;font-weight: bold;">
                    Click <a href="lista-comenzi.jsp" style="color:blue">aici</a> pentru a vedea toate comenzile.
                </span> 
            </center>
            <%      
                } else if((!username.equals(""))&&(!password.equals(""))){
            %> 
            
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/petshop"
                               user="root" password="" />


            <sql:query dataSource="${snapshot}" var="result">
                SELECT C.nume_cl,C.prenume_cl,C.telefon,COM.data, (SELECT SUM(P.pret_unitar*DC.cantitate)
                                                                   FROM produs P,detalii_comanda DC
                                                                   WHERE (DC.id_p = P.id_p)AND(DC.id_com = COM.id_com)) AS total_comanda
                FROM client C ,comanda COM
                WHERE (C.id_cl = COM.id_cl)AND(C.username = '<% out.print(username);%>')AND(C.password = '<% out.print(password);%>')
                ORDER BY COM.data DESC
            </sql:query>

            <br>

            <center>
                <table class="blue">
                    <thead>
                        <tr>
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
            </center>
            <br>
                     
            
            <%
                }else {
            %>

            <center>
                <h3>Accesul interzis!!!Pagina accesibila doar pentru administrator si clienti!!!</h3>
                <h3>Va rugam autentificati-va!!!</h3>
            </center>
            <div style="width: 200px;
                        height: 200px;
                        display: block;
                        margin: 50px auto;">
                
                <img src='images/interzis.jpg' alt="interzis" title="Accesul interzis!!!Pagina accesibila doar pentru administrator!"
                     style="width: 200px;height: 200px;">
            </div>
            
            <%
                }
            %>
        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
