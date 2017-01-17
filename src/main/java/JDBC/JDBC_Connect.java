/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author RAFA_4_EVER
 */
public class JDBC_Connect {
    static final String jdbc_driver = "com.mysql.jdbc.Driver";//dirver
    private String db_url;//adresa bazei de date
    private String db_user;//userul
    private String db_password;//parola

    public JDBC_Connect(String url, String user, String pass) {
        try {
            Class.forName(jdbc_driver);
            this.db_url = url;
            this.db_user = user;
            this.db_password = pass;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(JDBC_Connect.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public Connection connect() {

        try {
            return DriverManager.getConnection(db_url, db_user, db_password);
        } catch (SQLException ex) {
            Logger.getLogger(JDBC_Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }


    public int execute_update(JDBC_Connect con, String query) {

        try {

            Statement stmt = con.connect().createStatement();
            int rs = stmt.executeUpdate(query);
            return rs;

        } catch (SQLException ex) {
            Logger.getLogger(JDBC_Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ResultSet execute_query(JDBC_Connect con, String query) {

        try {
            Statement stmt = con.connect().createStatement();
            ResultSet rs = stmt.executeQuery(query);
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(JDBC_Connect.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
    
    
  
