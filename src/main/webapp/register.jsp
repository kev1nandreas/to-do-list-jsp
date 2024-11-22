<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>User Registration Form</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 50%;
        margin: 50px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }
    h1 {
        text-align: center;
        color: #333;
    }
    table {
        width: 100%;
        margin-bottom: 20px;
    }
    td {
        padding: 8px;
        text-align: left;
        font-size: 14px;
    }
    input[type="text"], input[type="email"], input[type="password"] {
        width: 100%;
        padding: 8px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .error {
        color: red;
        font-size: 14px;
        text-align: center;
    }
</style>
</head>
<body>
 <div class="container">
  <h1>User Registration Form</h1>
  <%
    String errorMessage = (String) request.getAttribute("error");
    if (errorMessage != null) {
  %>
      <p class="error"><%= errorMessage %></p>
  <%
    }
  %>
  <form action="<%= request.getContextPath() %>/newuser" method="post">
   <table>
    <tr>
     <td>Name</td>
     <td><input type="text" name="name" required /></td>
    </tr>
    <tr>
     <td>Email</td>
     <td><input type="email" name="email" required /></td>
    </tr>
    <tr>
     <td>Phone</td>
     <td><input type="text" name="phone" required /></td>
    </tr>
    <tr>
     <td>Username</td>
     <td><input type="text" name="username" required /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" required /></td>
    </tr>
   </table>
   <input type="submit" value="Register" />
  </form>
  <p style="text-align:center;">Already have an account? <a href="<%= request.getContextPath() %>/login">Login here</a></p>
 </div>
</body>
</html>
