/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import constant.Router;
import daos.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Order;
import utils.Helper;

/**
 *
 * @author Bana-na
 */
@WebServlet(name = "CancelOrderController", urlPatterns = {"/" + Router.CANCEL_ORDER_CONTROLLER})
public class CancelOrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        OrderDAO orderDao = new OrderDAO();

        // get current userId
        String userId = (String) session.getAttribute("userId");

        //get orderId
        String orderId = (String) request.getParameter("orderId");

        //update status on database
        if (orderDao.updateOrderStatus(orderId, userId, 4)) {
            return;
        }

        // get user's orders
        ArrayList<Order> orders = orderDao.getOrdersByUserId(userId);

        // send to request
        request.setAttribute("orders", orders);
        return;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
            // forward on 200
            request.getRequestDispatcher(Router.SHOW_ORDERS_PAGE).forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
