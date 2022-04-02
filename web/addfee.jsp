<%-- 
    Document   : addfee
    Created on : 12 Jan, 2022, 4:06:00 PM
    Author     : vivek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Fee Details</title>
    </head>
    <style>
        body {background-image: url("img/bg-admin.png");
            background-size: cover;
        }
    </style>
    <body>
        <div class="container-fluid">
            <div class="row">
                
                
            <div class="col-4"></div>
            <div class="col-4 text-center" style="margin-top: 100px; border: 2px solid brown; padding: 20px; box-shadow: 10px 10px 5px gray ">
           
       <%
           String id = request.getParameter("id");
           if(id!=null)
           {
               %>
             <form action="FeeRegister" method="post">
                 <div class="text-left mb-2">
                     <button onclick="back()" class=" btn btn-secondary btn-md" style=" border-radius: 20px"><i class="fas fa-arrow-left"></i></button>
                 </div>
           <div class="form-group">
               <input class="form-control" name="studentId" type="text" value="<%=id%>" readonly>
           </div>
              
           <div class="form-group">
               <input id="tot-fee" onchange="tFee()" name="totalFee" class="form-control" type="number" required placeholder="Total Fees">
           </div>
              
           <div class="form-group">
               <input id="paid-fee" onchange="feePaid()" name="paidFee" class="form-control" type="number" required  placeholder="Fees Paid">
           </div>
           <div class="form-group">
               <input  id="balance" class="form-control" name="balanceFee" type="number"  placeholder="Balance Fees"  readonly>
           </div>
           <div class="form-group">
               <input class="form-control" type="text" name="payMode" placeholder="Pay Mode" required>
           </div>
           <div class="form-group">
              
               <input class="form-control-md btn btn-primary btn-block" type="submit" value="Submit">
           </div>
              </form>
               <%
           }
       %>
            
            </div>
       
      
       <div class="col-4"></div>
            </div>
       
           
        </div>
       
    </body>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script>
      
         var tf;
         var fp;
         function tFee()
         {
         tf =  document.getElementById('tot-fee').value;
         
         }
         function feePaid()
         {
             fp = document.getElementById('paid-fee').value;
             
              balance = parseInt(tf) - parseInt(fp); 
             document.getElementById('balance').value = balance;
         }
         function back()
         {
           history.back();
         }
            
        </script>
</html>
