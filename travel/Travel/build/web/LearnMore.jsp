
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Classes.Connect"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Package Deatils</title>
        <meta charset="utf-8">
        <meta name="format-detection" content="telephone=no" />
        <link rel="icon" href="images/favicon.ico">
        <link rel="shortcut icon" href="images/favicon.ico" />
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery.js"></script>
        <script src="js/jquery-migrate-1.2.1.js"></script>
        <script src="js/script.js"></script>
        <script src="js/superfish.js"></script>
        <script src="js/jquery.ui.totop.js"></script>
        <script src="js/jquery.equalheights.js"></script>
        <script src="js/jquery.mobilemenu.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script>
            $(document).ready(function(){
                $().UItoTop({ easingType: 'easeOutQuart' });
            });
           
        </script>
        <!--[if lt IE 8]>
        <div style=' clear: both; text-align:center; position: relative;'>
                <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
                        <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
                </a>
        </div>
        <![endif]-->
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <link rel="stylesheet" media="screen" href="css/ie.css">
        <![endif]-->
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
                               <li><a href="Mytourdetail.jsp">Mytourdetail</a></li>
                                <li class="current"><a href="tourdetails.jsp">Tour Details</a></li>
                                <li><a href="logout.jsp">Log Out</a></li>
                            </ul>
                        </nav>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="grid_12">
                    <h1>
                        <a href="Packagedetails.jsp">
                            <img src="images/logo.png" alt="Your Happy Family">
                        </a>
                    </h1>
                </div>
            </div>
        </header>
        <!--==============================Content=================================-->
        <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
            <div class="container_12">
                <div class="grid_8">
                    <h3>Special offers</h3>
                    <table>
                        <%
                            Connection con = Connect.connectDb();
                            PreparedStatement ps = con.prepareStatement("select * from package where id=? ");
                            ps.setString(1, request.getParameter("id"));
                            ResultSet rs = ps.executeQuery();
                            if (rs.next()) {  
                        %>
                        <div class="block2">
                            


                            <tbody>
                            <img src="ImageRetrive1?id=<%=rs.getString(1)%>" style="height: 300px;width: 350px " alt="" class="img_inner fleft">  
                                <tr>
                                    <td style="width: 100px">Package</td>
                                    <td style="width: 10px">:</td>
                                    <td><%=rs.getString(2)%> to <%=rs.getString(3)%></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">Duration</td>
                                    <td style="width: 10px">:</td>
                                    <td><%=rs.getString(4)%></td>
                                </tr>
                                 <tr>
                                    <td style="width: 100px">Price</td>
                                    <td style="width: 10px">:</td>
                                    <td><%=rs.getString(5)%></td>
                                </tr>
                                 <tr>
                                    <td style="width: 100px">Description</td>
                                    <td style="width: 10px">:</td>
                                    <td><%=rs.getString(6)%> </td>
                                </tr>
                                   
                            </tbody>
                           
                    </table>
                                 <a href="book.jsp?id=<%=rs.getString(1)%>" class="link1">Book</a>
                </div>
                <%}%>


            </div>

        </div>
    </div>
    <!--==============================footer=================================-->
    <footer>
        <div class="container_12">
            <div class="grid_12">
                <div class="socials">
                    <a href="#" class="fa fa-facebook"></a>
                    <a href="#" class="fa fa-twitter"></a>
                    <a href="#" class="fa fa-google-plus"></a>
                </div>
                <div class="copy">
                    Your Trip (c) 2014 | <a href="#">Privacy Policy</a> | Website Template Designed by <a href="http://www.templatemonster.com/" rel="nofollow">TemplateMonster.com</a>
                </div>
            </div>
        </div>
    </footer>
    <script>
        $(function (){
            $('#bookingForm').bookingForm({
                ownerEmail: '#'
            });
        })
    </script>
</body>
</html>