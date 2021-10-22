<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Product"%>
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
                <%
                        Product product = (Product) request.getAttribute("product");
                %>
                <div class="bg-white">
                        <div class="max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8 lg:grid lg:grid-cols-2 lg:gap-x-8">
                                <!-- Product details -->
                                <div class="lg:max-w-lg lg:self-end">
                                        <nav aria-label="Breadcrumb">
                                                <ol role="list" class="flex items-center space-x-2">
                                                        <li>
                                                                <div class="flex items-center text-sm">
                                                                        <a href="#" class="font-medium text-gray-500 hover:text-gray-900">
                                                                                Catagory
                                                                        </a>

                                                                        <svg viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="currentColor" aria-hidden="true" class="ml-2 flex-shrink-0 h-5 w-5 text-gray-300">
                                                                        <path d="M5.555 17.776l8-16 .894.448-8 16-.894-.448z" />
                                                                        </svg>
                                                                </div>
                                                        </li>


                                                </ol>
                                        </nav>

                                        <div class="mt-4">
                                                <h1 class="text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl"><%=product.getName()%></h1>
                                        </div>

                                        <section aria-labelledby="information-heading" class="mt-4">
                                                <h2 id="information-heading" class="sr-only">Product information</h2>

                                                <div class="flex items-center">
                                                        <p class="text-lg text-gray-900 sm:text-xl">$${product.getPrice()}</p>
                                                </div>

                                                <div class="mt-4 space-y-6">
                                                        <p class="text-base text-gray-500"></p>
                                                </div>
                                                <div class="flex mt-6">
                                                        <div class="sm:pr-9 mr-4">
                                                                <select id="quantity-0" name="quantity-0" class="max-w-full rounded-md border border-gray-300 py-1.5 text-base leading-5 font-medium text-gray-700 text-left shadow-sm focus:outline-none focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm">
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                                        <option value="4">4</option>
                                                                        <option value="5">5</option>
                                                                        <option value="6">6</option>
                                                                        <option value="7">7</option>
                                                                        <option value="8">8</option>
                                                                </select>
                                                        </div>
                                                        <div class="flex items-center">
                                                                <c:choose>
                                                                        <c:when test="${product.getQuantity() > 0}">
                                                                                <!-- Heroicon name: solid/check -->
                                                                                <svg class="flex-shrink-0 w-5 h-5 text-green-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                                                                <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                                                                                </svg>
                                                                                <p class="ml-2 text-sm text-gray-500">In stock and ready to ship</p>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                                <p class="ml-2 text-sm text-gray-500">This product is out stock</p>
                                                                        </c:otherwise>
                                                                </c:choose>
                                                        </div>
                                                </div>
                                        </section>
                                </div>

                                <!-- Product image -->
                                <div class="mt-10 lg:mt-0 lg:col-start-2 lg:row-span-2 lg:self-center">
                                        <div class="aspect-w-1 aspect-h-1 rounded-lg overflow-hidden">
                                                <img src="https://tailwindui.com/img/ecommerce-images/product-page-04-featured-product-shot.jpg" alt="Model wearing light green backpack with black canvas straps and front zipper pouch." class="w-full h-full object-center object-cover">
                                        </div>
                                </div>

                                <!-- Product form -->
                                <div class="mt-10 lg:max-w-lg lg:col-start-1 lg:row-start-2 lg:self-start">
                                        <section aria-labelledby="options-heading">
                                                <h2 id="options-heading" class="sr-only">Product options</h2>

                                                <form>


                                                        <div class="mt-10">
                                                                <button type="submit" class="w-full bg-indigo-600 border border-transparent rounded-md py-3 px-8 flex items-center justify-center text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-gray-50 focus:ring-indigo-500">Add to bag</button>
                                                        </div>
                                                        <div class="mt-6 text-center">
                                                                <a href="#" class="group inline-flex text-base font-medium">
                                                                        <!-- Heroicon name: outline/shield-check -->
                                                                        <svg class="flex-shrink-0 mr-2 h-6 w-6 text-gray-400 group-hover:text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
                                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                                                                        </svg>
                                                                        <span class="text-gray-500 hover:text-gray-700">Lifetime Guarantee</span>
                                                                </a>
                                                        </div>
                                                </form>
                                        </section>
                                </div>
                        </div>
                </div>
        </body>
</html>
