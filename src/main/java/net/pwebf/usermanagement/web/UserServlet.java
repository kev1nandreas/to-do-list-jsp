package net.pwebf.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.pwebf.usermanagement.dao.UserDAO;
import net.pwebf.usermanagement.model.User;

@WebServlet("/")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
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
                case "/register":
                    showRegisterForm(request, response);
                    break;
                case "/newuser":
                    registerUser(request, response);
                    break;
                case "/login":
                    showLoginForm(request, response);
                    break;
                case "/authenticate":
                    authenticateUser(request, response);
                    break;
                default:
                	showLoginForm(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    /*private void showHomePage(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Display a list of users or home page.
        RequestDispatcher dispatcher = request.getRequestDispatcher("user-home.jsp");
        dispatcher.forward(request, response);
    }*/

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response)
    	    throws SQLException, IOException, ServletException {
    	    try {
    	        String name = request.getParameter("name");
    	        String email = request.getParameter("email");
    	        String phone = request.getParameter("phone");
    	        String username = request.getParameter("username");
    	        String password = request.getParameter("password");

    	        User user = new User();
    	        user.setName(name);
    	        user.setEmail(email);
    	        user.setPhone(phone);
    	        user.setUsername(username);
    	        user.setPassword(password);
    	        user.setNotify(false);
    	        user.setNotifyBefore(0);
    	        try {
    	        userDAO.registerUser(user); // register user
    	        response.sendRedirect("login.jsp"); // Redirect after successful registration
    	        } catch(Exception x) {
    	        	
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        request.setAttribute("error", "Registration failed! Please try again.");
    	        showRegisterForm(request, response); // Show the registration form with an error message
    	    }
    	}


    private void showLoginForm(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    private void authenticateUser(HttpServletRequest request, HttpServletResponse response)
    throws SQLException, IOException {
        String username = request.getParameter("username");
        
        String password = request.getParameter("password");

        try {
            User user = new User(username, password);

            boolean validCredential = userDAO.validate(user);


            if (validCredential) {
                // Successful login, redirect to user homepage
            	response.sendRedirect("/" + username);
            } else {
                // Invalid credentials, show error message
                request.setAttribute("error", "Invalid credentials!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Authentication failed!");
        }
    }
}
