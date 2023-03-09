package com.mycompany.idrsproject;

/**
 *
 * @author Yel
 */
import java.sql.*;

public class DBConnection {
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Define database connection details
        String port = "3307";
        String jdbcUrl = "jdbc:mysql://localhost:"+port+"/student";
        String dbUser = "student";
        String dbPassword = "uploadfile286";
        
        // Load the MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Create a new database connection
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        
        return connection;
    }
}
