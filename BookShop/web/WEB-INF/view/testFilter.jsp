<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
