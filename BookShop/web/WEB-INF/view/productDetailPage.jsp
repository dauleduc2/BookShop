<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

        <head>
                <link rel="stylesheet" href="./styles.css" type="text/css" />
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <jsp:include page="./commonView/Navbar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
                <title>JSP Page</title>
        </head>

        <body>
                <div class="bg-white">
                        <div class="flex flex-col-reverse max-w-2xl px-4 py-16 mx-auto sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8 lg:grid lg:grid-cols-2 lg:gap-x-8">
                                <!-- Product details -->
                                <div class="flex flex-col w-full">
                                        <div class="lg:max-w-lg lg:self-start">
                                                <div class="mt-4">
                                                        <h1 class="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl">
                                                                ${requestScope.product.getName()}
                                                        </h1>
                                                </div>

                                                <section aria-labelledby="information-heading" class="mt-4">
                                                        <h2 id="information-heading" class="sr-only">Product information</h2>

                                                        <div class="flex items-center">
                                                                <p class="text-lg font-semibold text-gray-900 sm:text-2xl">
                                                                        $${requestScope.product.getPrice()}
                                                                </p>
                                                        </div>

                                                        <div class="mt-4 space-y-6">
                                                                <p class="text-base text-justify text-gray-500">
                                                                        ${requestScope.product.getDescription()}
                                                                </p>
                                                        </div>
                                                        <div class="flex flex-col mt-6">
                                                                <form class="flex flex-col" method="POST" action="<%=Router.PRODUCT_DETAIL_CONTROLLER%>?productId=${requestScope.product.getProductId()}">

                                                                        <input class="hidden" value="${requestScope.product.getDescription()}" readonly/>
                                                                        <label for="quantity" class="text-sm font-medium text-gray-700">Quantity</label
                                                                        >
                                                                        <input
                                                                            min="1"
                                                                            max="${requestScope.product.getQuantity()}"
                                                                            value="1"
                                                                            id="quantity"
                                                                            name="quantity"
                                                                            type="number"
                                                                            class="flex w-4/5 px-3 py-2 placeholder-gray-400 border border-gray-300 rounded-md shadow-sm appearance-none sm:w-16 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
                                                                            />
                                                                        <button class="hiddent" id="submitform" type="submit"></button>
                                                                </form>
                                                                <div class="flex items-center mt-4">
                                                                        <c:choose>
                                                                            <c:when test="${requestScope.product.getQuantity() > 0}">
                                                                                <!-- Heroicon name: solid/check -->
                                                                                <div class="flex items-center">
                                                                                        <svg
                                                                                            class="flex-shrink-0 w-5 h-5 text-green-500"
                                                                                            xmlns="http://www.w3.org/2000/svg"
                                                                                            viewBox="0 0 20 20"
                                                                                            fill="currentColor"
                                                                                            aria-hidden="true"
                                                                                            >
                                                                                                <path
                                                                                                    fill-rule="evenodd"
                                                                                                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                                                                                                    clip-rule="evenodd"
                                                                                                    />
                                                                                        </svg>
                                                                                        <p class="ml-2 text-lg text-gray-500">
                                                                                                In stock and ready to ship
                                                                                        </p>
                                                                                </div>
                                                                            </c:when>
                                                                            <c:when test="${requestScope.product.getQuantity() <= 0}">
                                                                                <p class="ml-2 text-lg text-gray-500">
                                                                                        This product is out stock
                                                                                </p>
                                                                            </c:when>
                                                                        </c:choose>
                                                                </div>

                                                        </div>
                                                </section>
                                        </div>
                                        <p class="mt-2 text-lg font-semibold text-green-600" id="successMessage">
                                                ${requestScope.successMessage}
                                        </p>
                                        <div class="mt-16 lg:max-w-lg lg:col-start-1 lg:row-start-2 lg:self-start">
                                                <section aria-labelledby="options-heading">
                                                        <h2 id="options-heading" class="sr-only">Product options</h2>

                                                        <form>
                                                                <div class="">

                                                                        <label
                                                                            for="submitform"
                                                                            class="flex items-center justify-center w-full px-8 py-3 text-base font-medium text-white bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500"
                                                                            >
                                                                                Add to bag
                                                                        </label>
                                                                </div>
                                                                <div class="mt-6 text-center">
                                                                        <a href="#" class="inline-flex text-base font-medium group">
                                                                                <!-- Heroicon name: outline/shield-check -->
                                                                                <svg class="flex-shrink-0 w-6 h-6 mr-2 text-gray-400 group-hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                                                                        <path
                                                                                            stroke-linecap="round"
                                                                                            stroke-linejoin="round"
                                                                                            stroke-width="2"
                                                                                            d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"
                                                                                            />
                                                                                </svg>
                                                                                <span class="text-gray-500 hover:text-gray-700">Lifetime Guarantee</span
                                                                                >
                                                                        </a>
                                                                </div>
                                                        </form>
                                                </section>
                                        </div>
                                </div>
                                <!-- Product image -->
                                <div class="mt-10 lg:mt-0 lg:col-start-2 lg:row-span-2 lg:self-center">
                                        <div class="overflow-hidden rounded-lg aspect-w-1 aspect-h-1">
                                                <c:choose>
                                                    <c:when test="${requestScope.product.getImageUrl() != null}">
                                                        <img
                                                            src="${requestScope.product.getImageUrl()}"
                                                            alt="${requestScope.product.getName()}"
                                                            class="object-cover object-center w-full h-full"
                                                            />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img
                                                            src="asset/images/product.png"
                                                            alt="${requestScope.product.getName()}"
                                                            class="object-cover object-center w-full h-full"
                                                            />
                                                    </c:otherwise>
                                                </c:choose>
                                        </div>
                                </div>
                                <!-- Product form -->
                        </div>
                </div>
        </body>
</html>