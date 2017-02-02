package mds;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/** �R�l�N�V�����擾�Ȃǂ̃��[�e�B���e�B */
public class Util {

    /** ���ϐ�����A�����p�ɐݒ肳�ꂽ�R�l�N�V�������擾���܂� */
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
