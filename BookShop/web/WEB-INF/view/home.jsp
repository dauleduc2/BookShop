<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <link rel="stylesheet" href="asset/styles.css" type="text/css" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <jsp:include page="./commonView/Navbar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
        </head>
        <body>
                <div class="relative bg-gray-900">

                        <div aria-hidden="true" class="absolute inset-0 overflow-hidden">
                                <img src="https://tailwindui.com/img/ecommerce-images/home-page-01-hero-full-width.jpg" alt="" class="w-full h-full object-center object-cover">
                        </div>
                        <div class="relative mx-auto py-32 px-6 flex flex-col items-center text-center sm:py-96 lg:px-0">
                                <h1 class="text-4xl font-extrabold tracking-tight text-white lg:text-6xl">Book Shop</h1>
                                <p class="mt-4 text-xl text-white">Read, Discuss, Inspire from best Book in here</p>
                        </div>
                </div>
                <div class="bg-white">
                        <div class="max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8">
                                <h2 class="text-2xl font-extrabold tracking-tight text-gray-900">New books publish</h2>

                                <div class="mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
                                        <c:forEach var="product" items="${requestScope.products}">
                                            <div class="group relative">
                                                    <div class="w-full min-h-80 bg-gray-200 aspect-w-1 aspect-h-1 rounded-md overflow-hidden group-hover:opacity-75 lg:h-80 lg:aspect-none">
                                                            <img src="https://tailwindui.com/img/ecommerce-images/product-page-01-related-product-01.jpg" alt="Front of men&#039;s Basic Tee in black." class="w-full h-full object-center object-cover lg:w-full lg:h-full">


                                                    </div>
                                                    <div class="mt-4 flex justify-between">
                                                            <div>
                                                                    <h3 class="text-sm text-gray-700">
                                                                            <a href="#" class="font-semibold">
                                                                                    ${product.getName()}
                                                                            </a>
                                                                    </h3>

                                                            </div>
                                                            <p class="text-sm font-medium text-gray-900">$${product.getPrice()}</p>
                                                    </div>
                                            </div>

                                        </c:forEach>


                                        <!-- More products... -->
                                </div>
                        </div>
                </div>

        </body>
</html>
