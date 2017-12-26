/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Classes.Connect;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sai
 */
public class UserLogin extends HttpServlet {

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
            out.println("<title>Servlet login1 </title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login1 at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Connection con = Connect.connectDb();
            PreparedStatement ps = con.prepareStatement("select email from reg1 where email=?");
            ps.setString(1, request.getParameter("email"));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                HttpSession s = request.getSession();
                PreparedStatement ps1 = con.prepareStatement("select * from reg1 where email=? and password=?");
                ps1.setString(1, email);
                ps1.setString(2, password);
                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    String name = rs1.getString("name");
                    s.setAttribute("name", name);
                    s.setAttribute("emailid", email);
                    s.setAttribute("userid", rs1.getString(1));
                    response.sendRedirect("UserHome.jsp");
                    
                }else{
                     out.println("<script>");
                     out.println("alert('your email or password wrong')");
                     out.println("window.location = 'UrLogin.jsp'");
                     out.println("</script>");
           }

            } else if (email.equals("admin@gmail.com") & password.equals("admin")) {
                response.sendRedirect("AdminHome.jsp");
            }else if (email.equals("bank@gmail.com") & password.equals("bank")) {
                response.sendRedirect("BankHome.jsp");
            }else{
                     out.println("<script>");
                     out.println("alert('your email or password wrong')");
                     out.println("window.location = 'UrLogin.jsp'");
                     out.println("</script>");
            }
        } catch (Exception e) {
            out.print(e);
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
