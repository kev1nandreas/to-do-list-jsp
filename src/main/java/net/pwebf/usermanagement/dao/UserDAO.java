package net.pwebf.usermanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.pwebf.usermanagement.model.User;

public class UserDAO {

    public int registerUser(User user) throws ClassNotFoundException {
    	//System.out.println("hi1");
        String INSERT_USER_SQL = "INSERT INTO users" +
            "  (name, email, phone, username, password, notify, notify_before) VALUES " +
            " (?, ?, ?, ?, ?, false, 0);";
        //System.out.println("hi2");

        int result = 0;

        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/demo?useSSL=false", "root", "");

            // Create a statement using the connection object
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPhone());
            preparedStatement.setString(4, user.getUsername());
            preparedStatement.setString(5, user.getPassword());
            //preparedStatement.setBoolean(6, user.isNotify());
            //preparedStatement.setInt(7, user.getNotifyBefore());
            
            System.out.println(preparedStatement);
            // Execute the query or update query
            result = preparedStatement.executeUpdate();
            //System.out.println("hi3");

        } catch (SQLException e) {
            // Process SQL exception
            printSQLException(e);
        }
        return result;
    }
    public boolean validate(User user) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/demo?useSSL=false", "root", "");

             // Step 2: Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(
                 "SELECT * FROM users WHERE username = ? AND password = ?")) {

            // Set the username and password from the User object
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getPassword());

            System.out.println(preparedStatement); // Log the prepared statement

            // Execute the query
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next(); // Returns true if a record matches, false otherwise

        } catch (SQLException e) {
            printSQLException(e); // Log SQL exceptions
        }

        return status;
    }


    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
