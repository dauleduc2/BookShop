<%@page import="daos.UserDAO"%>
<%@page import="models.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String userId = (String)session.getAttribute("userId");
            UserDAO userDao = new UserDAO();
            User user = userDao.getUserById(userId);
        %>
        <form action="me" method="POST">
            Full name: <input type="text" name="fullName" value="<%=user.getFullName()%>">
            ${requestScope.fullNameError} <br><br>
            Email: <input type="text" name="email" value="<%=user.getEmail()%>">
            ${requestScope.emailError} <br><br>
            Address: <input type="text" name="address" value="<%=user.getAddress() == null ? "" : user.getAddress()%>">
            ${requestScope.addressError} <br><br>
            Phone: <input type="text" name="phone" value="<%=user.getPhone() == null ? "" : user.getPhone()%>">
            ${requestScope.phoneError} <br><br>
            Avatar: <input type="text" name="avatar" value="<%=user.getAvatar() == null ? "" : user.getAvatar()%>">
            ${requestScope.avatarError} <br><br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
