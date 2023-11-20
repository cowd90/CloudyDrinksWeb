package database;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.Driver;
import java.sql.DriverManager;

public class JDBCUtil {
    public static Connection getConnection() {
        Connection connection = null;

        try {
            // Register MySQL Driver to DriverManager
            Driver driver = new com.mysql.cj.jdbc.Driver();
            DriverManager.registerDriver(driver);

            // Create parameters
            String url = "jdbc:mySQL://localhost:3306/db_cloudy_drinks";
            String username = "root";
            String pwd = "";

            // Create connection
            connection = DriverManager.getConnection(url, username, pwd);

        } catch (Exception e) {
            // TODO: handle exception
        }
        return connection;
    }

    public static void closeConnection(Connection c) {
        try {
            if (c != null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void printInfo(Connection c) {
        try {
            if (c != null) {
                DatabaseMetaData dbmd = c.getMetaData();
                System.out.println(dbmd.getDatabaseProductName());
                System.out.println(dbmd.getDatabaseProductVersion());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        printInfo(JDBCUtil.getConnection());
    }
}
