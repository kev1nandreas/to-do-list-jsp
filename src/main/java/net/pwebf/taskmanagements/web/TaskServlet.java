package net.pwebf.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.pwebf.usermanagement.dao.TaskDAO;
import net.pwebf.usermanagement.model.Task;

@WebServlet("/")
public class TaskServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TaskDAO taskDAO;

    @Override
    public void init() {
        taskDAO = new TaskDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertTask(request, response);
                    break;
                case "/delete":
                    deleteTask(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateTask(request, response);
                    break;
                case "/status":
                    updateTaskStatus(request, response);
                    break;
                case "/find":
                	listSpesificTask(request, response);
                    break;
                
                default:
                    listTask(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listTask(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
        List<Task> listTask = taskDAO.selectAlltask();
        request.setAttribute("listTask", listTask);
        RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
        dispatcher.forward(request, response);
    }
    
    private void listSpesificTask(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException, ServletException {
    	String keyword = request.getParameter("keyword");
    	System.out.println(keyword);
    	List<Task> listTask = taskDAO.findTask(keyword);
    	System.out.println("testtttttttttttttttt");
    	request.setAttribute("listTask", listTask);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
    	dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Task existingTask = taskDAO.selectTask(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("task-form.jsp");
        request.setAttribute("task", existingTask);
        dispatcher.forward(request, response);
    }

    private void insertTask(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String name = request.getParameter("name");
        try {
        String dateString = request.getParameter("duedate");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date parsedDate = sdf.parse(dateString);
        Timestamp duedate = new Timestamp(parsedDate.getTime());
        String description = request.getParameter("description");
        //String status = request.getParameter("status");
        Task newTask = new Task(name, duedate, description, false);
        taskDAO.insertTask(newTask);
        response.sendRedirect("list");
        } catch(Exception e) {
        	e.printStackTrace();
        }

    }

    private void updateTask(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        try {
        String dateString = request.getParameter("duedate");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date parsedDate = sdf.parse(dateString);
        Timestamp duedate = new Timestamp(parsedDate.getTime());
        String description = request.getParameter("description");
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        Task updatedTask = new Task(id, name, duedate, description, status);
        taskDAO.updateTask(updatedTask);
        response.sendRedirect("list");
        } catch(Exception e) {
        	e.printStackTrace();
        }

    }

    private void updateTaskStatus(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        status = !status;
        taskDAO.updateTaskStatus(id, status);
        response.sendRedirect("list");
    }

    private void deleteTask(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        taskDAO.deleteTask(id);
        response.sendRedirect("list");
    }
}
