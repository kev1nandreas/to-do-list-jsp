<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>Quiz 2 WebPro</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">

<style>
body {
overflow-x: hidden;
}
.bg-custom {
	background: linear-gradient(to right, #8A48F4, #A051D1, #D27C6F, #FFB712);
	background-color: #542870;
}

.nav-link-custom {
	font-size: 20px;
	font-weight: bold;
	color: #fafafa;
	text-decoration: none !important;
}

.nav-link-custom1 {
	font-size: 20px;
	color: #fafafa;
	text-decoration: none !important;
	transition: color 0.3s ease;
}

.navbar {
	height: 100px;
}

body, p, h1, h2, h3, h4, h5, h6, a {
	font-family: 'Poppins', sans-serif;
}

.nav-link {
	color: #fafafa;
}

.btn-custom {
	background: linear-gradient(to right, #8a48f4, #D27C6F);
	color: #fafafa;
	border: none;
	padding: 15px 30px;
	border-radius: 10px;
	cursor: pointer;
	transition: background 0.3s ease;
	font-size: 17px;
}

.btn-custom-edit {
	background-color: #8a48f4;
	color: #fafafa;
	border: none;
	padding: 10px 25px;
	border-radius: 10px;
	cursor: pointer;
	transition: background 0.3s ease;
	font-size: 14px;
}

.btn-custom-edit1 {
	background-color: red;
	color: #fafafa;
	border: none;
	padding: 10px 25px;
	border-radius: 10px;
	cursor: pointer;
	transition: background 0.3s ease;
	font-size: 14px;
}

.btn-custom:hover {
	background: linear-gradient(to right, #6e38cc, #a86a5a);
	color: #fafafa;
}

.btn-custom-edit:hover {
	background-color: #6e38cc;
	color: #fafafa;
}

.btn-custom-edit1:hover {
	background-color: B31312;
	color: #fafafa;
}

.table-bordered {
	width: 100%;
	border-collapse: collapse;
}

.table-bordered th, .table-bordered td {
	text-align: center;
	vertical-align: middle;
}
</style>
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md bg-custom">
			<div>
				<a href="#" class="nav-link-custom ml-5"> User Client </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link-custom1 ml-5">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-custom">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Country</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${listUser}">
						<tr class="text-center">
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.country}" /></td>
							<td class="text-center">
								<form action="edit" method="get" style="display: inline;">
									<input type="hidden" name="id" value="${user.id}" />
									<button type="submit" class="btn btn-custom-edit">Edit</button>
								</form>

								<form action="delete" method="get" style="display: inline;">
									<input type="hidden" name="id" value="${user.id}" />
									<button type="submit" class="btn btn-custom-edit1">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>