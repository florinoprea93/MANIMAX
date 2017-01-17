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
public class Select_list extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(true);

            ArrayList categorie = new ArrayList();
            ArrayList animal = new ArrayList();

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            JDBC_Connect con = new JDBC_Connect("jdbc:mysql://localhost/petshop", "root", "");

            String query = "SELECT nume_categorie FROM categorie";
            ResultSet result = con.execute_query(con, query);

            while (result.next()) {
                categorie.add(result.getString("nume_categorie"));
            }

            session.setAttribute("categorie", categorie);

            query = "SELECT nume_a FROM animal";
            result = con.execute_query(con, query);

            while (result.next()) {
                animal.add(result.getString("nume_a"));
            }

            session.setAttribute("animal", animal);

            String site = "update_db.jsp";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        } catch (SQLException ex) {
            Logger.getLogger(Select_list.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
