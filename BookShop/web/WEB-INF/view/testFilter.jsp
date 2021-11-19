<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>JSP Page</title>
                <link rel="stylesheet" href="asset/styles.css" type="text/css" />
                <jsp:include page="./commonView/Navbar.jsp">
                    <jsp:param name="title" value="Sannin SC |  Add Room" />
                </jsp:include>
        </head>
        <!--        <body>
                        <form action="<%=Router.FILTER_CONTROLLER%>" method="POST">
                                Category: <input type="text" name="categoryId">
                                <br><br>
                                Min price: <input type="text" name="minPrice">
                                <br><br>
                                Max price: <input type="text" name="maxPrice">
                                <input type="submit" value="submit">
                        </form>
        <c:forEach var="product" items="${requestScope.products}">
            ${product.getProductId()}
            <br>
        </c:forEach>
</body>-->
        <body>
                <div class="bg-white">
                        <div class="max-w-2xl px-0 mx-auto sm:px-6 lg:max-w-7xl lg:px-8 sm:py-24">
                                <form class="flex sm:flex-row flex-col bg-gray-700 sm:p-4 sm:items-end p-4 rounded">
                                        <div class="sm:mr-8">
                                                <label for="category" class="block text-base font-medium text-white">Category</label>
                                                <select id="category" name="location" class="mt-1 block w-full pr-10 py-2 text-base border-gray-300 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm rounded-md">

                                                        <option selected value=''>Select Category</option>
                                                        <option>United States</option>
                                                        <option>Canada</option>
                                                        <option>Mexico</option>
                                                </select>
                                        </div>
                                        <div class="sm:mr-8">
                                                <label for="minPrice" class="block text-base font-medium text-white">Min price</label>
                                                <div class="mt-1">
                                                        <input type="number" name="minPrice" id="minPrice" class="shadow-sm py-2 px-4 focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                                                </div>
                                        </div >
                                        <div class="sm:mr-8">
                                                <label for="maxPrice" class="block text-base font-medium text-white">Max price</label>
                                                <div class="mt-1">
                                                        <input type="number" name="maxPrice" id="maxPrice" class="shadow-sm py-2 px-4 focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
                                                </div>
                                        </div>
                                        <div class="sm:mr-8 sm:mt-0  mt-4 mr-0">
                                                <label class="block text-base font-medium text-white sr-only">Filters</label>
                                                <button type="button" class="items-center px-4 py-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">


                                                        Filters
                                                </button>
                                        </div>

                                </form>
                        </div>

                        <div class="grid grid-cols-1 mt-6 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
                                <c:forEach var="product" items="${requestScope.products}">

                                    <div class="relative group">
                                            <a  href="<%=Router.PRODUCT_DETAIL_CONTROLLER%>?productId=${product.getProductId()}">
                                                    <div class="flex items-center justify-center w-full overflow-hidden bg-gray-100 rounded-md min-h-80 aspect-w-1 aspect-h-1 group-hover:opacity-75 lg:h-80 lg:aspect-none">
                                                            <c:choose>
                                                                <c:when test="${product.getImageUrl() != null}">
                                                                    <img src="${product.getImageUrl()}" alt="${product.getName()}" class="object-cover object-center h-5/6 lg:h-5/6">
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <img src="asset/images/product.png"alt="${product.getName()}" class="object-cover object-center h-5/6 lg:h-5/6">

                                                                </c:otherwise>
                                                            </c:choose>
                                                    </div>
                                                    <div class="flex flex-col justify-between mt-4">
                                                            <div>
                                                                    <h3 class="text-sm text-gray-700">
                                                                            <p class="font-semibold">
                                                                                    ${product.getName()}
                                                                            </p>
                                                                    </h3>

                                                            </div>
                                                            <p class="mt-1 text-sm font-medium text-gray-900">${product.getPrice()} đ</p>
                                                    </div>
                                            </a>
                                    </div>

                                </c:forEach>


                                <!-- More products... -->
                        </div>
                </div>
        </div>
</body>
</html>
