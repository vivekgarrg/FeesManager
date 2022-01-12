<%-- 
    Document   : feedetails
    Created on : 31 Dec, 2021, 3:42:35 AM
    Author     : vivek
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="feeAction.SearchAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
    </head>
    <style>
        body {background-image: url("img/bg-admin.png");
            background-size: cover;
        }
    </style>
    <body>
        <div class="container-fluid">
            <div class="row">
                
                <div class="col-2"></div>
                <div class="col-8">
        <table style="border: 1px solid gray">
           
       <%
           String id = request.getParameter("id");
            SearchAction ac = new SearchAction();
            ResultSet rs = ac.getFee(id);
            if(rs.next())
            {
            %>
            <tr class="table-dark"><td>Student Id</td> <td>Name</td>  <td>Fathers Name</td> <td>Class</td> <td>Section</td> <td>Contact</td> <td>Total Fees</td> <td>Fees Paid</td> <td>Balance Fees</td>  <td>Remarks</td></tr>
          
             <tr class="table-primary">
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><%=rs.getString(7)%></td>
                <td><%=rs.getString(8)%></td>
                <td><%=rs.getString(9)%></td>
                <td><%=rs.getString(10)%></td>
            </tr>
            
            
          
 <%}
            else
            {%>
            <a href="addfee.jsp?id=<%=id%>">Add details</a>  <br> 
           <%}
 %>
        </table>
         <a href="index.jsp">Back To Home</a>  
                </div>
        <div class="col-2"></div>
            </div>
        </div>
    </body>
</html>
