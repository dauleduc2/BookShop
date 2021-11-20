<%-- 
    Document   : adminOrderPage
    Created on : Nov 20, 2021, 2:44:23 PM
    Author     : Admin
--%>

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
    <body>
        <div>
      <div class="hidden md:flex md:w-64 md:flex-col md:fixed md:inset-y-0">
        <div class="flex flex-col flex-1 min-h-0 bg-gray-800">
          <div class="flex flex-col flex-1 pt-5 pb-4 overflow-y-auto">
            <div
              class="flex items-center justify-center flex-shrink-0 w-full px-4"
            >
              <img
                class="w-auto h-8 align-center"
                src="./logoFull.png"
                alt="Workflow"
              />
            </div>
            <nav class="flex-1 px-2 mt-5 space-y-1">
              <a
                href="#"
                class="flex items-center px-2 py-2 text-sm font-medium text-white bg-gray-900 rounded-md  group"
              >
                <svg
                  class="flex-shrink-0 w-6 h-6 mr-3 text-white"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    d="M7.5 7.67001V6.70001C7.5 4.45001 9.31 2.24001 11.56 2.03001C14.24 1.77001 16.5 3.88001 16.5 6.51001V7.89001"
                    stroke="white"
                    stroke-width="1.5"
                    stroke-miterlimit="10"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <path
                    d="M8.99983 22H14.9998C19.0198 22 19.7398 20.39 19.9498 18.43L20.6998 12.43C20.9698 9.99 20.2698 8 15.9998 8H7.99983C3.72983 8 3.02983 9.99 3.29983 12.43L4.04983 18.43C4.25983 20.39 4.97983 22 8.99983 22Z"
                    stroke="white"
                    stroke-width="1.5"
                    stroke-miterlimit="10"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <path
                    d="M15.4955 12H15.5045"
                    stroke="white"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                  <path
                    d="M8.49451 12H8.50349"
                    stroke="white"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>

                View order
              </a>
            </nav>
          </div>
        </div>
      </div>
      <div class="flex flex-col flex-1 md:pl-64">
        <main class="flex-1">
          <div class="py-6">
            <div class="px-4 mx-auto max-w-7xl sm:px-6 lg:px-8">
              <h1 class="text-2xl font-semibold text-gray-900">
                Order history
              </h1>
            </div>
            <div class="px-8 mt-5">
              <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                <div
                  class="inline-block min-w-full py-2 align-middle  sm:px-6 lg:px-8"
                >
                  <div
                    class="overflow-hidden border-b border-gray-200 shadow  sm:rounded-lg"
                  >
                    <table class="min-w-full divide-y divide-gray-200">
                      <thead class="bg-gray-50">
                        <tr>
                          <th
                            scope="col"
                            class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                          ></th>
                          <th
                            scope="col"
                            class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                          >
                            Create Date
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
                            Phone number
                          </th>
                          <th
                            scope="col"
                            class="px-6 py-3 text-xs font-medium tracking-wider text-left text-gray-500 uppercase "
                          >
                            Status
                          </th>
                          <th scope="col" class="relative px-6 py-3">
                            <span class="sr-only">Edit</span>
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- Odd row -->
                        <tr class="bg-white">
                          <td
                            class="px-6 py-4 text-sm font-medium text-gray-900  whitespace-nowrap"
                          >
                            #1
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            Regional Paradigm Technician
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            jane.cooper@example.com
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            Admin
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            Done
                          </td>
                          <td
                            class="px-6 py-4 text-sm font-medium text-right  whitespace-nowrap"
                          >
                            <a
                              href="#"
                              class="text-indigo-600 hover:text-indigo-900"
                              >View</a
                            >
                          </td>
                        </tr>

                        <!-- Even row -->
                        <tr class="bg-gray-50">
                          <td
                            class="px-6 py-4 text-sm font-medium text-gray-900  whitespace-nowrap"
                          >
                            #2
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            Product Directives Officer
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            cody.fisher@example.com
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            Owner
                          </td>
                          <td
                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                          >
                            Shipping
                          </td>
                          <td
                            class="px-6 py-4 text-sm font-medium text-right  whitespace-nowrap"
                          >
                            <a
                              href="#"
                              class="text-indigo-600 hover:text-indigo-900"
                              >View</a
                            >
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
    </body>
</html>
