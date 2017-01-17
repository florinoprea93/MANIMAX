<%-- 
    Document   : add-cart
    Created on : Dec 29, 2014, 8:04:53 PM
    Author     : RAFA_4_EVER
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.HashSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adauga in cos</title>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp"%>
        </div>

        <%            
            HashMap<String, String> produse = (HashMap<String, String>) session.getAttribute("cos");
            Object username = session.getAttribute("username");
            Object role = session.getAttribute("role");
            Object admin = "ADMIN";

            if (session.getAttribute("log") != (Object) 1) {

                String site = "autentificare.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else if (role.equals(admin)) {

                String site = "delogare.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }

        %>


        <div id="add-cart">
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
            <h1 id="cont-title">Cos de cumparaturi</h1>



            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/petshop"
                                   user="root" password="" />


            <%  
            try {
                String key = request.getParameter("aux");
                produse.put(key, "1");
            }catch(NullPointerException ne) {
                ne.printStackTrace();
                
            }finally {
                session.setAttribute("cant_total", produse.size());
            }
                
                
            %>

            <sql:query dataSource="${snapshot}" var="result">
                SELECT * FROM produs WHERE id_p IN 
                <% out.print("(");
                    Set set = produse.entrySet();//pun HashMap-ul intr-o lista
                    Iterator itr = set.iterator();//pun set.ul intr-un iterator ca sa pot sa-l parcurg

                    while (itr.hasNext()) {
                        Map.Entry me = (Map.Entry) itr.next();
                        out.print(me.getKey() + ",");
                    }

                    out.print(0 + ")");%>;
            </sql:query>

            <%
                session.setAttribute("full-cart", produse);
            %>

            <center>
                <table class="blue">
                    <thead>
                        <tr>

                            <th>Imagine</th>
                            <th>Numele produsului</th>
                            <th>Cantitate</th>
                            <th>Pret unitar</th>
                            <th>Pret total</th>
                        </tr>

                    </thead>


                    <c:forEach var="row" items="${result.rows}">  
                        <% out.print("*"); %>

                        <c:set var="pret_t" value="${row.pret_unitar}"/>
                        <c:set var="idp" value="${row.id_p}"/>
                        <c:set var="total" value="${total+pret_t}"/>

                        <tbody>
                            <tr> 
                                <td>
                                    <div class="image" style="width: 40px; height: 40px">
                                        <center>
                                            <img src="<c:out value="${row.img_url}"/>" 
                                                 alt="<c:out value="${row.nume_p}"/>" 
                                                 title="<c:out value="${row.nume_p}"/>"
                                                 style="width: 30px;height: 30px;margin: 5px auto">
                                        </center>
                                    </div>

                                </td>

                                <td>

                                    <p style="color: black; font-size:12px;font-weight: bold;font-family: 'Arial';text-indent: 20px;">
                                        <c:out value="${row.nume_p}"/>
                                    </p>

                                </td>
                                <td>
                                    <form action="Adauga_prod" class="form-cart" method="post">

                                        <input type="text" name="cant-prod"
                                               value="<%

                                                   Set set1 = produse.entrySet();
                                                   Iterator itr1 = set1.iterator();
                                                   while (itr1.hasNext()) {
                                                       Map.Entry me = (Map.Entry) itr1.next();
                                                       if (me.getKey().equals(pageContext.getAttribute("idp").toString())) {
                                                           out.print(me.getValue());
                                                       }
                                                   }


                                               %>" 
                                               style="width: 20px;height: 20px;margin: 20px;">
                                        <input type="hidden" name="aux">


                                        <input type="image" src="images/update.png" name="<c:out value="${row.id_p}"/>-refresh-cart" style="width: 20px;height: 20px;" 
                                               onclick="this.form.aux.value = this.name;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="image" src="images/remove.png" name="<c:out value="${row.id_p}"/>-remove-cart" style="width: 20px;height: 20px;"
                                               onclick="this.form.aux.value = this.name;">

                                    </form>

                                </td>
                                <td>
                                    <p style="color: black; font-size:12px;font-weight: bold;font-family: 'Arial';text-indent: 20px;">                            
                                        <c:out value="${row.pret_unitar}"/> Lei
                                    </p>
                                </td>
                                <td>
                                    <p style="color: black; font-size:12px;font-weight: bold;font-family: 'Arial';text-indent: 20px;">
                                        <%                                        
                                            Set set2 = produse.entrySet();//pun HashMap-ul intr-o lista
                                            Iterator itr2 = set2.iterator();
                                            while (itr2.hasNext()) {
                                                Map.Entry me = (Map.Entry) itr2.next();
                                                if (me.getKey().equals(pageContext.getAttribute("idp").toString())) {
                                                    out.print(pageContext.getAttribute("pret_t"));
                                                }
                                            }

                                        %> Lei
                                    </p>
                                </td>

                            </tr>
                        </c:forEach>    

                    </tbody>
                </table>
                <br>

                <a href="index.jsp">
                    <input type="submit" value="continua" class="input-cart">
                </a>

                <a href="Finalizeaza_comanda">
                    <input type="submit" value="comanda" class="input-cart">
                </a>


                <fmt:formatNumber var="total" value="${total - 0.0000000005}" maxFractionDigits="2"/>
                <span style="color:black;font-weight: bold;font-size: 16px;float: right;margin-right: 25px">Pret comanda:
                    <input type="text" value="<c:out value="${total}"/>" size="7" id="input-pass" disabled
                           style="color: red;font-weight: bold;"> Lei
                </span>
                <%                    
                    session.setAttribute("pt", pageContext.getAttribute("total"));
                    session.setAttribute("ct", session.getAttribute("cant_total"));
                %>

            </center>

        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
