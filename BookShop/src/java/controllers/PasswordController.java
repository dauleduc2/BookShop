package controllers;

import constant.Router;
import daos.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.StatusCode;
import models.User;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "PasswordController", urlPatterns = {"/" + Router.CHANGE_PASSWORD_CONTROLLER})
public class PasswordController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO userDao = new UserDAO();
        HttpSession session = request.getSession();

        // get current user
        String userId = (String) session.getAttribute("userId");
        User user = userDao.getUserById(userId);

        // validate params
        String oldPassword = GetParam.getStringParam(request, "oldPassword", "Old Password", 5, 50, null);
        String newPassword = GetParam.getStringParam(request, "newPassword", "New Password", 5, 50, null);
        String confirmNewPassword = GetParam.getStringParam(request, "confirmNewPassword", "Confirm New Password", 5, 50, null);

        // check params
        if (oldPassword == null || newPassword == null || confirmNewPassword == null) {
            return false;
        }

        // check correct password
        if (!oldPassword.equals(user.getPassword())) {
            request.setAttribute("oldPasswordError", "Old Password Incorrect");
            return false;
        }

        // check confirm password
        if (!newPassword.equals(confirmNewPassword)) {
            request.setAttribute("confirmNewPasswordError", "Confirm Password Incorrect");
            return false;
        }

        // check duplicate password
        if (user.getPassword().equals(newPassword)) {
            request.setAttribute("errorMessage", "New password is not different with the current password");
            return false;
        }

        // change password in database
        userDao.changePassword(userId, newPassword);

        // set success message
        request.setAttribute("successMessage", "Change password successful.");
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(Router.CHANGE_PASSWORD_PAGE).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.CHANGE_PASSWORD_PAGE).forward(request, response);
                return;
            }
            // forward on 200
            this.doGet(request, response);
        } catch (Exception e) {
            System.out.println(e);
            // forward on 500
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
