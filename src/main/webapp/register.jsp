<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration Form</title>
</head>
<body>
 <div align="center">
  <h1>User Registration Form</h1>
  <form action="<%= request.getContextPath() %>/register" method="post">
   <table style="width: 80%">
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
 </div>
</body>
</html>
