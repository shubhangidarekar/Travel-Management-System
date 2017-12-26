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
public class CreateAccount extends HttpServlet {

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
            out.println("<title>Servlet CreateAccount</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateAccount at " + request.getContextPath() + "</h1>");
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
        String accno = "326200";
        int maxid = 0;
        int pass = (int) (Math.random() * 10000);
        String pas = pass + "";

        PreparedStatement ps;
        try {

            Connection con = Connect.connectDb();
            ps = con.prepareStatement("select id from createaccount order by id desc");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                maxid = rs.getInt("id");
            }

            accno += maxid;
            //out.println(accno);
            //out.println(pas);
            ps = con.prepareStatement("insert into createaccount values(?,?,?,?,?,?,?,?,?,?)");
             ps.setInt(1, 0);
             ps.setString(2, request.getParameter("Name"));
             ps.setString(3, request.getParameter("Email"));
             ps.setString(4, request.getParameter("Country"));
             ps.setString(5, request.getParameter("ContactNo"));
             ps.setString(6, request.getParameter("Address"));
             ps.setString(7, request.getParameter("t"));
             ps.setString(8,accno);
             ps.setString(9, pas);
             ps.setString(10, request.getParameter("Money"));
             int a = ps.executeUpdate();
             if (a > 0) {
             out.println("<script>");
             out.println("alert('your account is created. your ac no is "+accno+" and password is "+pas+"')");
             out.println("window.location = 'CreateAccount.jsp'");
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
