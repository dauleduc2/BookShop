<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>BFF Shop</title>
        <link rel="stylesheet" href="asset/styles.css" type="text/css" />
       
    </head>
</head>

<body>
    <div class='flex'>
        <jsp:include page="./commonView/adminSideBar.jsp">
            <jsp:param name="title" value="Sannin SC |  Add Room" />
        </jsp:include>
        <div class="flex flex-col items-center justify-center flex-1 h-screen bg-gradient-to-b from-gray-50 to-gray-100">
            <div class="max-w-md m-auto bg-white shadow sm:rounded-lg">
                <div class="px-4 py-5 sm:p-6">
                    <h3 class="text-lg font-medium leading-6 text-gray-900">
                        Add new category
                    </h3>
                    <div class="max-w-xl mt-2 text-sm text-gray-500">
                        <p>Write down a new category you want to add to the store.</p>
                    </div>
                    <form action="<%=Router.ADD_CATEGORY_CONTROLLER%>" method="POST" class="mt-5 sm:flex sm:items-center">
                        <div class="flex flex-col w-full sm:max-w-xs">
                            <label for="category" class="sr-only">Category</label>
                            <input type="text" name="category" id="category" class="block w-full border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm" placeholder="" />
                            <p class="mt-2 text-sm text-red-600" id="email-error">
                                ${requestScope.categoryError}
                            </p>
                        </div>
                        <button type="submit" class="inline-flex items-center justify-center w-full px-4 py-2 mt-3 font-medium text-white bg-indigo-600 border border-transparent rounded-md shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 sm:mt-0 sm:ml-3 sm:w-auto sm:text-sm">
                            Save
                        </button>
                    </form>
                    <p class="mt-2 text-sm text-green-600" id="email-error">
                        ${requestScope.successMessage}
                    </p>
                </div>
            </div>
            
        </div>
    </div>
</div>
</div>
</body>

</html>