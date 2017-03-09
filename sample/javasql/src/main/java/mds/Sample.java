package mds;

import java.sql.Connection;
import java.sql.ResultSet;


/** SQL発行サンプルです。 */
public class Sample {
    
    public void doSql() {
        
        try(Connection con = Util.getConnection()) {
            
            ResultSet rs = con.prepareStatement("select * from example where name like 'A%'").executeQuery();
            
            
            System.out.println("ID\tname");
            while(rs.next()) {
                
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                
                System.out.println(id + "\t" + name);
            }
            
            
            
        } catch (Exception e) {
            // TODO: handle exception
        }
        
        
    }
}
