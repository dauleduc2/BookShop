
<%@page import="constant.Router"%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
    ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
%>


<%!
    public void increaseQuantity(HttpSession session, ArrayList<Product> products, int index) {
        products.get(index).setQuantity(products.get(index).getQuantity() + 1);
        session.setAttribute("products", products);
    }

    public void decreaseQuantity(HttpSession session, ArrayList<Product> products, int index) {
        int newQuantity = products.get(index).getQuantity() - 1;
        if (newQuantity == 0) {
            products.remove(index);
        } else {
            products.get(index).setQuantity(products.get(index).getQuantity() - 1);
        }
        session.setAttribute("products", products);

    }
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
            <div class="max-w-2xl mx-auto py-16 px-4 sm:py-24 sm:px-6 lg:px-0">
                <h1
                    class="
                    text-3xl
                    font-extrabold
                    text-center
                    tracking-tight
                    text-gray-900
                    sm:text-4xl
                    "
                    >
                    Shopping Cart
                </h1>

                <form action="<%=Router.CHECKOUT_CONTROLLER%>" method="POST" class="mt-12">
                    <section aria-labelledby="cart-heading">
                        <h2 id="cart-heading" class="sr-only">
                            Items in your shopping cart
                        </h2>

                        <ul
                            role="list"
                            class="border-t border-b border-gray-200 divide-y divide-gray-200"
                            >
                            <c:forEach items="${sessionScope.products}" var="product" varStatus="loop" >
                                <li class="flex py-6">
                                    <div class="flex-shrink-0">
                                        <img
                                            src="${product.getImageUrl()}"
                                            alt="Front side of mint cotton t-shirt with wavey lines pattern."
                                            class="
                                            w-20
                                            h-20
                                            rounded-md
                                            object-center object-cover
                                            sm:w-20 sm:h-20
                                            "
                                            />
                                    </div>

                                    <div class="ml-4 flex-1 flex flex-col sm:ml-6">
                                        <div>
                                            <div class="flex justify-between">
                                                <h4 class="text-sm">
                                                    <a
                                                        href="#"
                                                        class="
                                                        font-medium
                                                        text-gray-700
                                                        hover:text-gray-800
                                                        "
                                                        >
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
                                            <div class="flex justify-between w-full custom-number-input mt-5 h-10 ">
                                                <div class="flex flex-row h-10 w-full rounded-lg relative bg-transparent ">
                                                    <button  type="button"   data-action="decrement" class="text-center bg-gray-100 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-10 rounded-l cursor-pointer outline-none">
                                                        <span class="m-auto text-2xl font-thin">−</span>
                                                    </button>
                                                    <div  class="px-5  focus:outline-none text-center  bg-gray-100 font-semibold text-md hover:text-black focus:text-black  md:text-basecursor-default flex items-center text-gray-700  outline-none" name="custom-input-number" >${product.getQuantity()}</div>
                                                    <button  type="button"  data-action="increment" class="text-center bg-gray-100 text-gray-600 hover:text-gray-700 hover:bg-gray-400 h-full w-10 rounded-r cursor-pointer">
                                                        <span class="m-auto text-2xl font-thin">+</span>
                                                    </button>
                                                </div>
                                                <div class="ml-4">
                                                    <a
                                                        href="<%=Router.REMOVE_PRODUCT_CONTROLLER%>?productId=${product.getProductId()}"
                                                        class="
                                                        text-sm
                                                        font-medium
                                                        text-indigo-600
                                                        hover:text-indigo-500
                                                        "
                                                        >
                                                        <span>Remove</span>
                                                    </a>
                                                </div>
                                            </div>

                                            <div class="mt-4 flex-1 flex items-end justify-end">

                                            </div>
                                        </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </section>
                    <div >
                        <h3 class="text-lg font-semibold leading-6  text-gray-900 mt-5">Shipment detail</h3>
                        <div class="mt-5">
                            <label for="receiver" class="block text-sm font-medium text-gray-700">Receiver</label>
                            <div class="mt-1">
                                <input   type="text" name="receiver" id="receiver" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"  >
                            </div>

                        </div>
                        <div class="mt-5">
                            <label for="phoneNumber" class="block text-sm font-medium text-gray-700">Phone Number</label>
                            <div class="mt-1">
                                <input   type="text" name="phoneNumber" id="phoneNumber" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"  >
                            </div>
                        </div>
                        <div class="mt-5">
                            <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                            <div class="mt-1">
                                <input type="text" name="address" id="address" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"  >
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
                                            <c:set
                                                var="totalPrice"
                                                value="${totalPrice + product.getPrice()*product.getQuantity()}"
                                                />
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
                            <button
                                type="submit"
                                class="
                                w-full
                                bg-indigo-600
                                border border-transparent
                                rounded-md
                                shadow-sm
                                py-3
                                px-4
                                text-base
                                font-medium
                                text-white
                                hover:bg-indigo-700
                                focus:outline-none
                                focus:ring-2
                                focus:ring-offset-2
                                focus:ring-offset-gray-50
                                focus:ring-indigo-500
                                "
                                >
                                Checkout
                            </button>
                        </div>
                    </section>
                </form>
            </div>
        </div>
    </body>

</html>
