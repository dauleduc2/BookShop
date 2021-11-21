<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@page
import="constant.Router"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>BFF Shop</title>
    <link rel="stylesheet" href="asset/styles.css" type="text/css" />
  </head>
  <body>
    <div class="flex">
      <jsp:include page="./commonView/adminSideBar.jsp">
        <jsp:param name="title" value="Sannin SC |  Add Room" />
      </jsp:include>
      <div class="flex flex-col justify-start flex-1 min-h-screen p-10">
        <div class="mb-5 max-w-7xl">
          <h1 class="text-2xl font-semibold text-gray-900">Product list</h1>
        </div>
        <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div
            class="inline-block min-w-full py-2 align-middle sm:px-6 lg:px-8"
          >
            <div
              class="overflow-hidden border-b border-gray-200 shadow  sm:rounded-lg"
            >
              <table class="min-w-full px-5 divide-y divide-gray-200">
                <thead class="bg-gray-50">
                  <tr>
                    <th
                      scope="col"
                      class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                    >
                      STT
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                    >
                      Name
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                    >
                      quantity
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                    >
                      price
                    </th>
                    <th
                      scope="col"
                      class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                    >
                      Create Date
                    </th>
                    <th scope="col" class="relative px-6 py-5">
                      <span class="sr-only">Edit</span>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <%int count = 1;%>
                  <c:forEach var="product" items="${requestScope.products}">
                    <tr class="bg-gray-50">
                      <td
                        class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                      >
                        #<%=count++%>
                      </td>
                      <td
                        class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                      >
                        ${product.getName()}
                      </td>
                      <td
                        class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                      >
                        ${product.getQuantity()}
                      </td>
                      <td
                        class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                      >
                        ${product.getPrice()}
                      </td>
                      <td
                        class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                      >
                        ${product.getCreatedDate()}
                      </td>
                      <td
                        class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                      >
                        <button
                          type="button"
                          class="
                            inline-flex
                            items-center
                            px-2.5
                            py-1.5
                            border border-transparent
                            text-xs
                            font-medium
                            rounded
                            shadow-sm
                            text-white
                            bg-indigo-600
                            hover:bg-indigo-700
                            focus:outline-none
                            focus:ring-2
                            focus:ring-offset-2
                            focus:ring-indigo-500
                          "
                        >
                          Edit
                        </button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="flex flex-row w-full mt-5 just">
          <button
            type="button"
            class="inline-flex items-center px-3 py-2 text-sm font-medium leading-4 text-white bg-indigo-600 border border-transparent rounded-md shadow-sm  hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          >
            Previous
          </button>
          <button
            type="button"
            class="inline-flex items-center px-3 py-2 text-sm font-medium leading-4 text-white bg-indigo-600 border border-transparent rounded-md shadow-sm  hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          >
            Next
          </button>
        </div>
      </div>
    </div>
  </body>
</html>
