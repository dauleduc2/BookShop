/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import constant.Router;
import daos.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.User;
import utils.GetParam;

/**
 *
 * @author Bana-na
 */
@WebServlet(name = "PasswordController", urlPatterns = {"/changepassword"})
public class PasswordController extends HttpServlet {

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
        HttpSession session = request.getSession();

        String userId = (String) session.getAttribute("userId");
        User user = new User();

        user = userDao.getUserById(userId);

        String oldPassword = GetParam.getStringParam(request, "oldPassword", "Old Password", 5, 50, null);
        String newPassword = GetParam.getStringParam(request, "newPassword", "New Password", 5, 50, null);
        String confirmNewPw = GetParam.getStringParam(request, "confirmNewPassword", "Confirm New Password", 5, 50, null);

        if (oldPassword == null || newPassword == null || confirmNewPw == null) {
            return false;
        }

        if (!oldPassword.equals(user.getPassword())) {
            request.setAttribute("oldPasswordError", "Old Password Incorrect");
            return false;
        }
        if (!newPassword.equals(confirmNewPw)) {
            request.setAttribute("confirmNewPasswordError", "Confirm Password Incorrect");
            return false;
        }

        userDao.changePassword(userId, newPassword);
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
        request.getRequestDispatcher(Router.CHANGEPASSWORD_PAGE).forward(request, response);
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
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.CHANGEPASSWORD_PAGE).forward(request, response);
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
