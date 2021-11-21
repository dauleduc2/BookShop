<%@page import="constant.Router"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>BFF Shop</title>
    <link rel="stylesheet" href="asset/styles.css" type="text/css" />
    <jsp:include page="./Navbar.jsp">
      <jsp:param name="title" value="Sannin SC |  Add Room" />
    </jsp:include>
  </head>
  <body>
    <div
      class="min-h-screen px-4 py-16 bg-white  sm:px-6 sm:py-24 md:grid md:place-items-center lg:px-8"
    >
      <div class="mx-auto max-w-max">
        <main class="sm:flex">
          <p class="text-4xl font-extrabold text-indigo-600 sm:text-5xl">
            ${requestScope.errorStatus}
          </p>
          <div class="sm:ml-6">
            <div class="sm:border-l sm:border-gray-200 sm:pl-6">
              <h1
                class="text-4xl font-extrabold tracking-tight text-gray-900  sm:text-5xl"
              >
                ${requestScope.errorTitle}
              </h1>
              <p class="mt-1 text-base text-gray-500">
                ${requestScope.errorDescription}
              </p>
            </div>
            <div
              class="flex justify-start mt-10 space-x-3  sm:border-l sm:border-transparent sm:pl-6"
            >
              <a
                href="<%=Router.HOME_CONTROLLER%>"
                class="items-center px-4 py-2 text-sm font-medium text-center text-white bg-indigo-600 border border-transparent rounded-md shadow-sm  hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
              >
                Go back home
              </a>
            </div>
          </div>
        </main>
      </div>
    </div>
  </body>
</html>
