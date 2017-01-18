/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JDBC;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author RAFA_4_EVER
 */
public class DeleteOrders extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);//creare sesiune
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCConnect con = new JDBCConnect("jdbc:mysql://localhost/petshop", "root", "");

        String[] results = request.getParameterValues("comanda");

        try {
            for (String result : results) {

                //out.print(inres);
                String query = "DELETE FROM comanda WHERE id_com = " + result + "";
                int res = con.execute_update(con, query);

                if (res != 0) {

                    String site = "lista-comenzi.jsp";
                    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
                    out.print(query + "---");
                    out.print("Eroare!!! Delete-ul nu a reusit!!");
                }
            }

        } catch (Exception e) {
            String site = "lista-comenzi.jsp";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
