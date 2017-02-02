package mds;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** コネクション取得などのユーティリティ */
public class Util {

    /** 環境変数から、試験用に設定されたコネクションを取得します */
    public static Connection getConnection() {
        try {
            
            String url = System.getenv("DB_JDBC_URL");
            String user = System.getenv("DB_USER");
            String pass = System.getenv("DB_PASSWORD");
            
            Connection con = DriverManager.getConnection(url, user, pass);
            return con;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    
    

}
