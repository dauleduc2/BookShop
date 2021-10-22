<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Add new category</title>
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />
                <jsp:include page="./commonView/Navbar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
        </head>
</head>
<body>
        <div
      class="
        flex flex-col
        items-center
        justify-center
        flex-1
        h-screen
        bg-gradient-to-b
        from-gray-50
        to-gray-100
      "
    >
      <div class="bg-white shadow sm:rounded-lg m-auto max-w-md">
        <div class="px-4 py-5 sm:p-6">
          <h3 class="text-lg leading-6 font-medium text-gray-900">
            Add new category
          </h3>
          <div class="mt-2 max-w-xl text-sm text-gray-500">
            <p>Write down a new category you want to add to the store.</p>
          </div>
          <form action="<%=Router.ADDCATEGORY_CONTROLLER%>" method="POST" class="mt-5 sm:flex sm:items-center">
            <div class="w-full flex flex-col sm:max-w-xs">
              <label for="category" class="sr-only">Category</label>
              <input
                type="text"
                name="category"
                id="category"
                class="
                  shadow-sm
                  focus:ring-indigo-500 focus:border-indigo-500
                  block
                  w-full
                  sm:text-sm
                  border-gray-300
                  rounded-md
                "
                placeholder=""
              />
            </div>
            <button
              type="submit"
              class="
                mt-3
                w-full
                inline-flex
                items-center
                justify-center
                px-4
                py-2
                border border-transparent
                shadow-sm
                font-medium
                rounded-md
                text-white
                bg-indigo-600
                hover:bg-indigo-700
                focus:outline-none
                focus:ring-2
                focus:ring-offset-2
                focus:ring-indigo-500
                sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm
              "
            >
              Save
            </button>
          </form>
          <p class="mt-2 text-sm text-red-600" id="email-error">
            ${requestScope.categoryError}
          </p>
        </div>
      </div>
    </div>
</body>
</html>
