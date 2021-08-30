package devpro.crawl.Service;

import java.sql.Connection;
import java.sql.DriverManager;

public class BaseService {
	
    public static String DB_URL = "jdbc:mysql://localhost:3306/shop14?useSSL=false";
    public static String USER_NAME = "root";
    public static String PASSWORD = "Matkhaulagi2809";
    
    public static Connection getConnection(String dbURL, String userName, 
            String password) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, userName, password);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }

}
