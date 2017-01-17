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
public class Finalizeaza_comanda extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);//creare sesiune
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBC_Connect con = new JDBC_Connect("jdbc:mysql://localhost/petshop", "root", "");

        //preiau username-ul si parola contului care a facut comanda
        Object username = session.getAttribute("username");
        Object password = session.getAttribute("password");

        Object cant_tot = session.getAttribute("ct");//verific daca nu cumva comanda nu e goala :)
        //out.print(cant_tot);
        if (cant_tot == null) {
            String site = "add-cart-help.jsp";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);
        } else {

            try {
                String query = "SELECT id_cl FROM client WHERE (password='" + password + "')AND(username='" + username + "');";
                ResultSet result = con.execute_query(con, query);

                result.first();
                int idcl = result.getInt("id_cl");

                query = "INSERT INTO comanda (id_cl,data) VALUES('" + idcl + "',NOW());";
                int res = con.execute_update(con, query);

                if (res != 0) {
                    boolean ok = false;

                    query = "SELECT id_com FROM comanda ORDER BY id_com DESC LIMIT 1;";
                    result = con.execute_query(con, query);

                    result.first();
                    int idcom = result.getInt("id_com");

                    HashMap<String, String> produse = (HashMap<String, String>) session.getAttribute("cos");

                    Set set = produse.entrySet();//pun HashMap-ul intr-o lista
                    Iterator itr = set.iterator();//pun set.ul intr-un iterator ca sa pot sa-l parcurg

                    while (itr.hasNext()) {
                        Map.Entry me = (Map.Entry) itr.next();
                        // out.print("id_com:"+idcom+",id_p:"+me.getKey()+",cantitate:"+me.getValue());
                        // out.print("||||||");

                        query = "INSERT INTO detalii_comanda (id_com,id_p,cantitate) VALUES (" + idcom + "," + me.getKey() + "," + me.getValue() + ")";
                        res = con.execute_update(con, query);
                        if (res != 0) {
                            query = "UPDATE produs SET stoc = stoc - " + me.getValue() + " WHERE id_p = " + me.getKey() + ";";
                            int resu = con.execute_update(con, query);
                            if (resu != 0) ok = true;
                        } else {
                            out.print("Detalii_comanda eroare");
                            out.print("Click <a href='add-cart-help.jsp'>here</a> to return.");
                        }
                    }
                    if (ok) {
                        String site = "comanda-finalizata.jsp";
                        response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site);
                    } else {
                        out.print(query);
                        out.print("Update-ul nu a reusit!!!");
                        out.print("Click <a href='add-cart-help.jsp'>here</a> to return.");
                    }

                } else {
                    out.print("Comanda nu a fost inregistrata!!!");
                    out.print("Click <a href='add-cart-help.jsp'>here</a> to return.");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Finalizeaza_comanda.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
