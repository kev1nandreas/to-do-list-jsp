<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
</head>
<body>
 <div align="center">
  <h1>Employee Login Form</h1>
  <form action="<%=request.getContextPath()%>/authenticate" method="post">
   <table style="width: 100%">
    <tr>
     <td>UserName</td>
     <td><input type="username" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>
   </table>
   <input type="submit" value="Submit" />
  </form>
 </div>
</body>
</html>
