<%-- 
    Document   : admin1
    Created on : 7 Jan, 2022, 1:35:07 AM
    Author     : vivek
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="feeAction.SearchAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Return Laser</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/admin.css" type="text/css">
        <link rel="stylesheet" href="css/admin1.css" type="text/css">
    </head>

    <style>
        body{
            background-image: url("img/bg-admin.png");
            background-size: cover;
        }
    </style>
    <body>



        <%
            String str = new String();
            str = (String) session.getAttribute("user");
        %>



        <div class="container-fluid">

            <!--        navbar-->
            <div class="row">
                <div class="col-12 bg-dark left-a">
                    <img id="logo" src="img/logo_2.png" alt="logo">
                    <a href="#" id="b1" onclick="DashBoard()">Dashboard</a>
                    <a href="#" id="b2" onclick="stdDetails()">Student Details</a>
                    <a href="#" id="b3">Pay Fees</a>
                    <a href="#" id="b4" onclick="Reg()">Registeration</a>

                    <input id="search" type="text" placeholder="Search">
                    <input id="search-btn" onclick="search()" type="submit" value="Search">
                    <a href="logout.jsp" id="logout" style=" left: 18%"><i class="fas fa-sign-out-alt"></i> Logout</a>


                </div>
            </div>




            <!--            content of page-->
            <div class="row content-pg">

                <div class="col-4"></div>
                <div class="col-4" id="std-reg">



                    <!--Form for Registeration -->
                    <form id="reg-form" action="StudentRegisteration" method="post">
                        <div  class="form-group">
                            <input class="form-control" name="roll_no" placeholder="Roll No">
                        </div>
                        <div  class="form-group">
                            <input class="form-control" name="name" placeholder="Name">
                        </div>
                        <div  class="form-group">
                            <input class="form-control" name="fname" placeholder="Father's Name">
                        </div>

                        <div  class="form-group">
                            <select class="form-control" name="class">
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <select class="form-control" name="section">
                                <option value="NEET">NEET</option>
                                <option value="JEE">JEE</option>
                                <option value="FOUNDATION">FOUNDATION</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input id="contact" class="form-control" type="number" name="contact" placeholder="Contact Number" required>
                        </div>




                        <!--                        <div class="form-group">
                                                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                                                </div>-->
                        <a style=" color: red;" id="data"></a>
                        <div class="form-group">
                            <input id="submit-btn" class="form-control bg-primary" type="submit" value="Submit">
                        </div>

                    </form>


                </div>
                <div class="col-4"></div>
            </div>




            <!--          Total Students-->
            <div class="row" id="std-data">

                <table class="table table-hover">
                    <thead>
                        <tr style=" color: brown">
                            <th scope="col">Student Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Father's Name</th>
                            <th scope="col">Class</th>
                            <th scope="col">Section</th>
                            <th scope="col">Contact</th>
                            <th scope="col">Total Fees</th>
                            <th scope="col">Fees Paid</th>
                            <th scope="col">Outstanding</th>
                            <th scope="col">Payment Mode</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%

                            String user = new String();
                            user = (String) session.getAttribute("user");
                            if (str == null) {
                                response.sendRedirect("index.jsp");
                            }

                            SearchAction ac = new SearchAction();
                            ResultSet rs = ac.getStudents();

                            while (rs.next()) {
                        %>

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


                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </div>









            <!--                    Cards-->
            <div class="row total-std-card"> 
                <div class="col-3">
                    <%
                        ResultSet totalStudents = ac.totalStudentsCount();
                        while (totalStudents.next()) {
                    %>
                    <a style="text-decoration: none" href="admin.jsp?name=">
                    <div class="card std-card">
                        <div class="card-header bg-dark cards-title">TOTAL STUDENTS</div>
                        <div class="card-body">

                            <h5 class="card-title total-std-text cards-data" style="color: black"><%=totalStudents.getString(1)%></h5>
                        </div>
                        <% }%>
                    </div>
                    </a>

                </div>
                <div class=" col-3">
                    <%

                        ResultSet totalFees = ac.totalFees();
                        while (totalFees.next()) {
                    %>
                    <div class="card std-card">
                        <div class="card-header bg-dark cards-title">TOTAL FEES</div>
                        <div class="card-body">

                            <h5 class="card-title total-std-text cards-data tot-fees">₹ <%=totalFees.getString(1)%></h5>
                        </div>
                        <% }%>
                    </div>

                </div>

                <div class="col-3">
                    <%

                        ResultSet paidFees = ac.paidFees();
                        while (paidFees.next()) {
                    %>
                    <div class="card std-card">
                        <div class="card-header bg-dark cards-title">FEES PAID</div>
                        <div class="card-body">

                            <h5 class="card-title cards-data fee-paid">₹ <%=paidFees.getString(1)%></h5>
                        </div>
                        <% }%>
                    </div>
                </div>
                <div class="col-3">
                    <%

                        ResultSet remainingFees = ac.remainingFees();
                        while (remainingFees.next()) {
                    %>
                    <div class="card std-card">
                        <div class="card-header bg-dark cards-title"  color: red">OUTSTANDING</div>
                        <div class="card-body">

                            <h5 class="card-title cards-data fee-rem">₹ <%=remainingFees.getString(1)%></h5>
                        </div>
                        <% }%>
                    </div>

                </div>

            </div>





            <!--                    Search data-->

            <% String name = request.getParameter("name");
                if (name != null) {
            %>
            <div class="row" id="searchData">
                <table class="table table-hover search-table">
                    <thead>
                        <tr style=" color: brown">
                            <th scope="col">Student Id</th>
                            <th scope="col">Name</th>
                            <th scope="col">Father's Name</th>
                            <th scope="col">Class</th>
                            <th scope="col">Section</th>
                            <th scope="col">Contact</th>
                            <th scope="col">Fee Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rd = ac.getRecord(name);

                            while (rd.next()) {
                        %>

                        <tr>
                            <td><b><%=rd.getString(1)%></b></td>
                            <td><b><%=rd.getString(2)%></b></td>
                            <td><b><%=rd.getString(3)%></b></td>
                            <td><b><%=rd.getString(4)%></b></td>
                            <td><b><%=rd.getString(5)%></b></td>
                            <td><b><%=rd.getString(6)%></b></td>
                            <td><a style="text-decoration: none; color: wheat"  href="feedetails.jsp?id=<%=rd.getString(1)%>">Fee Details</td>


                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </div>
            <% }%>


        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>

                        $("#reg-form").hide();
                        $("#std-data").hide();
                        $(".total-std-card").show();
                        $("#b1").css("background-color", "red");
                        $("#contact").change(function()
                        {
                            var s = $("#contact").val()
                            if (s.length > 10 || s.length < 10)
                            {

                                $("#submit-btn").prop("disabled", true);
                                document.getElementById("data").innerHTML = "Enter the correct mobile number";
                            }
                            else if (s.length == 10)
                            {
                                $("#submit-btn").prop("disabled", false);
                                document.getElementById("data").innerHTML = "";
                            }
                        })

                        function Reg()
                        {
                            $("#reg-form").show();
                            $("#std-data").hide();
                            $("#b4").css("background-color", "red");
                            $("#b1").removeAttr("style");
                            $("#b2").removeAttr("style");
                            $("#b3").removeAttr("style");
                            $(".search-table").hide();
                            $(".total-std-card").hide();

                        }
                        function stdDetails()
                        {
                            $("#reg-form").hide();
                            $("#b1").removeAttr("style");
                            $("#b3").removeAttr("style");
                            $("#b4").removeAttr("style");
                            $("#std-data").show();
                            $("#b2").css("background-color", "red");
                            $(".search-table").hide();
                            $(".total-std-card").hide();


                        }

                        function search() {


                            var s = $("#search").val();
                            window.location.href = "admin.jsp?name=" + s;

                        }

                        function DashBoard() {

                            $("#b2").removeAttr("style");
                            $("#b3").removeAttr("style");
                            $("#b4").removeAttr("style");
                            window.location.href = "admin.jsp";
                        }

        </script>
    </body>
</html>
