<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%@page
    import="constant.Router"%> <%@page contentType="text/html"
                                   pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>Add new category</title>
            <link rel="stylesheet" href="asset/styles.css" type="text/css" />
        </head>
        <body>
            <div class="flex">
                <jsp:include page="./commonView/adminSideBar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
                <div class="flex p-10 min-h-screen flex-col justify-start flex-1">
                    <div class="max-w-7xl mb-5">
                        <h1 class="text-2xl font-semibold text-gray-900">Product list</h1>
                    </div>
                    <div class="-my-2 overflow-x-auto sm:-mx-6 lg:-mx-8">
                        <div
                            class="py-2 align-middle inline-block min-w-full sm:px-6 lg:px-8"
                            >
                            <div
                                class="
                                shadow
                                overflow-hidden
                                border-b border-gray-200
                                sm:rounded-lg
                                "
                                >
                                <table class="min-w-full px-5 divide-y divide-gray-200">
                                    <thead class="bg-gray-50">
                                        <tr>
                                            <th
                                                scope="col"
                                                class="
                                                px-6
                                                py-3
                                                text-left text-xs
                                                font-medium
                                                text-gray-500
                                                uppercase
                                                tracking-wider
                                                "
                                                >
                                                STT
                                            </th>
                                            <th
                                                scope="col"
                                                class="
                                                px-6
                                                py-3
                                                text-left text-xs
                                                font-medium
                                                text-gray-500
                                                uppercase
                                                tracking-wider
                                                "
                                                >
                                                Name
                                            </th>
                                            <th
                                                scope="col"
                                                class="
                                                px-6
                                                py-3
                                                text-left text-xs
                                                font-medium
                                                text-gray-500
                                                uppercase
                                                tracking-wider
                                                "
                                                >
                                                quantity
                                            </th>
                                            <th
                                                scope="col"
                                                class="
                                                px-6
                                                py-3
                                                text-left text-xs
                                                font-medium
                                                text-gray-500
                                                uppercase
                                                tracking-wider
                                                "
                                                >
<<<<<<< HEAD
                                                ${product.getCreatedDate()}
                                            </td>
                                            <td class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap">
                                                <a  href="<%=Router.UPDATE_PRODUCT_CONTROLLER%>?productId=${product.getProductId()}"
                                                    type="button" class="inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                                    Edit
                                                </a>
                                            </td>
=======
                                                price
                                            </th>
                                            <th
                                                scope="col"
                                                class="
                                                px-6
                                                py-3
                                                text-left text-xs
                                                font-medium
                                                text-gray-500
                                                uppercase
                                                tracking-wider
                                                "
                                                >
                                                Create Date
                                            </th>
                                            <th scope="col" class="relative px-6 py-5">
                                                <span class="sr-only">Edit</span>
                                            </th>
>>>>>>> test
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%int count = ((int) request.getAttribute("page") - 1) * 10 + 1;%>
                                        <c:forEach var="product" items="${requestScope.products}">
                                            <tr class="bg-gray-50">
                                                <td
                                                    class="
                                                    px-6
                                                    py-4
                                                    text-sm text-gray-500
                                                    whitespace-nowrap
                                                    "
                                                    >
                                                    #<%=count++%>
                                                </td>
                                                <td
                                                    class="
                                                    px-6
                                                    py-4
                                                    text-sm text-gray-500
                                                    whitespace-nowrap
                                                    "
                                                    >
                                                    ${product.getName()}
                                                </td>
                                                <td
                                                    class="
                                                    px-6
                                                    py-4
                                                    text-sm text-gray-500
                                                    whitespace-nowrap
                                                    "
                                                    >
                                                    ${product.getQuantity()}
                                                </td>
                                                <td
                                                    class="
                                                    px-6
                                                    py-4
                                                    text-sm text-gray-500
                                                    whitespace-nowrap
                                                    "
                                                    >
                                                    ${product.getPrice()}
                                                </td>
                                                <td
                                                    class="
                                                    px-6
                                                    py-4
                                                    text-sm text-gray-500
                                                    whitespace-nowrap
                                                    "
                                                    >
                                                    ${product.getCreatedDate()}
                                                </td>
                                                <td
                                                    class="
                                                    px-6
                                                    py-4
                                                    text-sm text-gray-500
                                                    whitespace-nowrap
                                                    "
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
                    <div class="flex w-full flex-row mt-5 justify-end">
                        <a href='<%= Router.ADMIN_VIEW_PRODUCT_CONTROLLER%>?limit=10&page=${requestScope.page - 1}' type="button" class="inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Previous Page
                        </a>
                        <a href='<%= Router.ADMIN_VIEW_PRODUCT_CONTROLLER%>?limit=10&page=${requestScope.page + 1}' type="button" class="ml-5 inline-flex items-center px-3 py-2 border border-transparent text-sm leading-4 font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                            Next Page
                        </a>
                    </div>
                </div>
            </div>
        </body>
    </html>
