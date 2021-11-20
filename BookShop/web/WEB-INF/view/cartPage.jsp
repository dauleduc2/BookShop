<%@page import="constant.Router"%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
    ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
%>

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
        <div class="bg-white">
            <div class="max-w-2xl px-4 py-16 mx-auto sm:py-24 sm:px-6 lg:px-0">
                <h1 class="text-3xl font-extrabold tracking-tight text-center text-gray-900 sm:text-4xl">
                    Shopping Cart
                </h1>
                <c:choose>
                    <c:when test="${sessionScope.products != null and sessionScope.products.size() > 0}">
                        <form action="<%=Router.CHECKOUT_CONTROLLER%>" method="POST" class="mt-12">
                            <section aria-labelledby="cart-heading">
                                <h2 id="cart-heading" class="sr-only">
                                    Items in your shopping cart
                                </h2>
                                <ul role="list" class="border-t border-b border-gray-200 divide-y divide-gray-200">
                                    <c:forEach items="${sessionScope.products}" var="product" varStatus="loop">
                                        <li class="flex py-6">
                                            <div class="flex-shrink-0">
                                                <img src="${product.getImageUrl()}" alt="${product.getName()}" class="object-cover object-center w-20 h-20 rounded-md sm:w-20 sm:h-20" />
                                            </div>

                                            <div class="flex flex-col flex-1 ml-4 sm:ml-6">
                                                <div>
                                                    <div class="flex justify-between">
                                                        <h4 class="text-sm">
                                                            <a href="#" class="font-medium text-gray-700 hover:text-gray-800">
                                                                ${product.getName()}
                                                            </a>
                                                        </h4>
                                                        <p class="ml-4 text-sm font-medium text-gray-900">
                                                            ${product.getPrice()}
                                                        </p>
                                                    </div>

                                                    <p class="mt-1 text-sm text-gray-500">
                                                        public date : ${product.getPublishedDate()}
                                                    </p>
                                                    <div class="flex justify-between w-full h-10 mt-5 custom-number-input ">
                                                        <div class="relative flex flex-row w-full h-10 bg-transparent rounded-lg ">
                                                            <a href="<%=Router.CHANGE_QUANTITY_CONTROLLER%>?productIndex=${loop.index}&isIncreased=0" type="button" data-action="increment" class="w-10 h-full text-center text-gray-600 bg-gray-100 rounded-r cursor-pointer hover:text-gray-700 hover:bg-gray-400">
                                                                <span class="m-auto text-2xl font-thin">-</span>
                                                            </a>
                                                            <div class="flex items-center px-5 font-semibold text-center text-gray-700 bg-gray-100 outline-none focus:outline-none text-md hover:text-black focus:text-black md:text-basecursor-default" name="custom-input-number">${product.getQuantity()}</div>
                                                            <a href="<%=Router.CHANGE_QUANTITY_CONTROLLER%>?productIndex=${loop.index}&isIncreased=1" type="button" data-action="increment" class="w-10 h-full text-center text-gray-600 bg-gray-100 rounded-r cursor-pointer hover:text-gray-700 hover:bg-gray-400">
                                                                <span class="m-auto text-2xl font-thin">+</span>
                                                            </a>
                                                        </div>
                                                        <div class="ml-4">
                                                            <a href="<%=Router.REMOVE_PRODUCT_CONTROLLER%>?productId=${product.getProductId()}" class="text-sm font-medium text-indigo-600 hover:text-indigo-500">
                                                                <span>Remove</span>
                                                            </a>
                                                        </div>
                                                    </div>

                                                    <div class="flex items-end justify-end flex-1 mt-4">

                                                    </div>
                                                </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </section>
                            <div>
                                <h3 class="mt-5 text-lg font-semibold leading-6 text-gray-900">Shipment detail</h3>
                                <div class="mt-5">
                                    <label for="receiver" class="block text-sm font-medium text-gray-700">Receiver</label>
                                    <div class="mt-1">
                                        <input type="text" name="receiver" id="receiver" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        <p class="mt-2 text-sm text-red-600" id="email-error">
                                            ${requestScope.receiverError}
                                        </p>
                                    </div>

                                </div>
                                <div class="mt-5">
                                    <label for="phoneNumber" class="block text-sm font-medium text-gray-700">Phone Number</label>
                                    <div class="mt-1">
                                        <input type="text" name="phoneNumber" id="phoneNumber" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        <p class="mt-2 text-sm text-red-600" id="email-error">
                                            ${requestScope.phoneNumberError}
                                        </p>
                                    </div>
                                </div>
                                <div class="mt-5">
                                    <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                                    <div class="mt-1">
                                        <input type="text" name="address" id="address" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                        <p class="mt-2 text-sm text-red-600" id="email-error">
                                            ${requestScope.addressError}
                                        </p>
                                    </div>
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
                                                <c:forEach var="product" items="${sessionScope.products}">
                                                    <c:set var="totalPrice" value="${totalPrice + product.getPrice()*product.getQuantity()}" />
                                                </c:forEach>
                                                $${totalPrice}
                                            </dd>
                                        </div>
                                    </dl>
                                    <p class="mt-1 text-sm text-gray-500">
                                        Shipping and taxes will be calculated at checkout.
                                    </p>
                                </div>

                                <div class="mt-10">
                                    <button type="submit" class="w-full px-4 py-3 text-base font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500">
                                        Checkout
                                    </button>
                                </div>
                            </section>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <div class="flex flex-col items-center mt-8">
                            <div>
                                <svg width="256" height="256" viewBox="0 0 256 256" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M33.814 79.3633L128 133.87L221.547 79.6829" stroke="#292D32" stroke-width="8" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M128 230.508V133.762" stroke="#292D32" stroke-width="8" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M230.507 97.8121V158.186C230.507 158.719 230.507 159.145 230.4 159.679C222.934 153.172 213.334 149.332 202.667 149.332C192.64 149.332 183.36 152.852 176 158.719C166.187 166.506 160 178.559 160 191.999C160 199.999 162.24 207.572 166.187 213.972C167.147 215.679 168.32 217.279 169.6 218.772L150.08 229.546C137.92 236.372 118.08 236.372 105.92 229.546L48.9601 197.972C36.0535 190.826 25.4937 172.906 25.4937 158.186V97.8121C25.4937 83.0921 36.0535 65.1723 48.9601 58.0256L105.92 26.452C118.08 19.6254 137.92 19.6254 150.08 26.452L207.04 58.0256C219.947 65.1723 230.507 83.0921 230.507 97.8121Z" stroke="#292D32" stroke-width="8" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M245.333 191.999C245.333 199.999 243.093 207.572 239.147 213.972C236.907 217.812 234.027 221.225 230.72 223.999C223.253 230.719 213.44 234.665 202.667 234.665C187.093 234.665 173.547 226.345 166.187 213.972C162.24 207.572 160 199.999 160 191.999C160 178.559 166.187 166.505 176 158.719C183.36 152.852 192.64 149.332 202.667 149.332C226.24 149.332 245.333 168.425 245.333 191.999Z" stroke="#292D32" stroke-width="8" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M214.08 203.089L191.466 180.582" stroke="#292D32" stroke-width="8" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                <path d="M213.866 180.902L191.253 203.409" stroke="#292D32" stroke-width="8" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </div>
                            <p class="mt-8 text-xl font-medium text-gray-900">
                                There are not item in your cart
                            </p>
                            <a href="home" class="inline-flex items-center px-6 py-3 mt-8 text-base font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Buy now</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
    </body>

</html>