<!-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> -->
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>User Registration Form</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-slate-300 flex justify-center items-center h-screen">
    <div class="bg-white w-fit flex rounded-2xl overflow-hidden">
        <div class="p-10 w-[30rem]">
            <h1 class="text-3xl font-bold mb-2">Register</h1>
            <p class="mb-4">Hi new member! Please register so we can know about you deeper.</p>
            <form action="<%= request.getContextPath() %>/register" method="post">
                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text" name="name"
                    id="name" placeholder="Type your full name">
                <br>

                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="email" name="email"
                    id="email" placeholder="Type your valid email">
                <br>

                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text" name="phone"
                    id="phone" placeholder="Type your phone number">
                <br>

                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="text" name="username"
                    id="username" placeholder="Type your username">
                <br>

                <input class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100" type="password"
                    name="password" id="password" placeholder="Type your strong password">

                <button type="submit"
                    class="bg-blue-400 p-2 px-4 w-full rounded-full text-white select-none mt-5 hover:bg-blue-600">Register</button>
            </form>

            <p class="text-center mt-3 ">Already a member?
                <span class="font-bold hover:text-red-400"><a href="">Login</a></span>
            </p>
        </div>
    </div>
</body>

</html>