package controllers;

import constant.Router;
import daos.UserDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "ProfileController", urlPatterns = {"/" + Router.PROFILE_CONTROLLER})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1024, maxFileSize = 1024 * 1024 * 1024, maxRequestSize = 1024 * 1024
        * 1024)
public class ProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * method
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        UserDAO userDao = new UserDAO();

        // get current user
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        User user = userDao.getUserById(userId);

        // validate params
        String fullName = GetParam.getStringParam(request, "fullName", "Full name", 5, 50, null);
        String email = GetParam.getEmailParams(request, "email", "Email");
        String address = GetParam.getStringParam(request, "address", "Address", 5, 500, "");
        String phone = GetParam.getPhoneParams(request, "phone", "Phone number");
        String imageUrl = GetParam.getFileParam(request, "avatar", "Avatar", 1080 * 1080);

        // check imageUrl and assign to current user's avatar if null
        if (imageUrl == null) {
            imageUrl = user.getAvatar();
        }

        // remove required error message
        if (request.getAttribute("avatarError") != null
                && request.getAttribute("avatarError").toString().contains("required")) {
            request.setAttribute("avatarError", "");
        }

        // check params
        if (fullName == null || email == null) {
            return false;
        }

        // update user to datbase
        userDao.updateUserProfile(userId, fullName, email, address, phone, imageUrl);

<<<<<<< HEAD
        // send success message
=======
        //send success message
>>>>>>> 56609e7c5665bf2f34bf954ec62a071fac00d73a
        request.setAttribute("successMessage", "Change profile successful.");

        // save avatar url to session
        session.setAttribute("avatarUrl", imageUrl == null ? "asset/avatar.png" : imageUrl);
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Helper.sendUserResponse(request);
        } catch (Exception e) {
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
        request.getRequestDispatcher(Router.ME_PAGE).forward(request, response);
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
                this.doGet(request, response);
                return;
            }
            // forward on 200
            this.doGet(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
