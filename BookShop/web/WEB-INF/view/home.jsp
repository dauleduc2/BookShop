<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            String userId = (String)session.getAttribute("userId");
            Integer userRole = (Integer)session.getAttribute("userRole");
        %>
        <%=userId%>
        <%=userRole%>
    </body>
</html>
