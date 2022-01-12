
<%@page import="java.sql.ResultSet"%>
<%@page import="feeAction.LoginAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dogi Solutions</title>
        <link rel="shortcut icon" type="image/png" href="img/logo_2.png">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
       <link rel="stylesheet" href="css/style.css">
         </head>
         <style>
             body{
                  background: url("img/bg.jpg");
                  background-size: cover;
                  font-family: sans-serif;
             }
         </style>
        
    <body>
        
        <%
            String str = new String();
            str = (String)session.getAttribute("user");
            if(str!=null)
            {
               response.sendRedirect("admin.jsp");
            }
          
        %>
        
  

           <%
            
             String pass = request.getParameter("pass");
        %>

  <div class="login-wrapper">
      <img id="logo1" src="img/logo_1.png" style="position: fixed; top: -150px; left: -60px;">
      <form action="LoginServlet" method="post" class="form">
      <img src="img/avatar.png" alt="">
      <h2>Login</h2>
      
      <div class="input-group">
        <input type="text" name="email" id="loginUser" required>
        <label for="loginUser">User Name</label>
      </div>
      <div class="input-group">
        <input type="password" name="password" id="loginPassword" required>
        <label for="loginPassword">Password</label>
      </div>
      <% if(pass!=null) { %>
      <span style="text-align: center">Password : <a style=" color: orange"><%=pass%></a></span>
      <%}%>
      <input type="submit" value="Login" class="submit-btn">
      <a href="#forgot-pw" class="forgot-pw">Forgot Password?</a>
       
    </form>

      
    <div id="forgot-pw">
        <form  action="ForgotServlet" method="post" class="form">
        <a href="#" class="close">&times;</a>
        <h2>Reset Password</h2>
        <div class="input-group">
          <input type="email" name="email" id="email" required>
          
          <label for="email">Email</label>
          <input type="number" name="securekey" id="secure-key" placeholder="Secure Key" required>
         
        </div>
        <input id="forget-pw" type="submit" value="Submit" class="submit-btn">
        
   
      </form>
    </div>
  </div>

        
 <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script>
            $("#pay-btn").click(function(){
            window.location.href = "payfee.jsp";
            })
            
//            var email = 
//            $("#forget-pw").click(function(){
//                window.location.href = "index.jsp#forgot-pw";
//            })
             
//            $(document).ready(function(){
//                     $('#login-div').hide();
//                     $('#login-btn').click(function(){
//                       $('#login-div').show();
//                       $('#reg-div').hide()
//                     });
//                     $('#reg-div').show();
//                     $('#pay-btn').click(function(){
//                       $('#reg-div').show();
//                       $('#login-div').hide();
//                     });
//                      });
        </script>
        
    </body>
  
</html>
