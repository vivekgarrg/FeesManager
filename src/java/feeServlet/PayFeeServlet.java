/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package feeServlet;

import feeAction.PayFeeAction;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vivek
 */
@WebServlet(name = "PayFeeServlet", urlPatterns = {"/PayFeeServlet"})
public class PayFeeServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayFeeServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayFeeServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String id=request.getParameter("id");
        String amnt=request.getParameter("amnt");
        String bamnt = request.getParameter("b-amnt");
        String tamnt = request.getParameter("t-amnt");
        String pamnt = request.getParameter("p-amnt");
        
      int bal = Integer.parseInt(bamnt);
      int paid = Integer.parseInt(amnt);
      int total = Integer.parseInt(tamnt);
      int pAmnt = Integer.parseInt(pamnt);
        
         int amntPaid = pAmnt + paid;
         int balRem = total - amntPaid;        
        try{
            PayFeeAction a = new PayFeeAction();
            boolean b = a.checklogin(id, amntPaid, balRem);
            if(b==true){
                response.sendRedirect("admin.jsp");
            }
            else{
                response.sendRedirect("");
            }
            
        }catch(Exception e){
                
            }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
