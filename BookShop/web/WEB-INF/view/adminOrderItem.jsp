<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach var="orderItem" items="${requestScope.orderItems}">
            ${orderItem.getProductId()}
            ${orderItem.getQuantity()}
            ${orderItem.getPrice()}
            <br>
        </c:forEach>
    </body>
</html>
