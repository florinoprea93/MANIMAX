/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author RAFA_4_EVER
 */
public class EditAccount extends HttpServlet {

    Functions f = new Functions();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String query = "";
        String username = "";
        String password = "";
        HttpSession session = request.getSession(true);//creare sesiune

        //conectare JDBC
        JDBCConnect con = new JDBCConnect("jdbc:mysql://localhost/petshop", "root", "");

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        //preiau noile campurile modificate
        String surname = request.getParameter("surname");
        String forename = request.getParameter("forename");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        boolean ok = (f.validate_field(surname, "nume...") && f.validate_field(forename, "prenume")
                && f.validate_field(phone, "telefon...") && f.validate_field(address, "Introduceti adresa..."));


        if (ok) {
            Boolean isEditClientAccount = (Boolean) session.getAttribute("isEditClientAccount");
            if (isEditClientAccount == null) {
                isEditClientAccount = false;
            }
            String idClientEdit = (String) session.getAttribute("utilizatorEdit");


            if (isEditClientAccount) {
                query = "UPDATE client SET nume_cl='" + surname + "',prenume_cl='" + forename + "',adresa='"
                        + address.replaceAll("\\s+", "") + "',telefon='" + phone + "' WHERE (id_cl='" + idClientEdit + "')";

            } else {
                //preiau username-ul si parola contului pe care-l modific
                username = (String) session.getAttribute("username");
                password = (String) session.getAttribute("password");

                //editez campurile
                query = "UPDATE client SET nume_cl='" + surname + "',prenume_cl='" + forename + "',adresa='"
                        + address.replaceAll("\\s+", "") + "',telefon='" + phone + "' WHERE (username='" + username + "')AND(password='" + password + "')";

            }


            int res = con.execute_update(con, query);

            if (res != 0) {
                if (!isEditClientAccount) {
                    f.update(session, con, username, password);
                }

                session.setAttribute("isEditClientAccount", false);

                String site = "index.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else {
                out.println("Error");
            }

        } else {
            String site = "index.jsp";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);//creare sesiun

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        session.setAttribute("isEditClientAccount", true);

        //conectare JDBC
        JDBCConnect con = new JDBCConnect("jdbc:mysql://localhost/petshop", "root", "");

        String idUtilizator = request.getParameter("utilizatorEdit");
        session.setAttribute("utilizatorEdit", idUtilizator);

        try {
            String query = "SELECT * FROM client WHERE id_cl = " + idUtilizator + "";
            ResultSet result = con.execute_query(con, query);
            if (result.first()) {
                session.setAttribute("usernameEdit", result.getString("username"));
                session.setAttribute("passwordEdit", result.getString("password"));
                session.setAttribute("numeClEdit", result.getString("nume_cl"));
                session.setAttribute("prenumeClEdit", result.getString("prenume_cl"));
                session.setAttribute("adresaEdit", result.getString("adresa"));
                session.setAttribute("telefonEdit", result.getString("telefon"));

                String site = "editare-cont.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            } else {
                String site = "index.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);
            }
        } catch (Exception e) {
            String site = "utilizatori.jsp";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
