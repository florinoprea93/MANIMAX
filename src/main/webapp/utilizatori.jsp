<%--
  Created by IntelliJ IDEA.
  User: FLORIN-OPREA
  Date: 1/17/2017
  Time: 8:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%--
<%@page contentType="text/html;charset=UTF-8"%>
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="index.css">
    <script src="index.js"></script>
    <title>Utilizatori</title>
</head>
<body>
<div id="header">
    <%@include file="header.jsp" %>
</div>

<div id="main-content">
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="index.jsp" style="color: black;"><<&nbsp;&nbsp;<u>Prima pagina</u></a>
    <h1 id="cont-title">Utilizatori:</h1>
    <hr>


    <%
        Object username = "";
        Object password = "";
        Object role = "";
        if (session.getAttribute("username") != null) {
            username = session.getAttribute("username");
        }

        if (session.getAttribute("password") != null) {
            password = session.getAttribute("password");
        }

        if (session.getAttribute("role") != null) {
            role = session.getAttribute("role");
        }

        Object admin = "ADMIN";

        if (role.equals(admin)) {

    %>

    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/petshop"
                       user="root" password=""/>

    <sql:query dataSource="${snapshot}" var="utilizatori">
        SELECT C.id_cl, C.username, C.password, C.nume_cl, C.prenume_cl, C.adresa, C.telefon, R.code, R.label
        FROM client C , rol R
        WHERE c.id_role = r.id_role
    </sql:query>

    <table class="table table-striped blue">
        <thead>
        <tr>
            <th>#</th>
            <%--<th>Utilizator</th>--%>
            <%--<th>Parola</th>--%>
            <th>Nume</th>
            <th>Prenume</th>
            <%--<th>Adresa</th>--%>
            <th>Telefon</th>
            <%--<th>Code</th>--%>
            <th>Label</th>
            <th>Options</th>
        </tr>
        </thead>

        <tbody>

        <%
            int i = 0;
        %>
        <c:forEach var="row" items="${utilizatori.rows}">
        <%
            i++;
        %>

        <tr>
            <td>
                <label>
                    <%=i%>
                </label>
            </td>
                <%--<td>
                    <c:out value="${row.username}"/>
                </td>--%>
                <%--<td>
                    <c:out value="${row.password}"/>
                </td>--%>
            <td>
                <c:out value="${row.nume_cl}"/>
            </td>
            <td>
                <c:out value="${row.prenume_cl}"/>
            </td>
                <%--<td>
                    <c:out value="${row.adresa}"/>
                </td>--%>
            <td>
                <c:out value="${row.telefon}"/>
            </td>
                <%--<td>
                    <c:out value="${row.code}"/>
                </td>--%>
            <td>
                <c:out value="${row.label}"/>
            </td>
            <td>
                <form action="DeleteUser" method="get" style="float: left; padding: 1px">
                    <div class="col-md-12 col-lg-offset-0">
                        <input type="hidden" name="utilizator"/>
                        <input type="submit" class="btn btn-danger  center-block"
                               name="<c:out value="${row.id_cl}"/>" value="Sterge"
                               onclick="this.form.utilizator.value = this.name;"/>
                    </div>
                </form>

                <form action="EditAccount" method="get" style="float: left; padding: 1px">
                    <div class="col-md-12 col-lg-offset-0">
                        <input type="hidden" name="utilizatorEdit"/>
                        <input type="submit" class="btn btn-primary  center-block"
                               name="<c:out value="${row.id_cl}"/>" value="Edit"
                               onclick="this.form.utilizatorEdit.value = this.name;"/>
                    </div>
                </form>

                    <form action="UserDetails" method="get" style="float: left; padding: 1px">
                        <div class="col-md-12 col-lg-offset-0">
                            <input type="hidden" name="utilizatorView" />
                            <input type="submit" class="btn btn-info  center-block"
                                   name="<c:out value="${row.id_cl}"/>" value="view"
                                   onclick="this.form.utilizatorView.value = this.name;"/>
                        </div>
                    </form>


            </td>

            </c:forEach>
        </tr>
        </tbody>

    </table>

    <%
    } else {
    %>

    <center>
        <h3>Accesul interzis!!!Pagina accesibila doar pentru administrator si clienti!!!</h3>
        <h3>Va rugam autentificati-va!!!</h3>
    </center>
    <div style="width: 200px;
                        height: 200px;
                        display: block;
                        margin: 50px auto;">

        <img src='images/interzis.jpg' alt="interzis"
             title="Accesul interzis!!!Pagina accesibila doar pentru administrator!"
             style="width: 200px;height: 200px;">
    </div>

    <%
        }
    %>
</div>


</div>

<div id="footer">
    <%@include file="footer.jsp" %>
</div>

</body>
</html>
