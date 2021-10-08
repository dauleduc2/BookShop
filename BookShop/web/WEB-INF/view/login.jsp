<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="LoginController" method="POST">
            Email: <input type="text" name="email">
            ${requestScope.emailError} <br> <br>
            Password: <input type="password" name="password">
            ${requestScope.passwordError}<br> <br>
            <input type="submit" value="submit"> ${requestScope.errorMessage}
        </form>
    </body>
</html>
