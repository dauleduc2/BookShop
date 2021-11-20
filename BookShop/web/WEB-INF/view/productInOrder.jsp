<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>BookShop Login</title>
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />

        </head>
</head>
<body class="flex flex-col h-screen">
        <jsp:include page="./commonView/Navbar.jsp">
            <jsp:param name="title" value="Sannin SC |  Add Room" />
        </jsp:include>
        <div class="flex-1 bg-white">
                <main class="px-4 pt-16 pb-24 bg-white sm:px-6 sm:pt-24 lg:px-8 lg:py-32">
                        <div class="max-w-3xl mx-auto">
                                <div class="max-w-xl">
                                        <dl class="mt-12 text-sm font-medium">
                                                <dt class="text-gray-900">Order item</dt>
                                        </dl>
                                </div>
                                <section aria-labelledby="order-heading" class="mt-10 border-t border-gray-200">
                                        <h2 id="order-heading" class="sr-only">Your order</h2>

                                        <h3 class="sr-only">Items</h3>


                                        <c:forEach var="orderItem" items="${requestScope.orderItems}" varStatus="pos">
                                            <div class="flex py-10 space-x-6 border-b border-gray-200">
                                                    <img src="${orderItem.getImageUrl()}" alt="Glass bottle with black plastic pour top and mesh insert." class="flex-none object-cover object-center w-20 h-20 bg-gray-100 rounded-lg sm:w-40 sm:h-40">
                                                    <div class="flex flex-col flex-auto">
                                                            <div>
                                                                    <h4 class="font-medium text-gray-900">
                                                                            <a href="#">
                                                                                    ${orderItem.getName()}
                                                                            </a>
                                                                    </h4>
                                                            </div>
                                                            <div class="flex items-end flex-1 mt-6">
                                                                    <dl class="flex space-x-4 text-sm divide-x divide-gray-200 sm:space-x-6">
                                                                            <div class="flex">
                                                                                    <dt class="font-medium text-gray-900">Quantity</dt>
                                                                                    <dd class="ml-2 text-gray-700">
                                                                                            ${orderItem.getQuantity()}
                                                                                    </dd>
                                                                            </div>
                                                                            <div class="flex pl-4 sm:pl-6">
                                                                                    <dt class="font-medium text-gray-900">Price</dt>
                                                                                    <dd class="ml-2 text-gray-700">
                                                                                            ${orderItem.getPrice()}
                                                                                    </dd>
                                                                            </div>
                                                                    </dl>
                                                            </div>
                                                    </div>
                                            </div>
                                        </c:forEach>
                                </section>
                        </div>
                </main>
        </div>
</body>
</html>
