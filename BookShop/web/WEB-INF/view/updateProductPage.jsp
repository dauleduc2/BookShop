<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.CategoryDAO"%>
<%@page import="constant.Router"%>
<%@page import="models.Category" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>JSP Page</title>
        <link rel="stylesheet" href="asset/styles.css" type="text/css" />
        <jsp:include page="./commonView/Navbar.jsp">
            <jsp:param name="title" value="Sannin SC |  Add Room" />
        </jsp:include>
    </head>
    <body class="min-h-screen bg-gradient-to-b from-gray-200 to-gray-300">
        <% CategoryDAO ct = new CategoryDAO();
            ArrayList<Category> list
                    = ct.getAllCategory();

        %>
        <form action="<%=Router.UPDATE_PRODUCT_CONTROLLER%>" method="POST" enctype="multipart/form-data" class="max-w-2xl p-2 m-auto my-5 space-y-8 bg-white border-2 border-black divide-y divide-gray-200 rounded-md lg:p-7">
            <%
                Product product = (Product) request.getAttribute("product");
                request.setAttribute("productId", product.getProductId());
            %>
            <div class="space-y-8 divide-y divide-gray-200 sm:space-y-5">
                <div>
                    <div class="mb-3">
                        <h3 class="text-lg font-medium leading-6 text-gray-900">
                            Update product
                        </h3>
                        <p class="max-w-2xl mt-1 text-sm text-gray-500">
                            Change anything you want to update product infomation in the store
                        </p>
                    </div>
                    <div class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                        <label for="name" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                            Name
                        </label>
                        <div class="mt-1 sm:mt-0 sm:col-span-2">
                            <input value="${requestScope.product.getName()}" type="text" name="name" id="name" autocomplete="name" class="block w-full max-w-lg border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm" />
                            <p class="mt-1 text-sm text-red-600" id="email-error">
                                ${requestScope.nameError}
                            </p>
                        </div>
                    </div>
                    <div class="mt-6 space-y-6 sm:mt-5 sm:space-y-5">
                        <div class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                            <label for="price" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                                Price
                            </label>
                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                <div class="flex max-w-lg rounded-md shadow-sm">
                                    <input value="${requestScope.product.getPrice()}" type="number" name="price" id="price" autocomplete="price" class="flex-1 block w-full min-w-0 border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" />
                                </div>
                                <p class="mt-1 text-sm text-red-600" id="email-error">
                                    ${requestScope.priceError}
                                </p>
                            </div>
                        </div>
                        <div class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                            <label for="quantity" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                                Quantity
                            </label>
                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                <div class="flex max-w-lg rounded-md shadow-sm">
                                    <input value="${requestScope.product.getQuantity()}" type="number" name="quantity" id="quantity" autocomplete="quantity" class="flex-1 block w-full min-w-0 border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" />
                                </div>
                                <p class="mt-1 text-sm text-red-600" id="email-error">
                                    ${requestScope.quantityError}
                                </p>
                            </div>
                        </div>
                        <div class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                            <label for="publishedDate " class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                                Published Date
                            </label>
                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                <div class="flex max-w-lg rounded-md shadow-sm">
                                    <input value="${requestScope.product.getPublishedDate()}" type="date" name="publishedDate " id="publishedDate " autocomplete="publishedDate " class="flex-1 block w-full min-w-0 border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" />
                                </div>
                                <p class="mt-1 text-sm text-red-600" id="email-error">
                                    ${requestScope.publishedDateError}
                                </p>
                            </div>
                        </div>
                        <div class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                            <label for="type" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                                Type
                            </label>
                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                <select id="type" name="type" autocomplete="type" class="block w-full max-w-lg border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:max-w-xs sm:text-sm">

                                    <% for (int i = 0;
                                                i
                                                < list.size();
                                                i++) {%>
                                    <option
                                        value=<%=list.get(i).getCategoryId()%>
                                        >
                                        <%=list.get(i).getName()%>
                                    </option>
                                    <% }%>
                                </select>
                            </div>
                        </div>
                        <div
                            class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-center sm:border-t sm:border-gray-200 sm:pt-5">
                            <label for="photo"
                                   class="block text-sm font-medium text-gray-700">
                                Photo
                            </label>
                            <div
                                class="mt-1 sm:mt-0 sm:col-span-2">
                                <input type="file"
                                       id="productAvatar"
                                       name="productAvatar" />
                                <p class="mt-1 text-sm text-red-600"
                                   id="email-error">
                                    ${requestScope.productAvatarError}
                                </p>
                            </div>
                        </div>
                        <div class=" sm:grid sm:grid-cols-3 sm:gap-4 sm:items-start sm:border-t sm:border-gray-200 sm:pt-5">
                            <label for="description" class="block text-sm font-medium text-gray-700 sm:mt-px sm:pt-2">
                                Description
                            </label>
                            <div class="mt-1 sm:mt-0 sm:col-span-2">
                                <textarea  id="description" name="description" rows="3" placeholder="Write a few sentences about product." class="block w-full max-w-lg border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"></textarea>
                                <p class="mt-1 text-sm text-red-600" id="email-error">
                                    ${requestScope.descriptionError}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pt-5">
                <div class="flex justify-end">
                    <button type="button" class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md shadow-sm hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Cancel
                    </button>
                    <button type="submit" class="inline-flex justify-center px-4 py-2 ml-3 text-sm font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Save
                    </button>
                </div>
            </div>
        </form>
    </body>
</html>