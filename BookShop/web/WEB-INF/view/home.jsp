<%@page import="constant.Router"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="asset/styles.css" type="text/css" />
    <head>
        <jsp:include page="./commonView/Navbar.jsp">
            <jsp:param name="title" value="Sannin SC |  Add Room" />
        </jsp:include>
    </head>
    <body>
        <% String userId = (String) session.getAttribute("userId");
        Integer userRole
                = (Integer) session.getAttribute("userRole");%> <%=userId%> <%=userRole%>
                <a href="<%=Router.PROFILE_CONTROLLER%>">Your Profile</a>
    </body>
</html>
