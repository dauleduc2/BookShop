<%-- 
    Document   : searchPage
    Created on : Nov 18, 2021, 3:22:35 PM
    Author     : Admin
--%>

<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form  action="<%=Router.SEARCH_BOOK_CONTROLLER %>"
               method="POST" >
            <input name="name" />
            <input type="submit"
                   value="Save" />
        </form>

    </body>
</html>
