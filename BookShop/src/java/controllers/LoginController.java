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
import models.User;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "LoginController", urlPatterns = {"/" + Router.LOGIN_CONTROLLER})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO userDao = new UserDAO();

        // validate param
        String username = GetParam.getStringParam(request, "username", "Username", 5, 50, null);
        String password = GetParam.getStringParam(request, "password", "Password", 5, 50, null);

        if (username == null || password == null) {
            return false;
        }

        // checking exist user and correct password
        User existedUser = userDao.getUserByUsername(username);
        if (existedUser == null || !existedUser.getPassword().equals(password)) {
            request.setAttribute("errorMessage", "Username or password is not correct");
            return false;
        }

        // handle on login
        HttpSession session = request.getSession();
        session.setAttribute("userId", existedUser.getUserId());
        session.setAttribute("userRole", existedUser.getRoleId());
        session.setAttribute("avatarUrl", existedUser.getAvatar());
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (Helper.isLogin(request)) {
            request.setAttribute("errorMessage",
                    "You have already login before, do you want to login to other account");
        }
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(Router.LOGIN_PAGE).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.LOGIN_PAGE).forward(request, response);
                return;
            }
            // forward on 200
            response.sendRedirect(Router.HOME_CONTROLLER);
        } catch (Exception e) {
            // forward on 500
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
