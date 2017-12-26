/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Classes.Connect;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author hp
 */
@WebServlet("/FileUpload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 15, maxRequestSize = 1024 * 1024 * 10)
public class AddPakage extends HttpServlet implements Serializable {

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
            out.println("<title>Servlet AddPakage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPakage at " + request.getContextPath() + "</h1>");
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
            Part imgPart = request.getPart("imgname");
            InputStream is = imgPart.getInputStream();

            PreparedStatement ps = con.prepareStatement("insert into package values(?,?,?,?,?,?,?,?)");
            ps.setInt(1, 0);
            ps.setString(2, request.getParameter("spoint"));
            ps.setString(3, request.getParameter("epoint"));
            ps.setString(4, request.getParameter("Duration"));
            ps.setString(5, request.getParameter("Price"));
            ps.setString(6, request.getParameter("Description"));
            ps.setBinaryStream(7, is);
            ps.setString(8, request.getParameter("t"));
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<script>");
                out.println("alert('Registration Successfully')");
                out.println("window.location = 'AddPackage.jsp'");
                out.println("</script>");
            }


        } catch (Exception e) {
            out.println(e);
        }

        out.close();
    }

    private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }

        return null;
    }
}
