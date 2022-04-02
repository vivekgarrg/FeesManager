<%-- 
    Document   : logout
    Created on : 28 Dec, 2021, 10:03:49 PM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
           
           session.removeAttribute("user");
           response.sendRedirect("index.jsp");
       
       %>
    </body>
</html>
