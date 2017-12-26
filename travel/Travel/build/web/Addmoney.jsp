<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register</title>
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
        <form ></form>
        <!--==============================header=================================-->
        <header>
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li ><a href="BankHome.jsp">Home</a></li>
                                <li ><a href="CreateAccount.jsp">CreateAccount</a></li>
                                <li><a href="ViewAccount.jsp">ViewAccount</a></li> 
                                <li class="current"><a href="Addmoney.jsp">Addmoney</a></li>
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
        <div class="content">
            <div class="container_12">
                <div class="grid_5">
                </div>
                <form  action="AddMoney" method="post">
                    <div id="form" class="grid_6 prefix_1">
                        <h3>Add Money </h3>


                        <label class="AccountNo">
                            <b>Account No</b>
                            <%
                                if (request.getParameter("acno") == null) {

                            %>

                            <input type="text" name="AccountNo"  required=""/>

                            <%} else {
                            %>
                            <input type="text"  value="<%=request.getParameter("acno")%>" name="AccountNo"  required=""/>\
                            
                            <%}%>
                        </label>
                        <label class="Address">
                            Money
                            <input type="text"  name="Money" data-constraints="@Required @JustLetters" required=""/>

                            <br><br><br><br>
                        </label>

                        <input type="submit" value="Submit" > 
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>