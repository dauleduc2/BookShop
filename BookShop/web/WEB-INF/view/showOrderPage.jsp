<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="asset/styles.css" type="text/css" />
        <title>JSP Page</title>
        <jsp:include page="./commonView/Navbar.jsp">
            <jsp:param name="title" value="Sannin SC |  Add Room" />
        </jsp:include>
    </head>
    <body>
        <div class="bg-white">
            <div class="max-w-7xl mx-auto py-16 px-4 sm:px-6 lg:pb-24 lg:px-8">
                <div class="max-w-xl">
                    <h1 class="text-2xl font-extrabold tracking-tight text-gray-900 sm:text-3xl">Order history</h1>
                    <p class="mt-2 text-sm text-gray-500">Check the status of recent orders, manage returns, and download invoices.</p>
                </div>

                <div class="mt-16">
                    <h2 class="sr-only">Recent orders</h2>

                    <div class="space-y-20">
                        <div>
                            <table class="mt-4 w-full text-gray-500 sm:mt-6">
                                <caption class="sr-only">
                                    Orders
                                </caption>
                                <thead class="sr-only text-sm text-gray-500 text-left sm:not-sr-only">
                                    <tr>
                                        <th scope="col" class="hidden pr-8 py-3 font-normal sm:table-cell">Order</th>
                                        <th scope="col" class="hidden pr-8 py-3 font-normal sm:table-cell">Create Date</th>
                                        <th scope="col" class="hidden pr-8 py-3 font-normal sm:table-cell">Status</th>
                                        <th scope="col" class="hidden w-1/5 pr-8 py-3 font-normal sm:table-cell">Address</th>
                                        <th scope="col" class="hidden pr-8 py-3 font-normal sm:table-cell">Phone number</th>
                                        <th scope="col" class="hidden w-1/5 pr-8 py-3 font-normal sm:table-cell">Consignee Name</th>
                                        <th scope="col" class="hidden pr-8 py-3 font-normal sm:table-cell"></th>
                                    </tr>
                                </thead>
                                <tbody class="border-b border-gray-200 divide-y divide-gray-200 text-sm sm:border-t">
                                    <c:forEach var="order" items="${requestScope.orders}" varStatus="pos">
                                        <tr>
                                            <td class="py-6 pr-8">
                                                <div>
                                                    <a href="<%=Router.PRODUCT_IN_ORDER_CONTROLLER%>?orderId=${order.getOrderId()}" class="text-indigo-600">View <span class="hidden lg:inline">#${pos.count}</span><span class="sr-only">, ${order.getCreatedDate()}</span></a>
                                                </div>
                                            </td>
                                            <td class="hidden py-6 pr-8 sm:table-cell">
                                                ${order.getCreatedDate()}
                                            </td>
                                            <td class="py-6 pr-8 sm:table-cell">
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
                                            <td class="hidden py-6 font-medium sm:table-cell">
                                                ${order.getAddress()}
                                            </td>
                                            <td class="hidden py-6 font-medium sm:table-cell">
                                                ${order.getPhoneNumber()}
                                            </td>
                                            <td class="hidden py-6 font-medium sm:table-cell">
                                                ${order.getConsigneeName()}
                                            </td>
                                            <c:if test="${(order.getStatus() == 0) || (order.getStatus() == 1)}">
                                                <td class="hidden py-6 font-medium sm:table-cell">
                                                    <a href="<%=Router.CANCEL_ORDER_CONTROLLER%>?orderId=${order.getOrderId()}" class="inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded shadow-sm text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                                                        Cancel
                                                    </a>
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>

                                    <!-- More products... -->
                                </tbody>
                            </table>
                        </div>

                        <!-- More orders... -->
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
