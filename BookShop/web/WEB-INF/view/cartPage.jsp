<%-- Document : cartPage Created on : Oct 26, 2021, 5:07:26 PM Author : Admin
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                <form class="mt-12">
                    <section aria-labelledby="cart-heading">
                        <h2 id="cart-heading" class="sr-only">
                            Items in your shopping cart
                        </h2>

                        <ul
                            role="list"
                            class="border-t border-b border-gray-200 divide-y divide-gray-200"
                            >
                            <li class="flex py-6">
                                <div class="flex-shrink-0">
                                    <img
                                        src="https://tailwindui.com/img/ecommerce-images/checkout-page-03-product-04.jpg"
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
                                                    Artwork Tee x 2
                                                </a>
                                            </h4>
                                            <p class="ml-4 text-sm font-medium text-gray-900">
                                                $32.00
                                            </p>
                                        </div>
                                        <p class="mt-1 text-sm text-gray-500">Mint</p>
                                        <p class="mt-1 text-sm text-gray-500">Medium</p>
                                    </div>

                                    <div class="mt-4 flex-1 flex items-end justify-end">
                                        <div class="ml-4">
                                            <button
                                                type="button"
                                                class="
                                                text-sm
                                                font-medium
                                                text-indigo-600
                                                hover:text-indigo-500
                                                "
                                                >
                                                <span>Remove</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </li>
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
                                        $96.00
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
