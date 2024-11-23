<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en" data-bs-theme="auto">

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <title>My To Do List</title>
      <script src="https://cdn.tailwindcss.com"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

      <style>
        .bi {
          display: inline-block;
          width: 1rem;
          height: 1rem;
        }

        /*
        * Sidebar
        */

        @media (min-width: 768px) {
          .sidebar .offcanvas-lg {
            position: -webkit-sticky;
            position: sticky;
            top: 48px;
          }

          .navbar-search {
            display: block;
          }
        }

        .sidebar .nav-link {
          font-size: .875rem;
          font-weight: 500;
        }

        .sidebar .nav-link.active {
          color: #2470dc;
        }

        .sidebar-heading {
          font-size: .75rem;
        }

        /*
        * Navbar
        */

        .navbar-brand {
          padding-top: .75rem;
          padding-bottom: .75rem;
          background-color: rgba(0, 0, 0, .25);
          box-shadow: inset -1px 0 0 rgba(0, 0, 0, .25);
        }

        .navbar .form-control {
          padding: .75rem 1rem;
        }

        .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          user-select: none;
        }

        @media (min-width: 768px) {
          .bd-placeholder-img-lg {
            font-size: 3.5rem;
          }
        }

        .b-example-divider {
          width: 100%;
          height: 3rem;
          background-color: rgba(0, 0, 0, .1);
          border: solid rgba(0, 0, 0, .15);
          border-width: 1px 0;
          box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
          flex-shrink: 0;
          width: 1.5rem;
          height: 100vh;
        }

        .bi {
          vertical-align: -.125em;
          fill: currentColor;
        }

        .nav-scroller {
          position: relative;
          z-index: 2;
          height: 2.75rem;
          overflow-y: hidden;
        }

        .nav-scroller .nav {
          display: flex;
          flex-wrap: nowrap;
          padding-bottom: 1rem;
          margin-top: -1px;
          overflow-x: auto;
          text-align: center;
          white-space: nowrap;
          -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
          --bd-violet-bg: #712cf9;
          --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

          --bs-btn-font-weight: 600;
          --bs-btn-color: var(--bs-white);
          --bs-btn-bg: var(--bd-violet-bg);
          --bs-btn-border-color: var(--bd-violet-bg);
          --bs-btn-hover-color: var(--bs-white);
          --bs-btn-hover-bg: #6528e0;
          --bs-btn-hover-border-color: #6528e0;
          --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
          --bs-btn-active-color: var(--bs-btn-hover-color);
          --bs-btn-active-bg: #5a23c8;
          --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
          z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
          display: block !important;
        }
      </style>
    </head>

    <body>
      <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
        <symbol id="door-closed" viewBox="0 0 16 16">
          <path d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z" />
          <path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z" />
        </symbol>
        <symbol id="profile-circle" viewBox="0 0 16 16">
          <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
          <path fill-rule="evenodd"
            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
        </symbol>
        <symbol id="house-fill" viewBox="0 0 16 16">
          <path
            d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.707 1.5Z" />
          <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6Z" />
        </symbol>
        <symbol id="list" viewBox="0 0 16 16">
          <path fill-rule="evenodd"
            d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
        </symbol>
      </svg>

      <header class="navbar sticky-top bg-dark flex-md-nowrap p-0 shadow" data-bs-theme="dark">
        <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6 text-white" href="/"> My To Do List</a>

        <ul class="navbar-nav flex-row d-md-none">

          <li class="nav-item text-nowrap">
            <button class="nav-link px-3 text-white" type="button" data-bs-toggle="offcanvas"
              data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
              aria-label="Toggle navigation">
              <svg class="bi">
                <use xlink:href="#list" />
              </svg>
            </button>
          </li>
        </ul>

        <div id="navbarSearch" class="navbar-search w-100 collapse">
          <input class="form-control w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search">
        </div>
      </header>

      <div class="container-fluid">
        <div class="row md:h-screen">

          <div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
            <div class="offcanvas-md offcanvas-end bg-body-tertiary" tabindex="-1" id="sidebarMenu"
              aria-labelledby="sidebarMenuLabel">
              <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="sidebarMenuLabel">My To Do List</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#sidebarMenu"
                  aria-label="Close"></button>
              </div>
              <div class="offcanvas-body d-md-flex flex-column p-0 pt-lg-3 overflow-y-auto">
                <ul class="nav flex-column">
                  <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2 active" aria-current="page" href="task">
                      <svg class="bi">
                        <use xlink:href="#house-fill" />
                      </svg>
                      Dashboard
                    </a>
                  </li>
                </ul>

                <hr class="my-3">

                <ul class="nav flex-column mb-auto">
                  <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="profile">
                      <svg class="bi">
                        <use xlink:href="#profile-circle" />
                      </svg>
                      Profile
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link d-flex align-items-center gap-2" href="logout">
                      <svg class="bi">
                        <use xlink:href="#door-closed" />
                      </svg>
                      Sign out
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>

          <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">

            <div class="flex mt-8">
              <div>
                <a>
                  <button type="button" class="btn btn-dark">Add New Task</button>
                </a>
              </div>

              <div class="ml-10">
                <form class="row g-3" method="GET" action="find">
                  <div class="col-auto">
                    <label for="keyword" class="visually-hidden">Keyword</label>
                    <input type="text" name="keyword" class="form-control" id="keyword" placeholder="Type Keyword ...">
                  </div>
                  <div class="col-auto">
                    <button type="submit" class="btn btn-secondary mb-3">Search</button>
                  </div>
                </form>
              </div>
            </div>

            <div class="overflow-scroll mt-3">
              <table class="table table-hover">
                <thead>
                  <tr>
                    <th scope="col" class="w-[4rem]">
                      <button class="sort-btn" id="sortNo">
                        No
                        <i class="bi bi-arrow-down-up"></i>
                      </button>
                    </th>
                    <th class="w-[15rem]" scope="col">Name</th>
                    <th scope="col">
                      <button class="sort-btn" id="sortDate">
                        Due Date
                        <i class="bi bi-arrow-down-up"></i>
                      </button>
                    </th>
                    <th class="hidden md:table-cell" scope="col">Description</th>
                    <th class="" scope="col">Completed</th>
                    <th scope="col">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="task" items="${listTask}" varStatus="status">
                    <tr>
                      <td>
                        <c:out value="${status.index + 1}" />
                      </td>
                      <td>
                        <c:out value="${task.name}" />
                      </td>
                      <td>
                        <c:out value="${task.duedate}" />
                      </td>
                      <td>
                        <c:out value="${task.description}" />
                      </td>
                      <td>
                        <c:choose>
                          <c:when test="${task.status == false}">
                            <span class="text-red-500">Not Done</span>
                          </c:when>
                          <c:when test="${task.status == true}">
                            <span class="text-green-500">Done</span>
                          </c:when>
                        </c:choose>
                      </td>
                      <td>
                        <button type="button" class="edit-btn btn-transparent d-inline" data-id="${task.id}"
                          data-name="${task.name}" data-duedate="${task.duedate}" data-description="${task.description}"
                          data-id="${task.id}">
                          <i class="inline-block" data-feather="edit"></i>
                        </button>

                        <button type="button" class="btn-transparent d-inline"
                          onclick="window.location.href='status?id=${task.id}&status=${task.status}'">
                          <i class="inline-block" data-feather="check-circle"></i>
                        </button>

                        <button type="button" class="btn-transparent d-inline"
                          onclick="if(confirm('Are you sure you want to delete this task?')) { window.location.href='delete?id=${task.id}'; }">
                          <i class="inline-block" data-feather="trash-2"></i>
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </main>
        </div>
      </div>

      <!-- Edit Task Form Pop Up -->
      <div
        class="form-edit fixed top-0 right-0 left-0 bottom-0 bg-slate-900 bg-opacity-45 flex justify-center items-center hidden">
        <div class="p-10 w-[30rem] bg-slate-200 rounded-xl relative">
          <button>
            <i class="feather-x absolute right-3 top-3 hover:text-red-500 hover:scale-110" data-feather="x"></i>
          </button>

          <h1 class="title text-3xl -mt-5 mb-3 font-bold text-center">Edit Your Task</h1>

          <form action="update" method="post">
            <input type="hidden" name="id" />

            <label for="name">Task Name</label>
            <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text" name="name"
              id="username">
            <br>

            <label for="duedate">Due Date</label>
            <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="datetime-local"
              name="duedate" id="duedate">

            <label for="description">Description</label>
            <textarea class="border-slate-200 p-2 px-4 w-full mt-2 rounded-md bg-slate-100" name="description"
              id="description"></textarea>

            <button type="submit"
              class="sub-btn bg-blue-400 p-2 px-4 w-full rounded-full text-white select-none mt-4 hover:bg-blue-600">Edit</button>
          </form>
        </div>
      </div>
    </body>

    <script>
      feather.replace();

      var closeEditForm = document.querySelector('.feather-x');
      var editForm = document.querySelector('.form-edit');
      var formAction = document.querySelector('.form-edit form');

      document.addEventListener('DOMContentLoaded', function () {
        const editButtons = document.querySelectorAll('.edit-btn');
        const newButton = document.querySelector('.btn-dark');
        const taskNameInput = document.querySelector('input[name="name"]');
        const dueDateInput = document.querySelector('input[name="duedate"]');
        const descriptionTextarea = document.querySelector('textarea[name="description"]');
        const taskIDInput = document.querySelector('input[name="id"]');
        const titleForm = document.querySelector('.title');
        const submitBtn = document.querySelector('.sub-btn');

        newButton.addEventListener('click', function () {
          titleForm.textContent = 'Add New Task';
          submitBtn.textContent = 'Add';
          formAction.action = 'insert';

          editForm.classList.remove('hidden');
        });

        editButtons.forEach(button => {
          button.addEventListener('click', function () {
            const taskId = this.getAttribute('data-id');
            const taskName = this.getAttribute('data-name');
            const taskDueDate = this.getAttribute('data-duedate');
            const taskDescription = this.getAttribute('data-description');

            taskNameInput.value = taskName;
            dueDateInput.value = taskDueDate;
            descriptionTextarea.value = taskDescription;
            taskIDInput.value = taskId;

            editForm.classList.remove('hidden');
          });
        });

        // Close the form when the close button is clicked
        document.querySelector('.form-edit button').addEventListener('click', function () {
          editForm.classList.add('hidden');
        });
      });
    </script>

    </html>