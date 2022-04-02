
package feeAction;

import DBConnect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PayFeeAction {
    
    
    public boolean checklogin(String id,int paid, int bal)
    {
        boolean b =false;
        try
        {
          Connection con=DBConnection.getEducationConnection();
          PreparedStatement ps=con.prepareStatement( "update fees set fees_paid =?, balance_fees =? where std_id =?");
           ps.setInt(1, paid);
           ps.setInt(2, bal);
           ps.setString(3, id);
           
       int i =ps.executeUpdate();
           if(i>0)
            {
                 b=true;
              }
        }
        catch(Exception e)
        {
            
        }
        return b;
    }
}
