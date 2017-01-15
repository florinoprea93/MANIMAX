<%-- 
    Document   : index
    Created on : Dec 14, 2014, 8:56:23 PM
    Author     : RAFA_4_EVER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ANIMAX-PETSHOP ONLINE</title>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script src="index.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div id="header">
            <%@include file="header.jsp"%>
        </div>

        <div id="content">
            <div id="main-page">

                <div id="main-caini">
                    <h3 id="h-caini">Caini</h3>
                    <ul>
                        <li>
                            <a href="hrana-umeda-caini.jsp" style="color: black">» Hrana umeda</a>
                        </li>

                        <li>
                            <a href="hrana-uscata-caini.jsp" style="color: black">» Hrana uscata</a>
                        </li>

                        <li>
                            <a href="lapte-caini.jsp" style="color: black">» Lapte</a>
                        </li>

                        <li>
                            <a href="recompense-caini.jsp" style="color: black">» Recompense</a>
                        </li>

                        <li>
                            <a href="delicii-caini.jsp" style="color: black">» Delicii</a>
                        </li>
                    </ul>
                </div>

                <div id="main-pisici">

                    <h3 id="h-pisici">Pisici</h3>

                    <ul>
                        <li>
                            <a href="hrana-umeda-pisici.jsp" style="color: black">» Hrana umeda</a>
                        </li>

                        <li>
                            <a href="hrana-uscata-pisici.jsp" style="color: black">» Hrana uscata</a>
                        </li>

                        <li>
                            <a href="lapte-pisici.jsp" style="color: black">» Lapte</a>
                        </li>

                        <li>
                            <a href="recompense-pisici.jsp" style="color: black">» Recompense</a>
                        </li>

                        <li>
                            <a href="delicii-pisici.jsp" style="color: black">» Delicii</a>
                        </li>
                    </ul>
                </div>

                <div id="main-pasari">

                    <h3 id="h-pasari">Pasari</h3>
                    <ul>
                        <li>
                            <a href="meniuri-pasari.jsp" style="color: black">» Meniuri</a>
                        </li>

                        <li>
                            <a href="batoane-pasari.jsp" style="color: black">» Batoane</a>
                        </li>

                        <li>
                            <a href="biscuiti-pasari.jsp" style="color: black">» Biscuiti</a>
                        </li>

                        <li>
                            <a href="fructe-deshidratate-pasari.jsp" style="color: black">» Fructe deshidratate</a>
                        </li>

                        <li>
                            <a href="seminte-pasari.jsp" style="color: black">» Seminte</a>
                        </li>
                    </ul>

                </div>

                <div id="main-rozatoare">

                    <h3 id="h-rozatoare">Rozatoare</h3>
                    <ul>
                        <li>
                            <a href="meniuri-rozatoare.jsp" style="color: black">» Meniuri</a>
                        </li>

                        <li>
                            <a href="batoane-rozatoare.jsp" style="color: black">» Batoane</a>
                        </li>

                        <li>
                            <a href="biscuiti-rozatoare.jsp" style="color: black">» Biscuiti</a>
                        </li>

                        <li>
                            <a href="fructe-legume-deshidratate-rozatoare.jsp" style="color: black">» Fructe si legume deshidratate</a>
                        </li>

                        <li>
                            <a href="fan-rozatoare.jsp" style="color: black">» Fan</a>
                        </li>

                        <li>
                            <a href="delicii-rozatoare.jsp" style="color: black">» Delicii</a>
                        </li>
                    </ul>
                </div>

                <div id="main-acvaristica">

                    <h3 id="h-acvaristica">Acvaristica</h3>
                    <ul>
                        <li>
                            <a href="hrana-pesti-acvariu.jsp" style="color: black">» Hrana pentru pestii de acvariu</a>
                        </li>

                        <li>
                            <a href="hrana-pesti-iaz.jsp" style="color: black">» Hrana pentru pestii de iaz</a>
                        </li>

                    </ul>

                </div>

                <div id="main-reptile">

                    <h3 id="h-reptile">Reptile</h3>

                    <ul>
                        <li>
                            <a href="hrana-geko.jsp" style="color: black">» Hrana pentru Geko</a>
                        </li>

                        <li>
                            <a href="hrana-agame.jsp" style="color: black">» Hrana pentru Agame</a>
                        </li>

                        <li>
                            <a href="hrana-iguane.jsp" style="color: black">» Hrana pentru iguane</a>
                        </li>

                        <li>
                            <a href="hrana-broaste-testoase.jsp" style="color: black">» Hrana pentru broaste testoase</a>
                        </li>

                        <li>
                            <a href="suplimente-vitamino-minerale.jsp" style="color: black">» Suplimente vitamino-minerale</a>
                        </li>
                    </ul>
                </div>

            </div>

            <div id="animax">
                <a href="caini.jsp">
                    <div id="p-caini"></div>
                </a>
                
                <a href="pisici.jsp">
                    <div id="p-pisici"></div>
                </a>
                   
                <a href="pasari.jsp">
                    <div id="p-pasari"></div>
                </a>
             
                
                <a href="rozatoare.jsp">
                    <div id="p-rozatoare"></div>
                </a>
                
                
                <a href="acvaristica.jsp">
                    <div id="p-acvaristica"></div>
                </a>
                
                <a href="reptile.jsp">
                    <div id="p-reptile"></div>
                </a>
                
            </div>
        </div>

        <div id="footer">
            <%@include file="footer.jsp" %>
        </div>
        
    </body>
</html>



