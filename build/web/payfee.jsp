<%-- 
    Document   : payfee
    Created on : 28 Dec, 2021, 11:39:22 PM
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
    </head>
    <body>
        <input id="search" type="text" placeholder="search">
        <input id="btn" type="submit" value="submit">
        <table>

            <%
                String name = request.getParameter("name");
                SearchAction ac = new SearchAction();
                ResultSet rs = ac.getRecord(name);
                while (rs.next()) {
            %>

            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
                <td><%=rs.getString(6)%></td>
                <td><a href="feedetails.jsp?id=<%=rs.getString(1)%>">Fee Details</a></td>
            </tr>
            <%
                }
            %>

        </table>

        <iframe src="totalStudents.jsp" height="100%" width="100%">
        </iframe>

        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script>
            $("#btn").click(function() {
                var s = $("#search").val();
                window.location.href = "payfee.jsp?name=" + s;
            })

        </script>
    </body>
</html>
