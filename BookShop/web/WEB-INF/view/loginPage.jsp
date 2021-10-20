<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>BookShop Login</title>
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />
                <jsp:include page="./commonView/Navbar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
        </head>
</head>
<body>
        <div
            class="relative flex flex-col justify-center min-h-screen lg:py-12 bg-white  lg:bg-gradient-to-b lg:from-gray-50 lg:to-gray-100 sm:px-6 lg:px-8"
            >
                <div class="sm:mx-auto sm:w-full sm:max-w-md">
                        <img class="w-20 h-20 mx-auto" src="asset/logo.png" alt="Workflow" />
                        <h2
                            class="mt-6 text-4xl font-extrabold text-center text-gray-900 hello"
                            >
                                Sign in
                        </h2>
                </div>

                <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
                        <div class="px-4 py-8 bg-white lg:shadow-xl sm:rounded-xl sm:px-10">
                                <form class="space-y-6" action="<%=Router.LOGIN_CONTROLLER%>" method="POST">
                                        <div>
                                                <label
                                                    for="email"
                                                    class="block text-sm font-medium text-gray-700"
                                                    >
                                                        Username
                                                </label>
                                                <div class="mt-1">
                                                        <input
                                                            id="username"
                                                            name="username"
                                                            type="text"
                                                            autocomplete="username"
                                                            required
                                                            class="block w-full px-3 py-2 placeholder-gray-400 border border-gray-300 rounded-md shadow-sm appearance-none  focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                                            />
                                                </div>
                                                <p class="mt-2 text-sm text-red-600">
                                                        ${requestScope.usernameError}
                                                </p>
                                        </div>

                                        <div>
                                                <label
                                                    for="password"
                                                    class="block text-sm font-medium text-gray-700"
                                                    >
                                                        Password
                                                </label>
                                                <div class="mt-1">
                                                        <input
                                                            id="password"
                                                            name="password"
                                                            type="password"
                                                            autocomplete="current-password"
                                                            required
                                                            class="block w-full px-3 py-2 placeholder-gray-400 border border-gray-300 rounded-md shadow-sm appearance-none  focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                                            />
                                                </div>
                                                <p class="mt-2 text-sm text-red-600">
                                                        ${requestScope.passwordError}
                                                </p>
                                        </div>
                                        <p class="text-sm text-left text-red-600">
                                                ${requestScope.errorMessage}
                                        </p>



                                        <div>
                                                <button
                                                    type="submit"
                                                    class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm  hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                                                    >
                                                        Sign in
                                                </button>
                                        </div>
                                        <div class="flex justify-end">
                                                <div class="self-end mt-4 text-sm">
                                                        Don't have account yet?
                                                        <a
                                                            href="<%=Router.REGISTER_CONTROLLER%>"
                                                            class="font-semibold text-indigo-600 underline  hover:text-indigo-500"
                                                            >
                                                                Register
                                                        </a>
                                                </div>
                                        </div>
                                </form>
                        </div>
                </div>
        </div>
</body>
</html>
