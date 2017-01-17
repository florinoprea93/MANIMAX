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
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
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
public class Adauga_prod extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);//creare sesiune
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();


        HashMap<String, String> cos = (HashMap<String, String>) session.getAttribute("full-cart");

        int cantitate = Integer.parseInt(request.getParameter("cant-prod"));//cantitatea unui produs

        String select = request.getParameter("aux");//refresh sau remove

        String id = select.replaceAll("\\D+", "");//iau id-ul din name-ul butonului

        if (select.endsWith("refresh-cart")) {

            Set set = cos.entrySet();
            Iterator itr = set.iterator();
            while (itr.hasNext()) {
                Map.Entry me = (Map.Entry) itr.next();
                if ((me.getKey().toString()).equals(id)) {

                    try {
                        JDBC_Connect con = new JDBC_Connect("jdbc:mysql://localhost/petshop", "root", "");
                        String query = "SELECT stoc FROM produs WHERE id_p = '" + id + "'";
                        ResultSet result = con.execute_query(con, query);
                        result.first();
                        int stoc = result.getInt("stoc");
                        if (stoc < cantitate) {
                            String site = "add-cart-help.jsp";
                            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                            response.setHeader("Location", site);
                        } else {
                            me.setValue(cantitate);
                        }

                    } catch (SQLException ex) {
                        Logger.getLogger(Adauga_prod.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } else {
            cos.remove(id);
        }

        session.setAttribute("cos", cos);
        String site = "add-cart-help.jsp";
        response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
        response.setHeader("Location", site);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
