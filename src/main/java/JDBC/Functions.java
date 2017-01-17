/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 * @author RAFA_4_EVER
 */
public class Functions {

    public boolean validate_field(Object field_value, String x) {

        if (field_value.equals("")) return false;
        if (field_value.equals(x)) return false;

        return true;
    }


    public void update(HttpSession session, JDBC_Connect con, Object username, Object password) {

        try {

            String query = "SELECT * FROM client WHERE (username = '" + username + "')AND (password='" + password + "')";

            ResultSet result = con.execute_query(con, query);
            result.first();//merg pe prima inregistrare
            session.setAttribute("name", result.getString("prenume_cl") + " " + result.getString("nume_cl"));
            session.setAttribute("surname", result.getString("nume_cl"));
            session.setAttribute("forename", result.getString("prenume_cl"));
            session.setAttribute("address", result.getString("adresa"));
            session.setAttribute("phone", result.getString("telefon"));

            query = "SELECT * FROM rol WHERE (id_role = '" + result.getInt("id_role") + "')";
            result = con.execute_query(con, query);
            result.first();
            session.setAttribute("role", result.getString("code"));

        } catch (SQLException ex) {
            Logger.getLogger(Functions.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
