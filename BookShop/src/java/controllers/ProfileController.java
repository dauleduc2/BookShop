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
import utils.GetParam;

@WebServlet(name = "ProfileController", urlPatterns = {"/" + Router.PROFILE_CONTROLLER})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1024, maxFileSize = 1024 * 1024 * 1024, maxRequestSize = 1024 * 1024 * 1024)
public class ProfileController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * method
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO userDao = new UserDAO();
        // validate param
        String fullName = GetParam.getStringParam(request, "fullName", "Full name", 5, 50, null);
        String email = GetParam.getEmailParams(request, "email", "Email");
        String address = GetParam.getStringParam(request, "address", "Address", 5, 500, "");
        String phone = GetParam.getPhoneParams(request, "phone", "Phone number");
        String imageUrl = GetParam.getFileParam(request, "avatar", "Avatar", 1080 * 1080);
        if (fullName == null || email == null || imageUrl == null) {
            return false;
        }
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        userDao.updateUserProfile(userId, fullName, email, address, phone, imageUrl);
        //send success message
        request.setAttribute("successMessage", "Change profile successful.");
        //save avatar url to session
        session = request.getSession();
        session.setAttribute("avatarUrl", imageUrl);

        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
                request.getRequestDispatcher(Router.ME_PAGE).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher(Router.ME_PAGE).forward(request, response);
        } catch (Exception e) {
            // forward on 500
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
