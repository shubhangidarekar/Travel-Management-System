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
                        { "data": "Contact No" },
                        { "data": "Account No" },
                        { "data": "Money" },
                        { "data": "Add Money" }
                    ]
                });
            } );
        </script>
    </head>
    <body>
        <!--==============================header=================================-->
        <header>
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li ><a href="BankHome.jsp">Home</a></li>
                                <li ><a href="CreateAccount.jsp">CreateAccount</a></li>
                                <li class="current"><a href="ViewAccount.jsp">ViewAccount</a></li> 
                                <li><a href="Addmoney.jsp">Addmoney</a></li>
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
        <div class="content" style="min-height: 300px;height: auto">
            <div class="container_12">


                <div id="form"   >


                    <table id="example" class="display" cellspacing="0"  width="100%"  >
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Name</th>
                                <th>Contact No</th>
                                <th>Account No</th>
                                <th>Money</th>
                                <th>Add Money</th>
                            </tr>

                        </thead>
                        
                        <tbody>
                            <%
                                Connection con = Connect.connectDb();
                                PreparedStatement ps = con.prepareStatement("select * from createaccount ");

                                ResultSet rs = ps.executeQuery();
                                while (rs.next()) {
                            %>
                            <tr>
                                <td><center> <%=rs.getString(1)%></center></td>
                        <td><center> <%=rs.getString(2)%></center></td>
                        <td><center> <%=rs.getString(5)%></center></td>
                        <td><center> <%=rs.getString(8)%></center></td>
                        <td><center> <%=rs.getString(10)%></center></td> 
                        <td><center><a href="Addmoney.jsp?accno=<%=rs.getString(8)%>"> Add Money</a></center></td> 




                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>             
            </div>
        </div>   
    </body>
</html>
