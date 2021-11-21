<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Add new category</title>
        <link rel="stylesheet" href="asset/styles.css" type="text/css" />
    </head>
    <body>
        <div>
            <jsp:include page="./commonView/adminSideBar.jsp">
                <jsp:param name="title" value="Sannin SC |  Add Room" />
            </jsp:include>
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
                                                        Address
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
                                                <%int count = 1;%>
                                                <c:forEach var="order" items="${requestScope.orders}">
                                                    <tr class="bg-gray-50">
                                                        <td
                                                            class="px-6 py-4 text-sm font-medium text-gray-900  whitespace-nowrap"
                                                            >
                                                            #<%=count++%>
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                                                            >
                                                            ${order.getCreatedDate()}
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                                                            >
                                                            ${order.getConsigneeName()}
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                                                            >
                                                            ${order.getPhoneNumber()}
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                                                            >
                                                            ${order.getAddress()}
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 text-sm text-gray-500  whitespace-nowrap"
                                                            >
                                                            <c:choose>
                                                                <c:when test="${order.getStatus() == 0}">
                                                                    Waiting
                                                                </c:when>
                                                                <c:when test="${order.getStatus() == 1}">
                                                                    Confirm
                                                                </c:when>
                                                                <c:when test="${order.getStatus() == 2}">
                                                                    Shipping
                                                                </c:when>
                                                                <c:when test="${order.getStatus() == 3}">
                                                                    Done
                                                                </c:when>
                                                                <c:when test="${order.getStatus() == 4}">
                                                                    Cancel
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td
                                                            class="px-6 py-4 text-sm font-medium text-right  whitespace-nowrap"
                                                            >
                                                            <form class="space-y-6" action="<%=Router.ADMIN_ORDER_CONTROLLER%>?orderId=${order.getOrderId()}" method="POST">
                                                                <button
                                                                    type="submit"
                                                                    class="text-indigo-600 hover:text-indigo-900"
                                                                    method="POST"
                                                                    >View</button
                                                                >
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
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
