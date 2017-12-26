
import Classes.Connect;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FileUpload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 15, maxRequestSize = 1024 * 1024 * 10)
public class reg1 extends HttpServlet implements Serializable {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String Name = request.getParameter("Name");
        String Email = request.getParameter("Email");
        String Country = request.getParameter("Country");
        String ContactNo = request.getParameter("ContactNo");
        String Address = request.getParameter("Address");
        String Password = request.getParameter("Password");
/*out.println(Name);
out.println(Email);
out.println(Country);
out.println(ContactNo);
out.println(Address);
out.println(Password);*/
try {
            Connection con = Connect.connectDb();
             Part filePart = request.getPart("filename");
             InputStream is = filePart.getInputStream();
             String filename = getSubmittedFileName(filePart);
            PreparedStatement ps = con.prepareStatement("insert into reg1 values (?,?,?,?,?,?,?,?)");

            ps.setString(1, Name);
            ps.setString(2, Email);
            ps.setString(3, Country);
            ps.setString(4, ContactNo);
            ps.setString(5, Address);
            ps.setString(6, Password);
            ps.setBinaryStream(7, is);
            ps.setString(8, request.getParameter("t"));
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<script>");
                out.println("alert('Registration Successfully')");
                out.println("window.location = 'UrLogin.jsp'");
                out.println("</script>");
            }


        } catch (Exception e2) {
            out.println(e2);
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
