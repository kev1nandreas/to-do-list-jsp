package net.pwebf.usermanagement.web;

import java.io.IOException;
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

    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Redirect "/" to "/register"
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        // Retrieve form data from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //boolean notify = Boolean.parseBoolean(request.getParameter("notify"));
        //int notifyBefore = Integer.parseInt(request.getParameter("notifyBefore"));

        // Create a User object and set its attributes
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPhone(phone);
        user.setUsername(username);
        user.setPassword(password);
        //user.setNotify(notify);
        //user.setNotifyBefore(notifyBefore);

        try {
            // Register the user in the database
            userDAO.registerUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect to the register.jsp page after registration
        response.sendRedirect("register.jsp");
    }
}
