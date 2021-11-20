<<<<<<< HEAD
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
<body class="h-screen flex flex-col">
        <jsp:include page="./commonView/Navbar.jsp">
            <jsp:param name="title" value="Sannin SC |  Add Room" />
        </jsp:include>
        <div class="bg-white flex-1">
                <main class="bg-white px-4 pt-16 pb-24 sm:px-6 sm:pt-24 lg:px-8 lg:py-32">
                        <div class="max-w-3xl mx-auto">
                                <div class="max-w-xl">
                                        <dl class="mt-12 text-sm font-medium">
                                                <dt class="text-gray-900">Tracking number</dt>
                                                <dd class="text-indigo-600 mt-2">#15000000245</dd>
                                        </dl>
                                </div>
                                <section aria-labelledby="order-heading" class="mt-10 border-t border-gray-200">
                                        <h2 id="order-heading" class="sr-only">Your order</h2>

                                        <h3 class="sr-only">Items</h3>


                                        <c:forEach var="order" items="${requestScope.orderItems}" varStatus="pos">
                                                <div class="py-10 border-b border-gray-200 flex space-x-6">
                                                        <img src="https://tailwindui.com/img/ecommerce-images/confirmation-page-05-product-01.jpg" alt="Glass bottle with black plastic pour top and mesh insert." class="flex-none w-20 h-20 object-center object-cover bg-gray-100 rounded-lg sm:w-40 sm:h-40">
                                                        <div class="flex-auto flex flex-col">
                                                                <div>
                                                                        <h4 class="font-medium text-gray-900">
                                                                                <a href="#">
                                                                                        Cold Brew Bottle
                                                                                </a>
                                                                        </h4>
                                                                        <p class="mt-2 text-sm text-gray-600">
                                                                                This glass bottle comes with a mesh insert for steeping tea or cold-brewing coffee. Pour from any angle and remove the top for easy cleaning.
                                                                        </p>
                                                                </div>
                                                                <div class="mt-6 flex-1 flex items-end">
                                                                        <dl class="flex text-sm divide-x divide-gray-200 space-x-4 sm:space-x-6">
                                                                                <div class="flex">
                                                                                        <dt class="font-medium text-gray-900">Quantity</dt>
                                                                                        <dd class="ml-2 text-gray-700">
                                                                                                1
                                                                                        </dd>
                                                                                </div>
                                                                                <div class="pl-4 flex sm:pl-6">
                                                                                        <dt class="font-medium text-gray-900">Price</dt>
                                                                                        <dd class="ml-2 text-gray-700">
                                                                                                $32.00
                                                                                        </dd>
                                                                                </div>
                                                                        </dl>
                                                                </div>
                                                        </div>
                                                </div>
                                        </c:forEach>



                                        <div class="sm:ml-40 sm:pl-6">
                                                <h3 class="sr-only">Your information</h3>

                                                <h4 class="sr-only">Addresses</h4>
                                                <dl class="grid grid-cols-2 gap-x-6 text-sm py-10">
                                                        <div>
                                                                <dt class="font-medium text-gray-900">Shipping address</dt>
                                                                <dd class="mt-2 text-gray-700">
                                                                        <address class="not-italic">
                                                                                <span class="block">Kristin Watson</span>
                                                                                <span class="block">7363 Cynthia Pass</span>
                                                                                <span class="block">Toronto, ON N3Y 4H8</span>
                                                                        </address>
                                                                </dd>
                                                        </div>
                                                        <div>
                                                                <dt class="font-medium text-gray-900">Billing address</dt>
                                                                <dd class="mt-2 text-gray-700">
                                                                        <address class="not-italic">
                                                                                <span class="block">Kristin Watson</span>
                                                                                <span class="block">7363 Cynthia Pass</span>
                                                                                <span class="block">Toronto, ON N3Y 4H8</span>
                                                                        </address>
                                                                </dd>
                                                        </div>
                                                </dl>

                                                <h4 class="sr-only">Payment</h4>
                                                <dl class="grid grid-cols-2 gap-x-6 border-t border-gray-200 text-sm py-10">
                                                        <div>
                                                                <dt class="font-medium text-gray-900">Payment method</dt>
                                                                <dd class="mt-2 text-gray-700">
                                                                        <p>Apple Pay</p>
                                                                        <p>Mastercard</p>
                                                                        <p><span aria-hidden="true">•••• </span><span class="sr-only">Ending in </span>1545</p>
                                                                </dd>
                                                        </div>
                                                        <div>
                                                                <dt class="font-medium text-gray-900">Shipping method</dt>
                                                                <dd class="mt-2 text-gray-700">
                                                                        <p>DHL</p>
                                                                        <p>Takes up to 3 working days</p>
                                                                </dd>
                                                        </div>
                                                </dl>

                                                <h3 class="sr-only">Summary</h3>

                                                <dl class="space-y-6 border-t border-gray-200 text-sm pt-10">
                                                        <div class="flex justify-between">
                                                                <dt class="font-medium text-gray-900">Subtotal</dt>
                                                                <dd class="text-gray-700">$36.00</dd>
                                                        </div>
                                                        <div class="flex justify-between">
                                                                <dt class="flex font-medium text-gray-900">
                                                                        Discount
                                                                        <span class="rounded-full bg-gray-200 text-xs text-gray-600 py-0.5 px-2 ml-2">STUDENT50</span>
                                                                </dt>
                                                                <dd class="text-gray-700">-$18.00 (50%)</dd>
                                                        </div>
                                                        <div class="flex justify-between">
                                                                <dt class="font-medium text-gray-900">Shipping</dt>
                                                                <dd class="text-gray-700">$5.00</dd>
                                                        </div>
                                                        <div class="flex justify-between">
                                                                <dt class="font-medium text-gray-900">Total</dt>
                                                                <dd class="text-gray-900">$23.00</dd>
                                                        </div>
                                                </dl>
                                        </div>
                                </section>
                        </div>
                </main>
        </div>
</body>
=======
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="orderItem" items="${requestScope.orderItems}">
            ${orderItem.getName()}
            <br>
            ${orderItem.getImageUrl()}
            <br>
            ${orderItem.getQuantity()}
            <br>
            ${orderItem.getPrice()}
            <br>
        </c:forEach>
    </body>
>>>>>>> d2ee34ef5378c58d710405ddd302e4dad72d9932
</html>
