
package feeAction;

import DBConnect.DBConnection;
import feeBean.RegFeeBean;
import feeBean.RegisterBean;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class RegisterationAction {
    
    public boolean insertFee(RegFeeBean data)
    {
      boolean b = false;
        try{
            Connection con= DBConnection.getEducationConnection();
            String query = "insert into fees(std_id,total_fees,fees_paid,balance_fees,remarks) values (?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, data.getStudent_id());
            ps.setInt(2, data.getTotalFee());
            ps.setInt(3, data.getPaidFee());
            ps.setInt(4, data.getBalanceFee());
            ps.setString(5, data.getRemarks());
            
            int a = ps.executeUpdate();
            if(a>0)
            {
                b = true;
            }
        }
        catch(Exception e)
        {
        
    
        }
        return b;
    }
    
    public boolean insertData(RegisterBean data)
    {
        boolean b = false;
        try{
            Connection con= DBConnection.getEducationConnection();
            String query="insert into students(name,fname,class,section,contact,std_id) values(?,?,?,?,?,?)";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, data.getName());
            ps.setString(2, data.getFname());
            ps.setString(3, data.getClasses());
            ps.setString(4, data.getSection());
            ps.setLong(5, data.getContact());
            ps.setInt(6, data.getRollNo());
            
            int a=ps.executeUpdate();
            if(a>0)
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
