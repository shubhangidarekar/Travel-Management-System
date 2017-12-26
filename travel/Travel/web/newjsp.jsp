<%-- 
    Document   : newjsp
    Created on : 16 Aug, 2017, 5:47:25 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form  action="reg1" method="post" enctype="multipart/form-data">
                    <div id="form" class="grid_6 prefix_1">
                        <h3>Registration</h3>
                        <label class="name">
                            <input type="text" placeholder="Name:" name="Name" data-constraints="@Required @JustLetters" required="" />
                            <span class="empty-message">*This field is required.</span>
                            <span class="error-message">*This is not a valid name.</span>
                        </label>
                       
                        <label class="file">
                            <input type="file" name="filename" />                                                  
                        </label>
                        <input type="submit" value="Submit" > 
                    </div>
                </form>
    </body>
</html>
