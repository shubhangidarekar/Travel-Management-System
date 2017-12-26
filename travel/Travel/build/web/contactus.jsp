<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Contacts</title>
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
        <!--==============================header=================================-->
        <header>
            <div class="container_12">
                <div class="grid_12">
                    <div class="menu_block">
                        <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                            <ul class="sf-menu">
                                <li ><a href="index.jsp">Home</a></li>
                                <li><a href="about.jsp">About us</a></li>
                                <li class="current"><a href="contactus.jsp">Contact us</a></li>
                                <li><a href="Reg.jsp">Register</a></li>
                                <li><a href="UrLogin.jsp">Log in</a></li>
                            </ul>
                        </nav>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="grid_12">
                    <h1>
                        <a href="index.jsp">

                        </a>
                    </h1>
                </div>
            </div>
        </header>
        <!--==============================Content=================================-->
        <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
            <div class="container_12">

                <div class="grid_6 prefix_1">
                    <h3>GET IN TOUCH</h3>
                    <form id="form">
                        <div class="success_wrapper">
                            <div class="success-message">Contact form submitted</div>
                        </div>
                        <label class="name">
                            <input type="text" placeholder="Name:" data-constraints="@Required @JustLetters" />
                            <span class="empty-message">*This field is required.</span>
                            <span class="error-message">*This is not a valid name.</span>
                        </label>
                        <label class="email">
                            <input type="text" placeholder="Email:" data-constraints="@Required @Email" />
                            <span class="empty-message">*This field is required.</span>
                            <span class="error-message">*This is not a valid email.</span>
                        </label>
                        <label class="country">
                            <input type="text" placeholder="Country:" data-constraints="@Required @JustLetters"/>
                            <span class="empty-message">*This field is required.</span>
                            <span class="error-message">*This is not a valid phone.</span>
                        </label>
                        <label class="message">
                            <textarea placeholder="Message:" data-constraints='@Required @Length(min=20,max=999999)'></textarea>
                            <span class="empty-message">*This field is required.</span>
                            <span class="error-message">*The message is too short.</span>
                        </label>
                        <div>
                            <div class="clear"></div>
                            <div class="btns">
                                <a href="#" data-type="reset" class="btn">Clear</a>
                                <a href="#" data-type="submit" class="btn">Submit</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            $(function (){
                $('#bookingForm').bookingForm({
                    ownerEmail: '#'
                });
            })
        </script>
    </body>
</html>