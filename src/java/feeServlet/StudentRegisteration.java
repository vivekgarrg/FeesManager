
package feeServlet;

import feeAction.RegisterationAction;
import feeBean.RegisterBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class StudentRegisteration extends HttpServlet {
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String rn = request.getParameter("roll_no");
         int roll_no = Integer.parseInt(rn);
       String name = request.getParameter("name");
       String fname = request.getParameter("fname");
       String classes = request.getParameter("class");
       String section = request.getParameter("section");
       String tf = request.getParameter("contact");
       long totalfees = Long.parseLong(tf);
      
       
       try{
           RegisterBean data = new RegisterBean();
           data.setName(name);
           data.setFName(fname);
           data.setClass(classes);
           data.setSection(section);
           data.setContact(totalfees);
           data.setRollNo(roll_no);
           
           RegisterationAction ac=new RegisterationAction();
           boolean b = ac.insertData(data);
          if(b==true)
          {
            response.sendRedirect("feedetails.jsp?id="+roll_no);
          }
          else
          {
            response.sendRedirect("notsuccess.jsp");       
          }
       }
       catch(Exception e)
       {
           
       }
       
    
       
       
        
    }

  
   
}
