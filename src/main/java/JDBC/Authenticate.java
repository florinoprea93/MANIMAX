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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 * @author RAFA_4_EVER
 */
public class Authenticate extends HttpServlet {

    Functions f = new Functions();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession(true);//creare sesiune
            //HashSet<String> produse = new HashSet<>();
            HashMap<String, String> produse = new HashMap();
            session.setAttribute("cos", produse);


            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            //Connect to JDBC
            JDBCConnect con = new JDBCConnect("jdbc:mysql://localhost/petshop", "root", "");

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            boolean ok = (f.validate_field(username, "username") && f.validate_field(password, "password"));

            if (ok) {
                String query = "SELECT * FROM client WHERE (username = '" + username + "')AND (password='" + password + "')";
                ResultSet result = con.execute_query(con, query);

                if (result.first()) {
                    int id_role = result.getInt("id_role");
                    query = "SELECT * FROM rol WHERE (id_role = '" + id_role + "')";
                    result = con.execute_query(con, query);

                    //trimit prin sesiuni userul si parola in editate_cont pt a putea localiza userul logat
                    if (result.first()) {
                        session.setAttribute("log", 1);
                        session.setAttribute("rol", id_role);
                        session.setAttribute("username", username);// folosit pt a localiza in EditAccount  userul logat
                        session.setAttribute("password", password);//folosit pt a localiza in EditAccount parola userului logat
                    }

                    f.update(session, con, username, password);

                    String site = "index.jsp";
                    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);

                } else {
                    session.setAttribute("log", 0);

                    String site = "autentificare.jsp";
                    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(Authenticate.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
