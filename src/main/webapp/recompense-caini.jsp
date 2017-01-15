<%-- 
    Document   : hrana-umeda
    Created on : Dec 14, 2014, 11:45:01 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recompense caini</title>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp"%>
        </div>

        <div id="container">
            <div id="left-container">

            </div>


            <div id="right-container">
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
                <h1 id="cont-title">Recompense caini</h1>
                <hr>

                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                  url="jdbc:mysql://localhost/petshop"
                                   user="root" password=""  />
                <sql:query dataSource="${snapshot}" var="result">
                    SELECT P.nume_p,P.pret_unitar,P.img_url,P.id_p,P.descriere
                        FROM produs P ,animal A ,categorie C
                        WHERE (P.id_a = A.id_a)AND(A.categorie_a = 'caini')
                        AND (P.id_cat = C.id_cat)AND(C.nume_categorie = 'Recompense') ;
                </sql:query>



                <c:forEach var="row" items="${result.rows}">

                    <div class="product">
                        <div class="image">
                            <a href="#">
                                <img src="<c:out value="${row.img_url}" />"  alt="<c:out value="${row.nume_p}"/>" title="<c:out value="${row.descriere}"/>">
                            </a>
                        </div>

                        <div class="name-prod">
                            <a href="#">
                                <center><c:out value="${row.nume_p}" /></center>
                            </a>
                        </div>
                            
                        <div class="price">
                            <center><c:out value="${row.pret_unitar}"/> Lei</center>
                        </div>

                        
                        <form action="add-cart.jsp" name="add-prod-cart" class="form-cart">
                            <center>
                                <input type="hidden" name="aux" />
                                <input type="submit" name="<c:out value="${row.id_p}"/>" value="adauga in cos" class="input-cart"
                                       onclick="this.form.aux.value = this.name;" />
                            </center>                            
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>


        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
