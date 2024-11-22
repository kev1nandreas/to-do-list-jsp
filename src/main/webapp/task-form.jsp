<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" data-bs-theme="auto">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <title>Create a New Task</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Tempus Dominus CSS -->
  <link href="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.2.8/dist/css/tempus-dominus.min.css" rel="stylesheet">
  
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
  <style>
	  	html,
	body {
	  height: 100%;
	  color: 
	}
	
	.form-signin {
	  max-width: 330px;
	  padding: 1rem;
	}
	
	.form-signin .form-floating:focus-within {
	  z-index: 2;
	}
	
	.form-signin input[type="email"] {
	  margin-bottom: -1px;
	  border-bottom-right-radius: 0;
	  border-bottom-left-radius: 0;
	}
	
	.form-signin input[type="password"] {
	  margin-bottom: 10px;
	  border-top-left-radius: 0;
	  border-top-right-radius: 0;
	}
	
	
	
	.form-signin {
	  background-color: #40E4D3;
	  padding: 2rem;
	  border-radius: 0.5rem;
	  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
	}
	
	.form {
	  back
  
  </style>
</head>

<body class="d-flex align-items-center py-4 bg-body-tertiary">
  <main class="form-signin w-100 m-auto">
    <form method="POST" action="<%= request.getContextPath() %>/task">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

      

      <div class="form">
        <h1 class="h3 mb-3 fw-normal">Create a New Task</h1>

        <!-- Task name input -->
        <div class="form-floating mb-3">
          <input type="text" name="name" class="form-control" id="taskName" placeholder="Task Name" value="<%= request.getParameter("name") %>">
          <label for="taskName">Task Name</label>
        </div>

        <!-- Due date input -->
        <div class="form-floating mb-3">
          <div class="input-group" id="datetimepicker">
            <input type="text" name="due_date" class="form-control" placeholder="Select Date and Time" value="<%= request.getParameter("due_date") %>" />
            <span class="input-group-text">
              <i class="bi bi-calendar"></i>
            </span>
          </div>
        </div>

        <!-- Description Input -->
        <div class="form-floating mb-3">
          <input type="text" name="description" class="form-control" id="description" placeholder="Description">
          <label for="description">Description</label>
        </div>

        <button class="btn btn-primary w-100 py-2" type="submit">Create Task</button>
      </div>
    </form>
  </main>

  <!-- Bootstrap JS and Tempus Dominus -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-wEuXZRnXWoiUM1r0d0Pe+Zo0r+T5rOnokj3zEN1Jsno6ZIaXg4pnePLfwca8LkUH" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@eonasdan/tempus-dominus@6.2.8/dist/js/tempus-dominus.min.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      const picker = new tempusDominus.TempusDominus(document.getElementById('datetimepicker'), {
        display: {
          components: {
            calendar: true,
            clock: true,
          }
        },
        localization: {
          locale: 'en-US',
        }
      });
    });
  </script>
</body>

</html>
