<%-- 
    Document   : register
    Created on : Oct 10, 2021, 1:25:08 AM
    Author     : Bana-na
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Register" method="POST">
            Email: <input type="text" name="email"> <br> <br>
            ${requestScope.emailError}
            Username: <input type="text" name="username"> <br> <br>
            ${requestScope.usernameError}
            Full name: <input type="text" name="fullName"> <br> <br>
            ${requestScope.fullnameError}
            Password: <input type="password" name="password"> <br> <br>
            ${requestScope.passwordError}
            Confirm Password: <input type="password" name="confirmPassword"> <br> <br>
            ${requestScope.confirmPasswordError}
            <input type="submit" value="submit">
        </form>
    </body>
</html>
