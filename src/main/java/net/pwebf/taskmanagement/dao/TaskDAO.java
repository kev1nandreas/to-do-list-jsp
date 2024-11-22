package net.pwebf.taskmanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import net.pwebf.taskmanagement.model.Task;

public class TaskDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/demo?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_TASK_SQL = "INSERT INTO task" + "  (name, duedate, description, status) VALUES " +
        " (?, ?, ?, false);";
    private static final String SELECT_TASK_BY_ID = "select id,name,duedate,description,status from task where id =?";
    private static final String SELECT_ALL_TASK = "select * from task";
    private static final String DELETE_TASK_SQL = "delete from task where id = ?;";
    private static final String UPDATE_TASK_SQL = "update task set name = ?,duedate= ?, description =? where id = ?;";
    private static final String UPDATE_STATUS_SQL = "update task set status = ? where id = ?;";
    private static final String SELECT_FIND_TASK = "select * from task where name like ?";

    public TaskDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertTask(Task task) throws SQLException {
        System.out.println(INSERT_TASK_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TASK_SQL)) {
            preparedStatement.setString(1, task.getName());
            preparedStatement.setTimestamp(2, task.getDuedate());
            preparedStatement.setString(3, task.getDescription());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Task selectTask(int id) {
        Task task = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TASK_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String name = rs.getString("name");
                Timestamp duedate = rs.getTimestamp("duedate");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                task = new Task(id, name, duedate, description, status);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return task;
    }

    public List < Task > selectAlltask() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Task > tasks = new ArrayList <  > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TASK);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Timestamp duedate = rs.getTimestamp("duedate");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                tasks.add(new Task(id, name, duedate, description, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tasks;
    }
    
    public List < Task > findTask(String name) {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List < Task > tasks = new ArrayList <  > ();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FIND_TASK);) {
        	preparedStatement.setString(1, "%" + name + "%");
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("id");
                String names = rs.getString("name");
                Timestamp duedate = rs.getTimestamp("duedate");
                String description = rs.getString("description");
                boolean status = rs.getBoolean("status");
                tasks.add(new Task(id, names, duedate, description, status));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return tasks;
    }

    public boolean deleteTask(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_TASK_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateTask(Task task) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_TASK_SQL)) {
            statement.setString(1, task.getName());
            statement.setTimestamp(2, task.getDuedate());
            statement.setString(3, task.getDescription());
            statement.setInt(4, task.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
    public boolean updateTaskStatus(int id, boolean status) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_STATUS_SQL)) {
            statement.setBoolean(1, status);
            statement.setInt(2, id);
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
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