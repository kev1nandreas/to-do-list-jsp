<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>User Login Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-300 flex justify-center items-center h-screen">
    <div class="bg-white w-fit flex rounded-2xl overflow-hidden">
        <div class="p-10 w-[30rem]">
            <h1 class="text-3xl font-bold mb-2">Login</h1>
            <p class="mb-4">Hi! It's nice to see you here again</p>

            <!-- Success Message -->
            <%
                String successMessage = (String) session.getAttribute("successMessage");
                if (successMessage != null) {
                    session.removeAttribute("successMessage"); // Clear message after displaying
            %>
                <div class="bg-green-100 text-green-800 p-3 rounded-md mb-4">
                    <strong>Success:</strong> <%= successMessage %>
                </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/authenticate" method="post">
                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" 
                       type="text" 
                       name="username" 
                       id="username" 
                       placeholder="Type your username" 
                       required>
                <br>

                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" 
                       type="password" 
                       name="password" 
                       id="password" 
                       placeholder="Type your strong password" 
                       required>
                <br>

                <button type="submit"
                    class="bg-blue-400 p-2 px-4 w-full rounded-full text-white select-none mt-5 hover:bg-blue-600">
                    Login
                </button>
            </form>

            <p class="text-center mt-3">Don't have an account?
                <span class="font-bold hover:text-red-400">
                    <a href="<%= request.getContextPath() %>/register">Register</a>
                </span>
            </p>
        </div>
    </div>
</body>

</html>
