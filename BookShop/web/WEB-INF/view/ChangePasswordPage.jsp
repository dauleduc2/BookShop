<%-- Document : RegisterPage Created on : Oct 8, 2021, 7:56:56 PM Author : Admin --%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <title>BookShop Change Password</title>
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />
        </head>
        <body>

                <div class="relative min-h-screen bg-gray-300 flex flex-col justify-center py-12 sm:px-6 lg:px-8">

                        <div class="sm:mx-auto sm:w-full sm:max-w-md">
                                <img class="mx-auto w-20 h-20" src="asset/logo.png" alt="Workflow" />
                                <h2 class="mt-6 text-center text-4xl font-extrabold text-gray-900 hello">Change password</h2>
                        </div>

                        <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
                                <div class="bg-white py-8 px-4 shadow-xl sm:rounded-xl sm:px-10">
                                        <form class="space-y-6" action="#" method="POST" >
                                                <div>
                                                        <label for="password" class="block text-sm font-medium text-gray-700"> Password </label>
                                                        <div class="mt-1">
                                                                <input
                                                                    id="password"
                                                                    name="password"
                                                                    type="password"
                                                                    autocomplete="current-password"
                                                                    required
                                                                    class="
                                                                    appearance-none
                                                                    block
                                                                    w-full
                                                                    px-3
                                                                    py-2
                                                                    border border-gray-300
                                                                    rounded-md
                                                                    shadow-sm
                                                                    placeholder-gray-400
                                                                    focus:outline-none focus:ring-indigo-500 focus:border-indigo-500
                                                                    sm:text-sm
                                                                    "
                                                                    />
                                                        </div>
                                                        <p class="mt-2 text-sm text-red-600">${requestScope.passwordError}</p>
                                                </div>
                                                <div>
                                                        <label for="newPassword" class="block text-sm font-medium text-gray-700">New Password </label>
                                                        <div class="mt-1">
                                                                <input
                                                                    id="newPassword"
                                                                    name="newPassword"
                                                                    type="newPpassword"
                                                                    autocomplete="current-password"
                                                                    required
                                                                    class="
                                                                    appearance-none
                                                                    block
                                                                    w-full
                                                                    px-3
                                                                    py-2
                                                                    border border-gray-300
                                                                    rounded-md
                                                                    shadow-sm
                                                                    placeholder-gray-400
                                                                    focus:outline-none focus:ring-indigo-500 focus:border-indigo-500
                                                                    sm:text-sm
                                                                    "
                                                                    />
                                                        </div>
                                                        <p class="mt-2 text-sm text-red-600">${requestScope.passwordError}</p>
                                                </div>
                                                <div>
                                                        <label for="newPasswordConfirm" class="block text-sm font-medium text-gray-700">New Password Confirm</label>
                                                        <div class="mt-1">
                                                                <input
                                                                    id="newPasswordConfirm"
                                                                    name="mewPasswordConfirm"
                                                                    type="password"
                                                                    autocomplete="current-password"
                                                                    required
                                                                    class="
                                                                    appearance-none
                                                                    block
                                                                    w-full
                                                                    px-3
                                                                    py-2
                                                                    border border-gray-300
                                                                    rounded-md
                                                                    shadow-sm
                                                                    placeholder-gray-400
                                                                    focus:outline-none focus:ring-indigo-500 focus:border-indigo-500
                                                                    sm:text-sm
                                                                    "
                                                                    />
                                                        </div>
                                                        <p class="mt-2 text-sm text-red-600">${requestScope.passwordError}</p>
                                                </div>
                                                <p class="text-sm text-red-600 text-left">${requestScope.errorMessage}</p>

                                                <div>
                                                        <button
                                                            type="submit"
                                                            class="
                                                            w-full
                                                            flex
                                                            justify-center
                                                            py-2
                                                            px-4
                                                            border border-transparent
                                                            rounded-md
                                                            shadow-sm
                                                            text-sm
                                                            font-medium
                                                            text-white
                                                            bg-indigo-600
                                                            hover:bg-indigo-700
                                                            focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
                                                            "
                                                            >
                                                                Change Password
                                                        </button>
                                                </div>

                                        </form>
                                </div>
                        </div>
                </div>
        </body>
</html>
