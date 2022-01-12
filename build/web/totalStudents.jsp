<%-- 
    Document   : totalStudents
    Created on : 31 Dec, 2021, 3:59:10 AM
    Author     : vivek
--%>

<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="feeAction.SearchAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table>
        <%
            
            String str = new String();
            str = (String)session.getAttribute("user");
            if(str==null)
            {
               response.sendRedirect("index.jsp");
            }

        SearchAction ac = new SearchAction();
        ResultSet rs = ac.getStudents();
        
        while(rs.next())
        {
            %>
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><%=rs.getString(2)%></td>
        <td><%=rs.getString(3)%></td>
        <td><%=rs.getString(4)%></td>
        <td><%=rs.getString(5)%></td>
        <td><%=rs.getString(6)%></td>
    </tr>
            <%
        }
        
        %>
        </table>
    </body>
</html>
