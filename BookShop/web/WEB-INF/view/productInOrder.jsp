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
                    Shopping Cart
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
                    <div class="mt-5">
                        <label for="receiver" class="block text-sm font-medium text-gray-700">Receiver</label>
                        <div class="mt-1">
                            <input type="text" name="receiver" id="receiver" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                        </div>

                    </div>
                    <div class="mt-5">
                        <label for="phoneNumber" class="block text-sm font-medium text-gray-700">Phone Number</label>
                        <div class="mt-1">
                            <input type="text" name="phoneNumber" id="phoneNumber" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                        </div>
                    </div>
                    <div class="mt-5">
                        <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                        <div class="mt-1">
                            <input type="text" name="address" id="address" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">

                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</body>
</html>
