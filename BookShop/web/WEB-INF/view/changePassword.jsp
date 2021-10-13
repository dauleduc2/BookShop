<%@page import="constant.Router"%>
<%@page import="daos.UserDAO"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Change Password</title>
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />

                <jsp:include page="./commonView/Navbar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
        </head>
</head>
<body>
        <%
                String userId = (String) session.getAttribute("userId");
                UserDAO userDao = new UserDAO();
                User user = userDao.getUserById(userId);

        %>


        <div class="flex flex-col items-center justify-center flex-1 mt-24 ">
                <form
                    action="<%=Router.CHANGE_PASSWORD_CONTROLLER%>"
                    method="POST"
                    class="
                    w-full
                    max-w-3xl
                    overflow-hidden
                    bg-white
                    sm:shadow sm:rounded-lg sm:w-180
                    "
                    >
                        <div class="px-4 py-5 sm:px-6">
                                <h3 class="text-lg font-medium leading-6 text-gray-900">
                                        Change Password
                                </h3>
                                <p class="max-w-2xl mt-1 text-sm text-gray-500">Update your new password for <%= user.getUsername()%></p>
                        </div>
                        <div class="px-4 py-5 border-t border-gray-200 sm:p-0">
                                <dl class="sm:divide-y sm:divide-gray-200">
                                        <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="flex items-center text-sm font-medium text-gray-500">
                                                        <p>Old password</p>
                                                </dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                                        <input
                                                            id="oldPassword"
                                                            name="oldPassword"
                                                            type="password"
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
                                                            focus:outline-none
                                                            focus:ring-indigo-500
                                                            focus:border-indigo-500
                                                            sm:text-sm
                                                            "
                                                            />
                                                        <p class="mt-2 text-sm text-red-600" id="email-error">
                                                                ${requestScope.oldPasswordError}
                                                        </p>
                                                </dd>
                                        </div>
                                        <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="flex items-center text-sm font-medium text-gray-500">
                                                        <p>New password</p>
                                                </dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                                        <input
                                                            id="newPassword"
                                                            name="newPassword"
                                                            type="password"
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
                                                            focus:outline-none
                                                            focus:ring-indigo-500
                                                            focus:border-indigo-500
                                                            sm:text-sm
                                                            "
                                                            />
                                                        <p class="mt-2 text-sm text-red-600" id="email-error">
                                                                ${requestScope.newPasswordError}
                                                        </p>
                                                </dd>
                                        </div>
                                        <div class="py-4 sm:py-5 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-6">
                                                <dt class="flex items-center text-sm font-medium text-gray-500">
                                                        <p>New password confirm</p>
                                                </dt>
                                                <dd class="mt-1 text-sm text-gray-900 sm:mt-0 sm:col-span-2">
                                                        <input
                                                            id="confirmNewPassword"
                                                            name="confirmNewPassword"
                                                            type="password"
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
                                                            focus:outline-none
                                                            focus:ring-indigo-500
                                                            focus:border-indigo-500
                                                            sm:text-sm
                                                            "
                                                            />
                                                        <p class="mt-2 text-sm text-red-600" id="email-error">
                                                                ${requestScope.confirmNewPasswordError}
                                                        </p>
                                                </dd>
                                        </div>



                                </dl>
                        </div>
                        <div class="flex justify-end px-4 py-5 sm:px-6">
                                <a
                                    href="<%=Router.PROFILE_CONTROLLER%>"
                                    class="
                                    inline-flex
                                    items-center
                                    px-3
                                    py-2
                                    text-sm
                                    font-medium
                                    leading-4
                                    text-white
                                    bg-red-500
                                    border border-transparent
                                    rounded-md
                                    shadow-sm
                                    hover:bg-red-700
                                    focus:outline-none
                                    focus:ring-2
                                    focus:ring-offset-2
                                    focus:ring-indigo-500
                                    mr-5
                                    "
                                    >
                                        Edit profile
                                </a>
                                <input
                                    type="submit"
                                    class="
                                    inline-flex
                                    items-center
                                    px-3
                                    py-2
                                    text-sm
                                    font-medium
                                    leading-4
                                    text-white
                                    bg-indigo-600
                                    border border-transparent
                                    rounded-md
                                    shadow-sm
                                    hover:bg-indigo-700
                                    focus:outline-none
                                    focus:ring-2
                                    focus:ring-offset-2
                                    focus:ring-indigo-500
                                    "
                                    value="Save"
                                    >
                        </div>
                </form>
        </div>
</body>
</html>
