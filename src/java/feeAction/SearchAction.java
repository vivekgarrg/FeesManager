
package feeAction;

import DBConnect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SearchAction {
    
    public ResultSet remainingFees()
    {
        ResultSet rs= null;
        try{
            
         Connection con = DBConnection.getEducationConnection();
         PreparedStatement ps = con.prepareStatement("select sum(balance_fees) from fees");
         rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
    }
    
    public ResultSet paidFees()
    {
        ResultSet rs = null;
        
        try{
            Connection con = DBConnection.getEducationConnection();
            PreparedStatement ps = con.prepareStatement("select sum(fees_paid) from fees");
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
    }
    
    public ResultSet totalFees()
    {
        ResultSet  rs= null;
        
        try{
            Connection con = DBConnection.getEducationConnection();
      
            PreparedStatement ps = con.prepareStatement("select sum(total_fees) from fees");
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
    }
    
    public ResultSet totalStudentsCount()
    {
        ResultSet rs= null;
        try{
            Connection con = DBConnection.getEducationConnection();
            PreparedStatement ps = con.prepareStatement("select count(std_id) from students");
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
    }
    
    public ResultSet getRecord(String name)
    {
      ResultSet rs = null;
        try{
              
            Connection con = DBConnection.getEducationConnection();
            PreparedStatement ps=con.prepareStatement("select * from students where name like '%"+name+"%' "); 
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
        
    }
    
     public ResultSet getFee(String id)
    {
      ResultSet rs = null;
        try{
              
            Connection con = DBConnection.getEducationConnection();
            PreparedStatement ps=con.prepareStatement(" select * from students NATURAL JOIN fees where students.std_id = '"+id+"' "); 
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
        
    }
     public ResultSet getStudents()
    {
      ResultSet rs = null;
        try{
              
            Connection con = DBConnection.getEducationConnection();
            PreparedStatement ps=con.prepareStatement("select * from students NATURAL JOIN fees"); 
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            
        }
        return rs;
        
    }
    
}
