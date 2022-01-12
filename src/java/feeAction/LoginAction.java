
package feeAction;

import DBConnect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginAction {
    public ResultSet forgotPass(String email, int key)
    {
        ResultSet rs = null;
        
        try{
            Connection con = DBConnection.getEducationConnection();
            PreparedStatement ps = con.prepareStatement("select password from admin where email = '"+email+"' and secure_key = '"+key+"' ");
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
    }
    public boolean checklogin(String email,String password)
    {
        boolean b =false;
        try
        {
          Connection con=DBConnection.getEducationConnection();
          PreparedStatement ps=con.prepareStatement("select * from admin where email=? and password=?");
           ps.setString(1, email);
           ps.setString(2, password);
           
        ResultSet rs=ps.executeQuery();
        if(rs.next())
        {
            b=true;
        }
        else
        {
            b=false;
        }
          
        }
        catch(Exception e)
        {
            
        }
        return b;
    }
}
