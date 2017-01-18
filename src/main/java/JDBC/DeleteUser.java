package JDBC;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by FLORIN-OPREA on 1/17/2017.
 */
public class DeleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);//creare sesiune
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        JDBCConnect con = new JDBCConnect("jdbc:mysql://localhost/petshop", "root", "");

        String idUtilizator = request.getParameter("utilizator");

        try {


                //out.print(inres);
                String query = "DELETE FROM client WHERE id_cl = " + idUtilizator + "";
                int res = con.execute_update(con, query);

                if (res != 0) {

                    String site = "utilizatori.jsp";
                    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
                    response.setHeader("Location", site);
                } else {
                    out.print(query + "---");
                    out.print("Eroare!!! Delete-ul nu a reusit!!");
                }

        } catch (Exception e) {
            String site = "lista-comenzi.jsp";
            response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site);

        }
    }
}
