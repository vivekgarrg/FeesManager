
package DBConnect;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static final String url="jdbc:mysql://localhost:3306/fees_management";
     public static final String user="root";
     public static final String pwd="vivek";
    static Connection con=null;
    static{
          try
          {
            Class.forName("com.mysql.jdbc.Driver");
         }
           catch(Exception e)
           {
               
           }
    }
     public static Connection getEducationConnection()
     {
         
         
         try{
             con=DriverManager.getConnection(url, user, pwd);
             
             
         }
         catch(Exception e)
         {
             
         }
         return con;
    
}
     
    
     }
