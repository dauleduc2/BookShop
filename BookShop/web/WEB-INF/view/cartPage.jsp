
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
<<<<<<< HEAD
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
                                <c:choose>
                                    <c:when test="${sessionScope.products != null and sessionScope.products.length() > 0}" >

                                        <form
                                            action="<%=Router.CHECKOUT_CONTROLLER%>"
                                            method="POST"
                                            class="mt-12"
                                            >
                                                <section aria-labelledby="cart-heading">
                                                        <h2 id="cart-heading" class="sr-only">
                                                                Items in your shopping cart
                                                        </h2>

                                                        <ul
                                                            role="list"
                                                            class="border-t border-b border-gray-200 divide-y divide-gray-200"
                                                            >

                                                                <c:forEach items="${sessionScope.products}" var="product">
                                                                    <li class="flex py-6">
                                                                            <div class="flex-shrink-0">
                                                                                    <img
                                                                                        src="${product.getImageUrl()}"
                                                                                        alt="Front side of mint cotton t-shirt with wavey lines pattern."
                                                                                        class="
                                                                                        w-24
                                                                                        h-24
                                                                                        rounded-md
                                                                                        object-center object-cover
                                                                                        sm:w-32 sm:h-32
                                                                                        "
                                                                                        />
                                                                            </div>


                                                                            <div class="ml-4 flex-1 flex flex-col sm:ml-6">
                                                                                    <div>
                                                                                            <div class="flex justify-between">
                                                                                                    <h4 class="text-sm">
                                                                                                            <a
                                                                                                                href="#"
                                                                                                                class="font-medium text-gray-700 hover:text-gray-800"
                                                                                                                >
                                                                                                                    ${product.getName()} x${product.getQuantity()}
                                                                                                            </a>
                                                                                                    </h4>
                                                                                                    <p class="ml-4 text-sm font-medium text-gray-900">
                                                                                                            $${product.getPrice()}
                                                                                                    </p>
                                                                                            </div>

                                                                                            <p class="mt-1 text-sm text-gray-500">public date : ${product.getPublishedDate()}</p>
                                                                                    </div>

                                                                                    <div class="mt-4 flex-1 flex items-end justify-end">
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
                                                                            </div>
                                                                    </li>
                                                                </c:forEach>

                                                        </ul>
                                                </section>

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
                                                                                        ${totalPrice}
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
                                                <p class="text-xl text-gray-900 font-medium mt-8">
                                                        There are not item in your cart
=======
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
>>>>>>> dfc7022ac33e660a23e41df7a2d4246d9296c2c6
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
