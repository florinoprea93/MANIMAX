<%-- 
    Document   : header
    Created on : Dec 14, 2014, 8:55:12 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header</title>
        <link rel="stylesheet" type="text/css" href="index.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script src="index.js"></script>
    </head>
    <body>
        <div id="pheader">
            <div id="logo">
                <a href="index.jsp">
                    &nbsp;&nbsp;&nbsp;<img src="images/logo.png" alt="logo">
                </a>
            </div>

            <div id="livrare">
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Livrare gratuita in:</span><br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bucuresti la comenzi de peste 49 lei<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In tara la comenzi de peste 199 lei.
            </div>

            <div id="numar-contact">
                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ne puteti contacta de Luni-Vineri<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;intre orele 9:00-18:00<br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/telefon.png" alt="telefon">&nbsp;<span>0722938820</span><br>
            </div>

            <div id="autentificare">
                <%
                    Object mesaj1 = "Salut,iti poti crea un";
                    Object mesaj2 = "cont nou";
                    Object mesaj3 = "sau te poti";
                    Object mesaj4 = "autentifica";

                    if (session.getAttribute("log") == (Object) 1) {
                        mesaj1 = "Bine ai venit,";
                        mesaj2 = session.getAttribute("name");
                        mesaj3 = " ";
                        mesaj4 = "( Delogare )";
                    }
                %>

                <%
                    if (mesaj4.equals("( Delogare )")) {
                        Object username = session.getAttribute("username");
                        Object role = session.getAttribute("role");
                        Object admin = "ADMIN";
                        if (role.equals(admin)) {

                %>

                <br>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Admin:&nbsp;</span><span><a href="contulmeu.jsp"><% out.println(username); %></a></span><br>
                <img src="images/admin1.jpg" alt="user"><p>&nbsp;&nbsp;Click  <u><span><a href="Select_list">aici</a></span></u><br></p>
                ,<p>&nbsp;&nbsp;pentru a updata baza de date.<br><u><span><a href="delogare.jsp"><%out.println(mesaj4);%></a></span></u></p><br><br><br></p><br><br><br>
                <%
                } else {

                %>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Moneda:</span> Lei <br>
                <img src="images/user.png" alt="user"><p>&nbsp;&nbsp;<%out.println(mesaj1);%> <u><span><a href="contulmeu.jsp"><%out.println(mesaj2);%></a></span></u><br></p>
                ,<p>&nbsp;&nbsp;<%out.println(mesaj3);%> <u><span><a href="delogare.jsp"><%out.println(mesaj4);%></a></span></u>.</p><br><br><br>

            <a href="add-cart-help.jsp"><img src="images/cart.png" alt="cart"></a><p>&nbsp;&nbsp;<span>Cos de cumparaturi</span></p><br>
            <p>&nbsp;&nbsp; 
                
            <% if(session.getAttribute("ct") == null) {
                out.print('0');
            } else {
                out.print(session.getAttribute("ct"));
            }
                
            %> produs(e) - <% out.print(session.getAttribute("pt"));%> Lei.</p>
                <%
                    }
                } else {

                %>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Moneda:</span> Lei <br>
                <img src="images/user.png" alt="user"><p>&nbsp;&nbsp;<%out.println(mesaj1);%> <u><span><a href="signin.jsp"><%out.println(mesaj2);%></a></span></u><br></p>
                ,<p>&nbsp;&nbsp;<%out.println(mesaj3);%> <u><span><a href="autentificare.jsp"><%out.println(mesaj4);%></a></span></u>.</p><br><br><br>

                <img src="images/cart.png" alt="cart"><p>&nbsp;&nbsp;<span>Cos de cumparaturi</span></p><br>
                <p>&nbsp;&nbsp; 0 produs(e) - 0,00 Lei.</p>
                <%
                    }
                %>




            </div>
        </div>
        <div id="pmenu">
            <ul id="menu">
                <li id="acasa">
                    <a href="index.jsp">HOME</a>
                    
                </li>
                <li id="caini">
                    <a href="caini.jsp">CAINI</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="hrana-umeda-caini.jsp">Hrana umeda</a>
                        </li>

                        <li>
                            <a href="hrana-uscata-caini.jsp">Hrana uscata</a>
                        </li>

                        <li>
                            <a href="lapte-caini.jsp">Lapte</a>
                        </li>

                        <li>
                            <a href="recompense-caini.jsp">Recompense</a>
                        </li>

                        <li>
                            <a href="delicii-caini.jsp">Delicii</a>
                        </li>
                    </ul>
                </li>
                <li id="pisici">
                    <a href="pisici.jsp">PISICI</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="hrana-umeda-pisici.jsp">Hrana umeda</a>
                        </li>

                        <li>
                            <a href="hrana-uscata-pisici.jsp">Hrana uscata</a>
                        </li>

                        <li>
                            <a href="lapte-pisici.jsp">Lapte</a>
                        </li>

                        <li>
                            <a href="recompense-pisici.jsp">Recompense</a>
                        </li>

                        <li>
                            <a href="delicii-pisici.jsp">Delicii</a>
                        </li>
                    </ul>
                </li>
                <li id="pasari">
                    <a href="pasari.jsp">PASARI</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="meniuri-pasari.jsp">Meniuri</a>
                        </li>

                        <li>
                            <a href="batoane-pasari.jsp">Batoane</a>
                        </li>

                        <li>
                            <a href="biscuiti-pasari.jsp">Biscuiti</a>
                        </li>

                        <li>
                            <a href="fructe-deshidratate-pasari.jsp">Fructe deshidratate</a>
                        </li>

                        <li>
                            <a href="seminte-pasari.jsp">Seminte</a>
                        </li>
                    </ul>

                </li>
                <li id="rozatoare">
                    <a href="rozatoare.jsp">ROZATOARE</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="meniuri-rozatoare.jsp">Meniuri</a>
                        </li>

                        <li>
                            <a href="batoane-rozatoare.jsp">Batoane</a>
                        </li>

                        <li>
                            <a href="biscuiti-rozatoare.jsp">Biscuiti</a>
                        </li>

                        <li>
                            <a href="fructe-legume-deshidratate-rozatoare.jsp">Fructe si legume deshidratate</a>
                        </li>

                        <li>
                            <a href="fan-rozatoare.jsp">Fan</a>
                        </li>

                        <li>
                            <a href="delicii-rozatoare.jsp">Delicii</a>
                        </li>
                    </ul>
                </li>
                <li id="acvaristica">
                    <a href="acvaristica.jsp">ACVARISTICA</a>
                    <ul class="sub-menu">
                        <li>
                            <a href="hrana-pesti-acvariu.jsp">Hrana pentru pestii de acvariu</a>
                        </li>

                        <li>
                            <a href="hrana-pesti-iaz.jsp">Hrana pentru pestii de iaz</a>
                        </li>

                    </ul>

                </li>
                <li id="reptile">
                    <a href="reptile.jsp">REPTILE</a>

                    <ul class="sub-menu">
                        <li>
                            <a href="hrana-geko.jsp">Hrana pentru Geko</a>
                        </li>

                        <li>
                            <a href="hrana-agame.jsp">Hrana pentru Agame</a>
                        </li>

                        <li>
                            <a href="hrana-iguane.jsp">Hrana pentru iguane</a>
                        </li>

                        <li>
                            <a href="hrana-broaste-testoase.jsp">Hrana pentru broaste testoase</a>
                        </li>

                        <li>
                            <a href="suplimente-vitamino-minerale.jsp">Suplimente vitamino-minerale</a>
                        </li>
                    </ul>

                </li>
                <li id="contact">
                    <a href="contact.jsp">CONTACT</a>
                </li>

                <li id="cauta">
                    <!--<a href="search.jsp"></a>-->
                    <div id="button-search">
                        <a href="altele.jsp">ALTELE</a>
                    </div>

                </li>
            </ul>
        </div>

        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </body>
</html>
