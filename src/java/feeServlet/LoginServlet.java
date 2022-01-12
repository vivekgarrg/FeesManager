
package feeServlet;

import feeAction.LoginAction;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email=request.getParameter("email");
        String password=request.getParameter("password");
      
       
        
        try
        {
            LoginAction lg= new LoginAction();
            boolean b=lg.checklogin(email,password);
            if(b==true)
            {
                HttpSession session = request.getSession();
                session.setAttribute("user", email);
                response.sendRedirect("admin.jsp");
            }
            else
            {
                 
                 response.sendRedirect("admin-error.jsp");
                
                
            }
        }
        catch(Exception e)
        {
            
        }
        
       
    }

    
}
