package JDBC;

import java.lang.*;
import java.io.*;
import javax.servlet.Servlet.*;
import javax.servlet.http.*;
import JDBC.JDBC_Connect;
import static java.lang.System.out;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;

/**
 *
 * @author RAFA_4_EVER
 */
public class Signin extends HttpServlet {

    Functions f = new Functions();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //Connect to JDBC
        JDBC_Connect con = new JDBC_Connect("jdbc:mysql://localhost/petshop", "root", "");

        String surname = request.getParameter("surname");
        String forename = request.getParameter("forename");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        boolean ok = (f.validate_field(surname, "nume...") && f.validate_field(forename, "prenume...")
                && f.validate_field(username, "username...") && f.validate_field(password, "password")
                && f.validate_field(phone, "telefon...") && f.validate_field(address, "Introduceti adresa..."));

        if (ok) {

            try {
                String query = "SELECT * FROM client WHERE (username = '" + username + "')AND (password='" + password + "')";
                ResultSet result = con.execute_query(con, query);
                
                if (!result.first()) {
                    
                    query = "INSERT INTO client (id_role, nume_cl, prenume_cl, adresa, telefon, username, password)"
                            + " VALUES ('"+ 2 +"','" + surname + "','" + forename + "','" + address + "','" + phone + "','" + username + "','" + password + "')";
                    int res = con.execute_update(con, query);
                    
                    if (res != 0) {
                        String site = "autentificare.jsp";
                        response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                        response.setHeader("Location", site);
                        
                    } else {
                        out.println("Error!!!");
                    }
                    
                }else {
                    out.print("This username already exist!!!");
                }
            } catch (SQLException ex) {
                Logger.getLogger(Signin.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
