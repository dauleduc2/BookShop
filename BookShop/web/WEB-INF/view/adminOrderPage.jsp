<%@page import="constant.Router"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="order" items="${requestScope.orders}">
            <form action="<%=Router.ADMIN_ORDER_CONTROLLER%>?orderId=${order.getOrderId()}" method="POST">
                <button type="submit" class="items-center px-4 py-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white w-full bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    ${order.getCreatedDate()}  ${order.getStatus()}  ${order.getOrderId()}
                    <br> <br>
                </button>
            </form>
        </c:forEach>
    </body>
</html>
