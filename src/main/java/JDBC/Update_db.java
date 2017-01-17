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
import java.util.ArrayList;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author RAFA_4_EVER
 */
public class Update_db extends HttpServlet {

    Functions f = new Functions();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String produs = request.getParameter("produs");
        Float pret = Float.parseFloat(request.getParameter("pret"));
        Integer stoc = Integer.parseInt(request.getParameter("stoc"));
        String unitate = request.getParameter("unitate");
        String imagine = request.getParameter("imagine");
        String descriere = request.getParameter("descriere");

        String categorie = request.getParameter("categorie");
        String animal = request.getParameter("animal");

        boolean ok = (f.validate_field(produs, "produs...") && f.validate_field(pret, "pret...")
                && f.validate_field(stoc, "stoc...") && f.validate_field(unitate, "unitate...")
                && f.validate_field(imagine, "imagine...")
                && f.validate_field(descriere, "Introduceti descrierea produsului..."));

        if (ok) {

            try {
                JDBC_Connect con = new JDBC_Connect("jdbc:mysql://localhost/petshop", "root", "");

                String query = "SELECT id_a FROM animal WHERE nume_a='" + animal + "'";
                ResultSet result = con.execute_query(con, query);
                result.first();
                int ida = result.getInt("id_a");

                query = "SELECT id_cat FROM categorie WHERE nume_categorie='" + categorie + "'";
                result = con.execute_query(con, query);
                result.first();
                int idcat = result.getInt("id_cat");

                query = "INSERT INTO produs (id_cat,id_a,nume_p,pret_unitar,stoc,u_m,img_url,descriere) VALUES(" + idcat + "," + ida + ",'" + produs + "'," + pret + "," + stoc + ",'" + unitate + "','" + imagine + "','" + descriere + "')";
                int res = con.execute_update(con, query);

                if (res != 0) {
                    String site = "update_db.jsp";
                    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
                    out.println("Error!!! Inserarea nu a reusit!!");
                }

            } catch (SQLException ex) {
                Logger.getLogger(Update_db.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
