<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>BookShop Login</title>
        <link rel="stylesheet" href="asset/styles.css" type="text/css" />

    </head>
</head>
<body class="h-screen flex flex-col">
    <jsp:include page="./commonView/Navbar.jsp">
        <jsp:param name="title" value="Sannin SC |  Add Room" />
    </jsp:include>
    <div class="bg-white flex-1">
        <main class="flex-1 h-full">
            <div class="flex flex-col h-full border-b border-gray-200 lg:border-0">
                <div class="relative h-full">
                    <div
                        aria-hidden="true"
                        class="hidden absolute w-1/2 h-full bg-gray-100 lg:block"
                        ></div>
                    <div class="relative bg-gray-100 lg:bg-transparent">
                        <div
                            class="
                            max-w-7xl
                            mx-auto
                            px-4
                            sm:px-6
                            lg:px-8 lg:grid lg:grid-cols-2
                            "
                            >
                            <div class="max-w-2xl mx-auto py-24 lg:py-64 lg:max-w-none">
                                <div class="lg:pr-16">
                                    <h1
                                        class="
                                        text-4xl
                                        font-extrabold
                                        tracking-tight
                                        text-gray-900
                                        sm:text-5xl
                                        xl:text-6xl
                                        "
                                        >
                                        Welcome to BFF site
                                    </h1>
                                    <p class="mt-4 text-xl text-gray-600">
                                        Find out the best choice for you as you want with
                                        thoughsand different book, different category in different
                                        country
                                    </p>
                                    <div class="mt-6">
                                        <a
                                            href="<%=Router.HOME_CONTROLLER%>"
                                            class="
                                            inline-block
                                            bg-indigo-600
                                            border border-transparent
                                            py-3
                                            px-8
                                            rounded-md
                                            font-medium
                                            text-white
                                            hover:bg-indigo-700
                                            "
                                            >Go Shopping Now</a
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div
                        class="
                        w-full
                        h-48
                        sm:h-64
                        lg:absolute lg:top-0 lg:right-0 lg:w-1/2 lg:h-full
                        "
                        >
                        <img
                            src="https://tailwindui.com/img/ecommerce-images/home-page-02-hero-half-width.jpg"
                            alt=""
                            class="w-full h-full object-center object-cover"
                            />
                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
