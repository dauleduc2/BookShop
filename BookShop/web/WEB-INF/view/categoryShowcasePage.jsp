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
        <div class="bg-white">
            <div class="max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:max-w-7xl lg:px-8">
                <h2 class="text-2xl font-extrabold tracking-tight text-gray-900">Book in category</h2>

                <div class="mt-6 grid grid-cols-1 gap-y-10 gap-x-6 sm:grid-cols-2 lg:grid-cols-4 xl:gap-x-8">
                    <c:forEach var="product" items="${requestScope.products}">

                        <div class="group relative">
                            <a  href="<%=Router.PRODUCT_DETAIL_CONTROLLER%>?productId=${product.getProductId()}">
                                <div class="w-full min-h-80 bg-gray-200 aspect-w-1 aspect-h-1 rounded-md overflow-hidden group-hover:opacity-75 lg:h-80 lg:aspect-none">
                                    <c:choose>
                                        <c:when test="${product.getImageUrl() != null}">
                                            <img src="${product.getImageUrl()}" alt="${product.getName()}" class="w-full h-full object-center object-cover lg:w-full lg:h-full">
                                        </c:when>
                                        <c:otherwise>
                                            <img src="asset/images/product.png"alt="${product.getName()}" class="w-full h-full object-center object-cover lg:w-full lg:h-full">

                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="mt-4 flex justify-between">
                                    <div>
                                        <h3 class="text-sm text-gray-700">
                                            <p class="font-semibold">
                                                ${product.getName()}
                                            </p>
                                        </h3>

                                    </div>
                                    <p class="text-sm font-medium text-gray-900">$${product.getPrice()}</p>
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
