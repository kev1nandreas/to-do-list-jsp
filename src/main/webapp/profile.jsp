<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My To Do List</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="justify-center flex items-center h-screen">
    <div class="p-10 w-[30rem] bg-slate-200 rounded-xl">
        <h1 class="text-3xl font-bold mb-2 text-center">Retrieve Your Data</h1>
        <p class="mb-4 text-center">Forgot your previous submitted data? Let's retrieve your data!</p>

        <p>Name</p>
        <div class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100">${profile.name}</div>

        <p>Email</p>
        <div class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100">${profile.email}</div>

        <p>Phone</p>
        <div class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100">${profile.phone}</div>

        <p>Username</p>
        <div class="border-slate-200 p-2 px-4 w-full my-2 rounded-md bg-slate-100">${profile.username}</div>

        <p class="text-center mt-3 ">Return to main menu?
            <span class="font-bold hover:text-red-400"><a href="/quiz2/task">Click Here</a></span>
        </p>
    </div>
</body>

</html>