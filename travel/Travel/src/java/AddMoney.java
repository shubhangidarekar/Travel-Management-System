/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Classes.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author hp
 */
public class AddMoney extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddMoney</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMoney at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            Connection con = Connect.connectDb();
            //out.println(request.getParameter("AccountNo"));
            //out.println(request.getParameter("Money"));

            String money = request.getParameter("Money");
            //out.println(request.getParameter("AccountNo"));
            String oldmoney = "";

            PreparedStatement ps = con.prepareStatement("select money from createaccount where accountno =?");
            ps.setString(1, request.getParameter("AccountNo"));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                oldmoney = rs.getString("money");


                //out.println("money is "+money+" and old money is "+oldmoney);
                int a = Integer.parseInt(money);
                int b = Integer.parseInt(oldmoney);
                int tmoney = a + b;
                String totalmooney = "";
                totalmooney = Integer.toString(tmoney);
                //out.println(totalmooney);
                ps = con.prepareStatement("update createaccount set  money =? where accountno =?");
                ps.setString(1, totalmooney);
                ps.setString(2, request.getParameter("AccountNo"));
                int d = ps.executeUpdate();
                if (d > 0) {
                    {
                        out.println("<script>");
                        out.println("alert('your Account is updated')");
                        out.println("window.location = 'Addmoney.jsp'");
                        out.println("</script>");
                    }

                }
            } else {
                out.println("<script>");
                out.println("alert('Account Not Valid')");
                out.println("window.location = 'Addmoney.jsp'");
                out.println("</script>");
            }
        } catch (Exception e) {
            out.println(e);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
