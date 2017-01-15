/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RAFA_4_EVER
 */
public class Editare_cont extends HttpServlet {

    Functions f = new Functions();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);//creare sesiun

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //conectare JDBC
        JDBC_Connect con = new JDBC_Connect("jdbc:mysql://localhost/petshop", "root", "");

        //preiau username-ul si parola contului pe care-l modific
        Object username = session.getAttribute("username");
        Object password = session.getAttribute("password");

        //preiau noile campurile modificate
        String surname = request.getParameter("surname");
        String forename = request.getParameter("forename");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        boolean ok = (f.validate_field(surname, "nume...") && f.validate_field(forename, "prenume")
                && f.validate_field(phone, "telefon...") && f.validate_field(address, "Introduceti adresa..."));

        if (ok) {

            //editez campurile
            String query = "UPDATE client SET nume_cl='" + surname + "',prenume_cl='" + forename + "',adresa='"
                    + address.replaceAll("\\s+", "") + "',telefon='" + phone + "' WHERE (username='" + username + "')AND(password='" + password + "')";

            int res = con.execute_update(con, query);

            if (res != 0) {
                f.update(session, con, username, password);

                String site = "index.jsp";
                response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                response.setHeader("Location", site);

            } else {
                out.println("Error!!!");
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
