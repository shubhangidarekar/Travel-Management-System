<%-- 
    Document   : logout
    Created on : Jun 4, 2016, 1:38:00 PM
    Author     : sai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
   
    <body  >
        <%
        session.invalidate();
        response.sendRedirect("index.jsp");
        %>
    </body>
</html>
