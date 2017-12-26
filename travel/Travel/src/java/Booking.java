/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import Classes.Connect;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
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
public class Booking extends HttpServlet {

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
            out.println("<title>Servlet Booking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Booking at " + request.getContextPath() + "</h1>");
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
            PreparedStatement ps;
            String money = "";
            String id = request.getParameter("id");
            String tourprice = request.getParameter("price");
            ps = con.prepareStatement("select money from createaccount where accountno =? and password=? ");
            ps.setString(1, request.getParameter("account"));
            ps.setString(2, request.getParameter("password"));
            ResultSet rs1 = ps.executeQuery();
            if (rs1.next()) {

                money = rs1.getString("money");
                int tourprice1 = Integer.parseInt(tourprice);
                int money1 = Integer.parseInt(money);
                if (money1 > tourprice1) {
                    int remainmoney = money1 - tourprice1;
                    String totalmooney = "";
                    totalmooney = Integer.toString(remainmoney);
                    ps = con.prepareStatement("update createaccount set  money =? where accountno =?");
                    ps.setString(1, totalmooney);
                    ps.setString(2, request.getParameter("account"));
                    ps.executeUpdate();
                    ps = con.prepareStatement("insert into book values(?,?,?,?,?,?,?,?,?,?)");
                    ps.setInt(1, 0);
                    ps.setString(2, request.getParameter("fullname"));
                    ps.setString(3, request.getParameter("bookpoint"));
                    ps.setString(4, request.getParameter("email"));
                    ps.setString(5, request.getParameter("price"));
                    ps.setString(6, request.getParameter("account"));
                    ps.setString(7, request.getParameter("password"));
                    ps.setString(8, request.getParameter("t"));
                    ps.setString(9, request.getParameter("id"));
                    ps.setString(10, "Book");
                    int a = ps.executeUpdate();
                    if (a > 0) {
                        String Mobile = "";
                        ps = con.prepareStatement("select ContactNo from reg1 where email=?");
                        ps.setString(1, request.getParameter("email"));
                        ResultSet rs = ps.executeQuery();
                        if (rs.next()) {
                            Mobile = rs.getString("ContactNo");
                        }
                        String strUrl = "http://api.msg91.com/api/postsms.php";

                        String xmlData = "data="
                                + "<MESSAGE>"
                                + "<AUTHKEY>107842ARN7FJIpd2S56efec59</AUTHKEY>"
                                + "<ROUTE>default</ROUTE>"
                                + "<SMS TEXT='Your Booking is Coonfirm from " + request.getParameter("bookpoint") + ". Package cost is " + request.getParameter("price") + "' FROM='AAAAAA'>"
                                + "<ADDRESS TO='" + Mobile + "'></ADDRESS>"
                                + "</SMS>"
                                + "</MESSAGE>";

                        // String output = hitUrl(strUrl, xmlData);


                        out.println("<script>");
                        out.println("alert('payment has done, your booking is confirmd')");
                        out.println("window.location = 'tourdetails.jsp'");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script>");
                    out.println("alert('You have not sufficient balance for this tour')");
                    out.println("window.location = 'book.jsp?id=" + id + "'");
                    out.println("</script>");
                }
            } else {
                out.println("<script>");
                out.println("alert('Please Check your Account no and Password')");
                out.println("window.location = 'book.jsp?id=" + id + "'");
                out.println("</script>");
            }

            /*  */

        } catch (Exception e) {
            out.println(e);
        }
    }

    public static String hitUrl(String urlToHit, String param) {
        try {
            URL url = new URL(urlToHit);
            HttpURLConnection http = (HttpURLConnection) url.openConnection();
            http.setDoOutput(true);
            http.setDoInput(true);
            http.setRequestMethod("POST");

            DataOutputStream wr = new DataOutputStream(http.getOutputStream());
            wr.writeBytes(param);
            wr.flush();
            wr.close();
            http.disconnect();


            BufferedReader in = new BufferedReader(new InputStreamReader(http.getInputStream()));
            String inputLine;
            if ((inputLine = in.readLine()) != null) {
                in.close();
                return inputLine;
            } else {
                in.close();
                return "-1";
            }

        } catch (Exception e) {
            System.out.println("Exception Caught..!!!");
            e.printStackTrace();
            return "-2";
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
