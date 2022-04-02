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
        <title>Fee Details</title>
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

            <div class="row" style=" margin-top: 10%">

                <div class="col-1"></div>
                <div class="col-10">


                    <%
                        String id = request.getParameter("id");
                        SearchAction ac = new SearchAction();
                        ResultSet rs = ac.getFee(id);
                        boolean b = false;
                        if (rs.next()) {
                            b = true;
                    %>
                    <table class="table table-hover" style="border: 1px solid white; box-shadow: 10px 10px 5px gray">
                        <thead style="background-color: brown; color: white">
                            <tr>
                                <td scope="col">Student Id</td> 
                                <td scope="col">Name</td> 
                                <td scope="col">Fathers Name</td>
                                <td scope="col">Class</td> 
                                <td scope="col">Section</td> 
                                <td scope="col">Contact</td> 
                                <td scope="col">Total Fees</td> 
                                <td scope="col">Fees Paid</td>
                                <td scope="col">Balance Fees</td>
                                <td scope="col">Remarks</td>
                                <td scope="col">Payment</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><b><%=rs.getString(1)%></b></td>
                                <td><b><%=rs.getString(2)%></b></td>
                                <td><b><%=rs.getString(3)%></b></td>
                                <td><b><%=rs.getString(4)%></b></td>
                                <td><b><%=rs.getString(5)%></b></td>
                                <td><b><%=rs.getString(6)%></b></td>
                                <td><b><%=rs.getString(7)%></b></td>
                                <td><b><%=rs.getString(8)%></b></td>
                                <td><b><%=rs.getString(9)%></b></td>
                                <td><b><%=rs.getString(10)%></b></td>
                                <%
                                    String str = rs.getString(9);
                                    int bf = Integer.parseInt(str);
                                    if (bf > 0) {
                                %>
                                <td><a href="payfee.jsp?id=<%=rs.getString(1)%>" class="btn btn-sm btn-danger">Pay Fee</a></td>
                                <% }%>
                            </tr>
                        </tbody>

                    </table>

                    <%} else {%>
                    <br> 
                    <%}
                    %>


                </div>
                <div class="col-1"></div>

            </div>

            <div class="row">
                <div class="col-4"></div>
                <div class="col-4 mr-2 text-center p-1">
                    <% if (!b) {%>
                    <h4>No Fee Details Found!</h4>
                    <a class="btn btn-md btn-success" href="addfee.jsp?id=<%=id%>">Add Fee</a>
                    <%}%>
                    <button class="btn btn-md btn-success item-center" onclick="window.location.href = 'admin.jsp'">Home</button>  
                    <button class="btn btn-md btn-danger item-center" onclick="history.back()">Back</button>  
                    <button class="btn btn-md btn-primary item-center" onclick="window.print()">Print</button>  
                </div>
                <div class="col-4"></div>
            </div>
        </div>
    </body>
</html>
