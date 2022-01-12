
package feeServlet;

import feeAction.RegisterationAction;
import feeBean.RegFeeBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "FeeRegister", urlPatterns = {"/FeeRegister"})
public class FeeRegister extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
               
        
        String id = request.getParameter("studentId");
        String tf = request.getParameter("totalFee");
        String pf = request.getParameter("paidFee");
        String bf = request.getParameter("balanceFee");
        String payMode = request.getParameter("payMode");
        
//         PrintWriter out = response.getWriter();
//           out.println(id);
//       out.println(tf);
//        out.println(pf);
//        out.println(bf);
//        out.println(payMode);
        
        int std_id = Integer.parseInt(id);
        int t_fee = Integer.parseInt(tf);
        int p_fee = Integer.parseInt(pf);
        int b_fee = Integer.parseInt(bf);
        
        try{
            RegFeeBean rb = new RegFeeBean();
            rb.setBalanceFee(b_fee);
            rb.setPaidFee(p_fee);
            rb.setRemarks(payMode);
            rb.setTotalFee(t_fee);
            rb.setStudent_id(std_id);
            
            RegisterationAction ra = new RegisterationAction();
            boolean b = ra.insertFee(rb);
            
            if(b==true)
            {
                response.sendRedirect("feedetails.jsp?id="+std_id);
            }
            else
            {
                response.sendRedirect("error.jsp");
            }
        }
        catch(Exception e)
        {
            response.sendRedirect("error.jsp");
        }
    }


}
