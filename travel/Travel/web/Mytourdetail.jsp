<%-- 
    Document   : ViewPackage
    Created on : Sep 7, 2016, 12:11:46 AM
    Author     : hp
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.Connect"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>User Login</title>
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no" />
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="css/form.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.2.1.js"></script>
        <script src="js/script.js"></script>
        <script src="js/TMForm.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/jquery.ui.totop.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        
        
        <link rel="stylesheet" href="css/jquery.dataTables.min.css">
        <script src="js/jquery-1.12.3.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
        
         <script>
            $(document).ready(function() {
                $('#example').DataTable({
                    "columns": [
                        { "data": "No" },
                        { "data": "Name" },
                        { "data": "Book Point" },
                        { "data": "Price" },
                        { "data": "Account " },
                        
                        { "data": "DateAnndTime" },
                        { "data": "Duration" },
                        { "data": "Description" }
                        
                    ]
                });
            } );
        </script>
    </head>
    <body>
         <%
            String username = "";
            String id = "";
            String email = "";

            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            if (session.getAttribute("name") == null) {
                response.sendRedirect("UrLogin.jsp");
            } else {
                username = session.getAttribute("name").toString();
                id = session.getAttribute("userid").toString();
                email = session.getAttribute("emailid").toString();
            }

        %>
        <!--==============================header=================================-->
        <header>
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">

                                <li><a href="UserHome.jsp">Home</a></li>
                                <li class="current"><a href="Mytourdetail.jsp">Mytourdetail</a></li>
                                <li><a href="tourdetails.jsp">Tour Details</a></li>
                                <li><a href="logout.jsp">Logout</a></li>

                            </ul>
                        </nav>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="grid_12">
                    <h1>
                        <a href="index.jsp">
                            <img src="images/logo.png" alt="Your Happy Family">
                        </a>
                    </h1>
                </div>
            </div>
        </header>
        <!--==============================Content=================================-->
        <div class="content" style="min-height: 300px;height: auto"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
            <div class="container_12">
                

                <div id="form" >


                    <table id="example" class="display" cellspacing="0"  width="100%" >
                        <thead> 
                           <th>Id </th> 
                        <th>Name </th>
                        <th>Book Point </th>                      
                        <th>Price </th>
                        <th>Account </th>
                        <th>DateAnndTime </th> 
                        <th>Duration  </th> 
                        <th>Description </th> 
                        </thead>
                        <tbody>
                            <%
                                Connection con = Connect.connectDb();
                                String sql = "select book.id,book.name,book.bookpoint,book.price,book.account,"
                                        + "book.dateandtime,book.packageid,package.duration,"
                                        + "package.Description from book INNER JOIN package "
                                        + "ON book.packageid=package.id where book.email=?";
                                PreparedStatement ps = con.prepareStatement(sql);
                                ps.setString(1, email);
                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {

                            %>



                                       
                                <td> <%=rs.getString("book.id")%></td>
                                <td><%=rs.getString("book.name")%></td>
                        <td> <%=rs.getString("book.bookpoint")%></td>                     
                        <td><%=rs.getString("book.price")%></td> 
                        <td> <%=rs.getString("book.account")%></td> 
                        <td><%=rs.getDate("book.dateandtime")%> / <%=rs.getTime("book.dateandtime")%></td>  

                        <td><%=rs.getString("package.duration")%></td>
                        <td><%=rs.getString("package.Description")%></td>


                        </tr>



                        <%
                            }%>

                        </tbody>
                    </table>
                </div>             
            </div>
        </div>   
    </body>
</html>
