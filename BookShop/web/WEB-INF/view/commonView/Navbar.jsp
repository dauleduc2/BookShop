<%@page import="models.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        String avatarUrl = (String) session.getAttribute("avatarUrl");
%>
<%@page
    import="constant.Router"%>
    <nav class="bg-gray-800">
            <div class="px-2 mx-auto max-w-7xl sm:px-6 lg:px-8">
                    <div class="relative flex items-center justify-between h-16">
                            <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
                                    <!-- Mobile menu button-->
                                    <button
                                        type="button"
                                        class="inline-flex items-center justify-center p-2 text-gray-400 rounded-md  hover:text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                                        aria-controls="mobile-menu"
                                        aria-expanded="false"
                                        >
                                            <span class="sr-only">Open main menu</span>
                                            <svg
                                                class="block w-6 h-6"
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke="currentColor"
                                                aria-hidden="true"
                                                id="toggleButton"
                                                >
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
                                            </svg>
                                            <!--
                                                        Icon when menu is open.

                                                        Heroicon name: outline/x

                                                        Menu open: "block", Menu closed: "hidden"
                                            -->
                                            <svg
                                                class="hidden w-6 h-6"
                                                xmlns="http://www.w3.org/2000/svg"
                                                fill="none"
                                                viewBox="0 0 24 24"
                                                stroke="currentColor"
                                                aria-hidden="true"
                                                >
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                            </svg>
                                    </button>
                            </div>
                            <div class="flex items-center justify-center flex-1 sm:items-stretch sm:justify-start">
                                    <div class="flex items-center flex-shrink-0">
                                            <img class="h-10 mx-auto" src="asset/logoFull.png" alt="bookshop" />
                                    </div>
                                    <div class="hidden sm:block sm:ml-6">
                                            <div class="flex space-x-4">
                                                    <a
                                                        href="<%=Router.HOME_CONTROLLER%>"
                                                        class="px-3 py-2 text-sm font-medium text-gray-300 bg-gray-900 rounded-md navbarSelection"
                                                        aria-current="page"
                                                        >Home</a
                                                    >

                                                    <a
                                                        href="#"
                                                        class="px-3 py-2 text-sm font-medium text-gray-300 rounded-md  hover:bg-gray-700 hover:text-white navbarSelection"
                                                        >Category</a
                                                    >
                                            </div>
                                    </div>
                            </div>
                            <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
                                    <!-- Profile dropdown -->
                                    <c:choose>
                                        <c:when test="${avatarUrl != null}">
                                            <div class="relative ml-3">
                                                    <div>
                                                            <button
                                                                type="button"
                                                                class="flex text-sm bg-gray-800 rounded-full  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-800 focus:ring-white userButton"
                                                                id="user-menu-button"
                                                                aria-expanded="false"
                                                                aria-haspopup="true"
                                                                >
                                                                 <img class="w-8 h-8 rounded-full object-cover" src="<%= avatarUrl == null
									 ? "asset/images/avatar.png" : avatarUrl%>" alt="" />
                                                            </button>
                                                    </div>
                                                    <div
                                                        class="absolute right-0 z-50 hidden w-48 py-1 mt-2 origin-top-right bg-white rounded-md shadow-lg  ring-1 ring-black ring-opacity-5 focus:outline-none dropdownMenu"
                                                        role="menu"
                                                        aria-orientation="vertical"
                                                        aria-labelledby="user-menu-button"
                                                        tabindex="-1"
                                                        >
                                                            <!-- Active: "bg-gray-100", Not Active: "" -->
                                                            <a
                                                                href="<%=Router.PROFILE_CONTROLLER%>"
                                                                class="block px-4 py-2 text-sm text-gray-700 transition duration-300  hover:bg-gray-700 hover:text-white"
                                                                role="menuitem"
                                                                tabindex="-1"
                                                                id="user-menu-item-0"
                                                                >Your Profile</a
                                                            >
                                                            <a
                                                                href="<%=Router.SIGNOUT_CONTROLLER%>"
                                                                class="block px-4 py-2 text-sm text-gray-700 transition duration-300  hover:bg-gray-700 hover:text-white"
                                                                role="menuitem"
                                                                tabindex="-1"
                                                                id="user-menu-item-2"
                                                                >Sign out</a
                                                            >
                                                    </div>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="hidden sm:block">
                                                    <a
                                                        class="inline-flex items-center px-3 py-2 mr-4 text-sm font-medium leading-4 text-gray-700 bg-white border border-gray-300 rounded shadow-sm cursor-pointer  hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                                                        href="<%=Router.LOGIN_CONTROLLER%>"
                                                        >
                                                            Sign In
                                                    </a>
                                                    <a
                                                        class="inline-flex items-center px-3 py-2 text-sm font-medium leading-4 text-white rounded shadow-sm cursor-pointer  focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                                                        href="<%=Router.REGISTER_CONTROLLER%>"
                                                        >
                                                            Sign Up
                                                    </a>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                            </div>
                    </div>
            </div>

            <!-- Mobile menu, show/hide based on menu state. -->
            <div class="hidden sm:hidden" id="mobile-menu">
                    <div class="px-2 pt-2 pb-3 space-y-1">
                            <a href="#" class="block px-3 py-2 text-base font-medium text-white bg-gray-900 rounded-md" aria-current="page">Home</a>

                            <a href="#" class="block px-3 py-2 text-base font-medium text-gray-300 rounded-md hover:bg-gray-700 hover:text-white"
                               >Category</a
                            >
                    </div>
            </div>
    </nav>
    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
        integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
    ></script>
    <script src="asset/jquery.js"></script>
