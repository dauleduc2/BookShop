<%--
    Document   : newjsp
    Created on : Nov 21, 2021, 7:43:45 PM
    Author     : Kaine
--%>
<%@page import="models.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="daos.CategoryDAO"%>
<%@page import="constant.Router"%>
<%@page import="models.Category" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>JSP Page</title>
        </head>
        <body>
                <% CategoryDAO ct = new CategoryDAO();
                        ArrayList<Category> list
                                = ct.getAllCategory();

                %>
                <form action="<%=Router.UPDATE_PRODUCT_CONTROLLER%>?productId=${requestScope.product.getProductId()}" method="POST" enctype="multipart/form-data" >
                        <input type="text" name="name" id="name" autocomplete="name" value="${requestScope.product.getName()}"  />
                        <input value="${requestScope.product.getPrice()}" type="number" name="price" id="price" autocomplete="price"  />
                        <input value="${requestScope.product.getQuantity()}" type="number" name="quantity" id="quantity" autocomplete="quantity"  />
                        <input value="${requestScope.product.getPublishedDate()}" type="date" name="publishedDate " id="publishedDate " autocomplete="publishedDate "  />
                        <select id="type" name="type" autocomplete="type" >
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
                        <input type="file"
                               id="productAvatar"
                               name="productAvatar" />
                        <textarea  id="description" name="description" rows="3" placeholder="Write a few sentences about product."></textarea>
                        <input
                            type="submit"
                            value="Save"
                            >
                </form>

        </body>
</html>
