<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@page
contentType="text/html" pageEncoding="UTF-8"%> <% String avatarUrl = (String)
session.getAttribute("avatarUrl");%> <%@page import="constant.Router"%>
<nav class="bg-gray-800">
  <div class="w-full px-2 mx-auto sm:px-6 lg:px-8">
    <div class="relative flex items-center justify-between h-16">
      <div class="inset-y-0 left-0 flex items-center sm:hidden">
        <!-- Mobile menu button-->
        <button
          type="button"
          class="
            inline-flex
            items-center
            justify-center
            p-2
            text-gray-400
            rounded-md
            hover:text-white hover:bg-gray-700
            focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white
          "
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
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16"
            />
          </svg>
          <svg
            class="hidden w-6 h-6"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke="currentColor"
            aria-hidden="true"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              d="M6 18L18 6M6 6l12 12"
            />
          </svg>
        </button>
      </div>
      <div
        class="
          flex
          items-center
          justify-center
          sm:items-stretch sm:justify-start
        "
      >
        <div class="flex items-center flex-shrink-0">
          <img
            class="hidden h-10 mx-auto sm:block"
            src="asset/logoFull.png"
            alt="Workflow"
          />
        </div>
        <div class="hidden sm:block sm:ml-6">
          <div class="flex space-x-4">
            <a
              href="<%=Router.HOME_CONTROLLER%>"
              class="
                px-3
                py-2
                text-sm
                font-medium
                text-gray-300
                rounded-md
                hover:bg-gray-700 hover:text-white
              "
              aria-current="page"
              >Home</a
            >
          </div>
        </div>
      </div>
      <form
        action="<%=Router.SEARCH_BOOK_CONTROLLER%>"
        method="POST"
        class="flex"
      >
        <label
          for="name"
          class="block pl-4 ml-px text-sm font-medium text-gray-700 sr-only"
          >Search</label
        >
        <input
          type="text"
          name="name"
          id="productName"
          class="
            block
            w-40
            p-1
            px-4
            border-gray-300
            rounded-md
            shadow-sm
            sm:w-80
            focus:ring-indigo-500 focus:border-indigo-500
            sm:text-sm
          "
          placeholder="Book name"
        />
        <button
          type="submit"
          class="
            ml-1
            inline-flex
            items-center
            p-1.5
            border border-transparent
            rounded-md
            shadow-sm
            text-white
            bg-white
            hover:bg-indigo-300
            focus:outline-none
            h-8
            w-8
          "
        >
          <svg
            width="24"
            height="24"
            viewBox="0 0 24 24"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M15.5 14H14.71L14.43 13.73C15.41 12.59 16 11.11 16 9.5C16 5.91 13.09 3 9.5 3C5.91 3 3 5.91 3 9.5C3 13.09 5.91 16 9.5 16C11.11 16 12.59 15.41 13.73 14.43L14 14.71V15.5L19 20.49L20.49 19L15.5 14ZM9.5 14C7.01 14 5 11.99 5 9.5C5 7.01 7.01 5 9.5 5C11.99 5 14 7.01 14 9.5C14 11.99 11.99 14 9.5 14Z"
              fill="#323232"
            />
          </svg>
        </button>
      </form>
      <div
        class="
          inset-y-0
          right-0
          flex
          pr-2
          sm:static sm:inset-auto sm:ml-6 sm:pr-0
        "
      >
        <!-- Profile dropdown -->
        <c:choose>
          <c:when test="${avatarUrl != null}">
            <div class="relative flex self-center">
              <a
                href="<%=Router.CART_CONTROLLER%>"
                class="z-50 hidden mr-6 text-gray-100 lg:block"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="w-8 h-8"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke="currentColor"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    stroke-width="2"
                    d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z"
                  />
                </svg>
              </a>
              <div class="">
                <button
                  type="button"
                  class="
                    flex
                    text-sm
                    bg-gray-800
                    rounded-full
                    focus:outline-none
                    focus:ring-2
                    focus:ring-offset-2
                    focus:ring-offset-gray-800
                    focus:ring-white
                    userButton
                  "
                  id="user-menu-button"
                  aria-expanded="false"
                  aria-haspopup="true"
                >
                  <img class="object-cover w-8 h-8 rounded-full"
                  src="<%=avatarUrl == null ? "asset/images/avatar.png" :
                  avatarUrl%>" alt="" />
                </button>
              </div>

              <div
                class="
                  absolute
                  right-0
                  z-50
                  hidden
                  w-48
                  mt-2
                  overflow-hidden
                  origin-top-right
                  bg-white
                  rounded-md
                  shadow-lg
                  top-10
                  ring-1 ring-black ring-opacity-5
                  focus:outline-none
                  dropdownMenu
                "
                role="menu"
                aria-orientation="vertical"
                aria-labelledby="user-menu-button"
                tabindex="-1"
              >
                <!-- Active: "bg-gray-100", Not Active: "" -->
                <a
                  href="<%=Router.PROFILE_CONTROLLER%>"
                  class="
                    block
                    px-4
                    py-2
                    text-sm text-gray-700
                    transition
                    duration-300
                    hover:bg-gray-700 hover:text-white
                  "
                  role="menuitem"
                  tabindex="-1"
                  id="user-menu-item-0"
                  >Your Profile</a
                >
                <a
                  href="<%=Router.SHOW_ORDERS_CONTROLLER%>"
                  class="
                    block
                    px-4
                    py-2
                    text-sm text-gray-700
                    transition
                    duration-300
                    hover:bg-gray-700 hover:text-white
                  "
                  role="menuitem"
                  tabindex="-1"
                  id="user-menu-item-0"
                  >My orders</a
                >
                <a
                  href="<%=Router.SIGNOUT_CONTROLLER%>"
                  class="
                    block
                    px-4
                    py-2
                    text-sm text-gray-700
                    transition
                    duration-300
                    hover:bg-gray-700 hover:text-white
                  "
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
                class="
                  px-3
                  py-2
                  text-sm
                  font-medium
                  text-gray-300
                  rounded-md
                  hover:bg-gray-700 hover:text-white
                "
                href="<%=Router.LOGIN_CONTROLLER%>"
              >
                Sign In
              </a>
              <a
                class="
                  px-3
                  py-2
                  text-sm
                  font-medium
                  text-gray-300
                  rounded-md
                  hover:bg-gray-700 hover:text-white
                "
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
      <a
        href="<%=Router.HOME_CONTROLLER%>"
        class="
          block
          px-3
          py-2
          text-base
          font-medium
          text-white
          bg-gray-900
          rounded-md
        "
        aria-current="page"
        >Home</a
      >

      <c:choose>
        <c:when test="${avatarUrl == null}">
          <a
            href="<%=Router.LOGIN_CONTROLLER%>"
            class="
              block
              px-3
              py-2
              text-base
              font-medium
              text-gray-300
              rounded-md
              hover:bg-gray-700 hover:text-white
            "
            >Sign in</a
          >
          <a
            href="<%=Router.REGISTER_CONTROLLER%>"
            class="
              block
              px-3
              py-2
              text-base
              font-medium
              text-gray-300
              rounded-md
              hover:bg-gray-700 hover:text-white
            "
            >Sign up</a
          >
        </c:when>
        <c:otherwise>
          <a
            href="<%=Router.CART_CONTROLLER%>"
            class="
              block
              px-3
              py-2
              text-base
              font-medium
              text-gray-300
              rounded-md
              hover:bg-gray-700 hover:text-white
            "
            >Cart</a
          >
        </c:otherwise>
      </c:choose>
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
