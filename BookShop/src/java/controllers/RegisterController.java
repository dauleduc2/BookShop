package controllers;

import constant.Router;
import daos.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.User;
import utils.GetParam;

@WebServlet(name = "RegisterController", urlPatterns = {"/Register"})
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO userDao = new UserDAO();

        //Validate param
        String email = GetParam.getEmailParams(request, "email", "Email");
        String username = GetParam.getStringParam(request, "username", "Username", 5, 50, null);
        String fullName = GetParam.getStringParam(request, "fullName", "Full name", 5, 50, null);
        String password = GetParam.getStringParam(request, "password", "Password", 5, 50, null);
        String confirmPassword = GetParam.getStringParam(request, "confirmPassword", "Confirm Password", 5, 50, null);

        if (email == null || username == null || password == null || confirmPassword == null || fullName == null) {
            return false;
        }

        //Checking User existed or not
        User existedUsername = userDao.getUserByUsername(username);
        User existedEmail = userDao.getUserByEmail(email);

        if (existedUsername != null) {
            request.setAttribute("usernameError", "Username was used");
            return false;
        }
        if (existedEmail != null) {
            request.setAttribute("emailError", "Email was used");
            return false;
        }

        //Checking confirm password is correct
        if (!password.equals(confirmPassword)) {
            request.setAttribute("confirmPasswordError", "Confirm password is not correct");
            return false;
        }

        //
        User user = new User(0, username, fullName, email, password);
        userDao.addNewUser(user);
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher(Router.REGISTER_PAGE).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.REGISTER_PAGE).forward(request, response);
                return;
            }
            // forward on 200
            response.sendRedirect(Router.LOGIN_CONTROLLER);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e.getMessage());
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
