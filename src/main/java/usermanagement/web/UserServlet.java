package usermanagement.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import taskmanagement.dao.TaskDAO;
import taskmanagement.model.Task;
import usermanagement.dao.UserDAO;
import usermanagement.model.User;

@WebServlet("/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;
	private TaskDAO taskDAO;
	public static int u_id = -1; // placeholder uid

	@Override
	public void init() {
		userDAO = new UserDAO();
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
				case "/register":
					showRegisterForm(request, response);
					break;
				case "/newuser":
					registerUser(request, response);
					break;
				case "/login":
					showLoginForm(request, response);
					break;
				case "/logout":
					u_id = -1;
					response.sendRedirect("login");
					break;
				case "/authenticate":
					authenticateUser(request, response);
					break;
				case "/insert":
					if (checkAuth(request, response)) {
						insertTask(request, response);
						break;
					}
				case "/delete":
					if (checkAuth(request, response)) {
						deleteTask(request, response);
						break;
					}
				case "/update":
					if (checkAuth(request, response)) {
						updateTask(request, response);
						break;
					}
				case "/status":
					if (checkAuth(request, response)) {
						updateTaskStatus(request, response);
						break;
					}
				case "/find":
					if (checkAuth(request, response)) {
						listSpesificTask(request, response);
						break;
					}
				case "/task":
					if (checkAuth(request, response)) {
						listTask(request, response);
						break;
					}
				case "/profile":
					if (checkAuth(request, response)) {
						seeProfile(request, response);
						break;
					}
				default:
					showLoginForm(request, response);
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	private boolean checkAuth(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		if (u_id == -1) {
			return false;
		}
		return true;
	}

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
			if (userDAO.registerUser(user)) {
				String successMessage = "Registration successful! Please login.";
				response.sendRedirect("login?success=" + URLEncoder.encode(successMessage, "UTF-8"));
			} else {
				request.setAttribute("error", "Registration failed! Username has been used.");
				showRegisterForm(request, response); // Show the registration form with an error message
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

			int validCredential = userDAO.validate(user);

			if (validCredential != -1) {
				// Successful login, redirect to user homepage

				TaskDAO.u_id = validCredential;
				UserServlet.u_id = validCredential;
				String contextPath = request.getContextPath();
				response.sendRedirect(contextPath + "/task");

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
		request.setAttribute("listTask", listTask);
		RequestDispatcher dispatcher = request.getRequestDispatcher("task-list.jsp");
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

			// String status = request.getParameter("status");
			Task newTask = new Task(name, duedate, description, false, u_id);
			taskDAO.insertTask(newTask);
			response.sendRedirect("task");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void updateTask(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		System.out.println(request);
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		try {
			String dateString = request.getParameter("duedate");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			Date parsedDate = sdf.parse(dateString);
			Timestamp duedate = new Timestamp(parsedDate.getTime());
			String description = request.getParameter("description");

			boolean status = Boolean.parseBoolean(request.getParameter("status"));
			System.out.println(status);
			Task updatedTask = new Task(id, name, duedate, description, status, u_id);
			taskDAO.updateTask(updatedTask);
			response.sendRedirect("task");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void updateTaskStatus(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		boolean status = Boolean.parseBoolean(request.getParameter("status"));
		status = !status;
		taskDAO.updateTaskStatus(id, status);
		response.sendRedirect("task");
	}

	private void deleteTask(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		taskDAO.deleteTask(id);
		response.sendRedirect("task");
	}

	private void seeProfile(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		User profile = userDAO.selectProfile();
		request.setAttribute("profile", profile);
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
		dispatcher.forward(request, response);
	}
}
