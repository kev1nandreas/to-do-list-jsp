<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>User Registration Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-slate-300 flex justify-center items-center h-screen">
    <div class="bg-white w-fit flex rounded-2xl overflow-hidden">
        <div class="p-10 w-[30rem]">

            <!-- Error Message -->
            <% String errorMessage=(String) request.getAttribute("error"); if (errorMessage !=null &&
                !errorMessage.isEmpty()) { %>

                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <%= errorMessage %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <% } %>

                    <h1 class="text-3xl font-bold mb-2">Register</h1>
                    <p class="mb-4">Hi new member! Please register so we can know about you deeper.</p>


                    <form action="<%= request.getContextPath() %>/newuser" method="post">
                        <!-- Full Name -->
                        <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text"
                            name="name" id="name" placeholder="Type your full name" required>
                        <br>

                        <!-- Email -->
                        <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="email"
                            name="email" id="email" placeholder="Type your valid email" required>
                        <br>

                        <!-- Phone -->
                        <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text"
                            name="phone" id="phone" placeholder="Type your phone number" pattern="\d{8,}" minlength="8"
                            required>
                        <br>


                        <!-- Username -->
                        <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text"
                            name="username" id="username" placeholder="Type your username" required>
                        <br>

                        <!-- Password -->
                        <input class="border-slate-200 p-2 px-4 w-full mt-2 rounded-md bg-slate-100" type="password"
                            name="password" id="password" placeholder="Type your strong password" minlength="6"
                            required>

                        <!-- Submit Button -->
                        <button type="submit"
                            class="bg-blue-400 p-2 px-4 w-full rounded-full text-white select-none mt-5 hover:bg-blue-600">
                            Register
                        </button>
                    </form>

                    <!-- Redirect to Login -->
                    <p class="text-center mt-3">Already a member?
                        <span class="font-bold hover:text-red-400">
                            <a href="<%= request.getContextPath() %>/login">Login</a>
                        </span>
                    </p>
        </div>
    </div>
</body>

</html>