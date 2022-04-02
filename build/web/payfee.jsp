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
        <title>Pay Fees</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/payfee.css" type="text/css">
    </head>
    <style>
        body {background-image: url("img/bg-admin.png");
              background-size: cover;
        }
    </style>
    <body>
        <div class="container-fluid">
        <%
            String str = new String();
            str = (String) session.getAttribute("user");
            if (str != null) {
        
        String id = request.getParameter("id");
                    String name = request.getParameter("name");
                    SearchAction ac = new SearchAction();
                    ResultSet r = ac.getFee(id);
                    ResultSet rs = ac.getRecord(name);
                  
        %>
        <%if(id==null){%>
        
        <div class="search-bar">
              <input id="search" type="text" placeholder="Search By Name..">
              <input id="btn" type="submit" value="Search">
        </div>
        
        <%}%>
        <div class="row">
            <div class="col-12 col-sm-12">

                <%
                    
                    if (name != null) {

                %>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Class</th>
                            <th scope="col">Section</th>
                            <th class="d-none d-sm-table-cell" scope="col">Contact Number</th>
                            <th scope="col">Pay <span class="d-none d-sm-inline">Fees</span></th>
                            
                            
                        </tr>
                    </thead>
                    <tbody>
                        <%while(rs.next()){%>
                        <tr>
                            <td><b><%=rs.getString(1)%></b></td>
                            <td style="color: white; text-transform: uppercase"><%=rs.getString(2)%></td>
                            
                            <td><%=rs.getString(4)%></td>
                            <td><%=rs.getString(5)%></td>
                            <td class="d-none d-sm-table-cell"><%=rs.getString(6)%></td>
                            <td><a class="pay-fee-btn" href="payfee.jsp?id=<%=rs.getString(1)%>">Pay <span class="d-none d-sm-inline">Fees</span></a></td>
                            
                          
                            
                            
                            

                            
                        </tr>
                        <%}%>
                    </tbody>
                </table>
            </div>

                <% }



                    if (id != null) {
                        while (r.next()) {
                %>
                <div class="col-12">
                    <div class="pay-fee-form">
                        
                        
                        
                </form>
                
                
                <form action="PayFeeServlet" method="post">
                <div class="pay-in">
                    <placeholder>Id</placeholder><br>
                    <input name="id" value="<%=r.getString(1)%>" readonly><br>
                </div>
                <div class="pay-in">
                    <placeholder>Name</placeholder><br>
                    <input style=" text-transform: uppercase" value="<%=r.getString(2)%>" readonly><br>
                </div>
                 <input type="hidden" value=<%=r.getString(3)%>>
                <div class="pay-in">
                    <placeholder>Class</placeholder><br>
                   <input value="<%=r.getString(4)%> <%=r.getString(5)%> " readonly><br>
                </div>
                 <div class="pay-in">
                    <placeholder>Balance</placeholder><br>
                    <input name="b-amnt"  id="bal-input" value="<%=r.getString(9)%>" readonly><br>
                </div>
                <div>
                    
                </div>
                
              
                      <input name="p-amnt"  type="hidden" value=<%=r.getString(8)%>><br>
                    <input name="t-amnt"  type="hidden" value=<%=r.getString(7)%>><br>
                    <div class="pay-fee-in">
                        <placeholder><b style="color:white">&nbsp;Enter Amount<sup style="color: red">*</sup></b></placeholder><br>
                        <input name="amnt" id="pay-input" onchange="checkPayBtn()" value=<%=r.getString(9)%>><br>
                    </div>
                     
                    <div class="pay-fee-btn">
                        <input id="submit-btn" class="btn btn-primary"  type="submit" value="Pay"><br>
                    </div>
                         </form>
                
                    </div>
                
               </div>


                <form>
                    <%
                                }

                            }
                        } else {
                            response.sendRedirect("index.jsp");
                        }
                    %>


            </div>
        </div>
                   

            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script>
                $("#btn").click(function() {
                    var s = $("#search").val();
                    window.location.href = "payfee.jsp?name=" + s;
                })
                
                function checkPayBtn(){
                   var inp = $('#pay-input').val();
                   var bal = $('#bal-input').val();
                   
                   if(inp>bal || inp<1000){
                       if(inp<1000){
                           alert('Amount should be greater than 1000')
                       }
                           $('#submit-btn').prop('disabled','true')
 
                   }
                   if(inp>1000 && inp<=bal){
                       $('#submit-btn').prop('disabled',false)
                   }
                   
                       
                           
                           
                   
        
                    
                }

            </script>
    </body>
</html>
