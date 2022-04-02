/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package feeServlet;

import feeAction.LoginAction;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vivek
 */
@WebServlet(name = "ForgotServlet", urlPatterns = {"/ForgotServlet"})
public class ForgotServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotServlet at " + request.getContextPath() + "</h1>");
            out.println("<h1>fucking guy</h1>");
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
        
//           PrintWriter out = response.getWriter();
//      out.println(email);
//      out.println(s_key);
//        
        String email = request.getParameter("email");
        String s_key = request.getParameter("securekey");
        int key = Integer.parseInt(s_key);
        
        LoginAction la = new LoginAction();
        ResultSet data = null;
        data = la.forgotPass(email, key);
       
        try{
        if(data.next())
        {
         String str = data.getString(1);
         String web = "index.jsp?pass="+str;
         response.sendRedirect(web);
        
         }
        else
        {
            String web = "index.jsp?pass="+"Secire key do not match";
            response.sendRedirect(web);
        }
        }
        catch(Exception e)
        {
            response.sendRedirect("index.jsp");
        }
        
        
 
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
