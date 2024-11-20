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

<style>
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
	padding: 12px 20px;
	border-radius: 10px;
	cursor: pointer;
	transition: background 0.3s ease;
	font-size: 17px;
}

.btn-custom:hover {
	background: linear-gradient(to right, #6e38cc, #a86a5a);
	color: #fafafa;
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
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<div class="text-center">
					<c:if test="${user != null}">
						<form action="update" method="post">
					</c:if>
					<c:if test="${user == null}">
						<form action="insert" method="post">
					</c:if>
					<caption>
						<h2>
							<c:if test="${user != null}">
                                    Edit User
                                </c:if>
							<c:if test="${user == null}">
                                    Add New User
                                </c:if>
						</h2>
					</caption>
				</div>



				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email">
				</fieldset>

				<fieldset class="form-group">
					<label>Country</label> <input type="text"
						value="<c:out value='${user.country}' />" class="form-control"
						name="country">
				</fieldset>
				<div class="text-center">
					<button type="submit" class="btn btn-custom text-center">Save</button>
				</div>

				</form>
			</div>
		</div>
	</div>
</body>

</html>