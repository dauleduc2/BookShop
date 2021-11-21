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
                <h1 class="text-3xl font-extrabold tracking-tight text-center text-gray-900 sm:text-4xl">
                    Order hitory detail
                </h1>
                <section aria-labelledby="order-heading" class="mt-10 border-t border-gray-200">
                    <h2 id="order-heading" class="sr-only">Your order</h2>
                    <h3 class="sr-only">Items</h3>
                    <c:forEach var="orderItem" items="${requestScope.orderItems}" varStatus="pos">
                        <div class="flex py-10 space-x-6 border-b border-gray-200">
                            <img src="${orderItem.getImageUrl()}" alt="Glass bottle with black plastic pour top and mesh insert."  class="object-cover object-center rounded-md w-28 sm:w-28 ">
                            <div class="flex flex-col ">
                                <div>
                                    <h4 class="text-xl font-medium text-gray-900">
                                        <a href="#">
                                            ${orderItem.getName()}
                                        </a>
                                    </h4>
                                </div>

                                <div class="flex mt-3">
                                    <dt class="font-medium text-gray-900">Quantity</dt>
                                    <dd class="ml-2 text-gray-700">
                                        ${orderItem.getQuantity()}
                                    </dd>
                                </div>
                                <div class="flex mt-3 ">
                                    <dt class="font-medium text-gray-900">Price</dt>
                                    <dd class="ml-2 text-gray-700">
                                        ${orderItem.getPrice()}đ/ per book
                                    </dd>
                                </div>
                                <div class="flex mt-3 ">
                                    <dt class="font-medium text-gray-900">Total price</dt>
                                    <dd class="ml-2 text-gray-700">
                                        ${orderItem.getPrice()*orderItem.getQuantity()}đ
                                    </dd>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </section>
                <div>
                    <h3 class="mt-5 text-lg font-semibold leading-6 text-gray-900">Shipment detail</h3>
                    <div class="flex mt-5">
                        <p for="receiver" class="block text-sm font-medium text-gray-700">Receiver : ${requestScope.order.getConsigneeName()} </p>
                    </div>
                    <div class="flex mt-5">
                        <p for="phoneNumber" class="block text-sm font-medium text-gray-700">Phone Number: ${requestScope.order.getPhoneNumber()}</p>
                    </div>
                    <div class="flex mt-5">
                        <p for="address" class="block text-sm font-medium text-gray-700">Address : ${requestScope.order.getAddress()}</p>
                    </div>
                </div>
                <!-- Order summary -->
                            <section aria-labelledby="summary-heading" class="mt-10">
                                <h2 id="summary-heading" class="sr-only">Order summary</h2>
                                <div>
                                    <dl class="space-y-4">
                                        <div class="flex items-center justify-between">
                                            <dt class="text-base font-medium text-gray-900">Subtotal</dt>
                                            <dd class="ml-4 text-base font-medium text-gray-900">
                                                <c:set var="totalPrice" value="${0}" />
                                                <c:forEach var="product" items="${requestScope.orderItems}">
                                                    <c:set var="totalPrice" value="${totalPrice + product.getPrice()*product.getQuantity()}" />
                                                </c:forEach>
                                                ${totalPrice}đ
                                            </dd>
                                        </div>
                                    </dl>
                                    <p class="mt-1 text-sm text-gray-500">
                                        Shipping and taxes will be calculated at checkout.
                                    </p>
                                </div>
                            </section>
            </div>

        </main>
    </div>
</body>
</html>
