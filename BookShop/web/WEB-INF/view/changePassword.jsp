<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="changepassword" method="POST">
            Old Password: <input type="password" name="oldPassword"> <br><br>
            New Password: <input type="password" name="newPassword"> <br><br>
            Confirm New Password: <input type="password" name="confirmNewPassword"> <br><br>
            <input type="submit" value="submit"><br>
            ${requestScope.oldPasswordErrorInput}
            ${requestScope.newPasswordErrorInput}
            ${requestScope.confirmNewPasswordErrorInput}
        </form>
    </body>
</html>
