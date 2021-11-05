package controllers;

import constant.Router;
import daos.OrderDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Order;
import utils.Helper;

@WebServlet(name = "CancelOrderController", urlPatterns = {"/" + Router.CANCEL_ORDER_CONTROLLER})
public class CancelOrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        OrderDAO orderDao = new OrderDAO();
        boolean isTrue = false;
        // get current userId
        String userId = (String) session.getAttribute("userId");

        //get orderId
        String orderId = (String) request.getParameter("orderId");

        // get user's orders
        ArrayList<Order> orders = orderDao.getOrdersByUserId(userId);

        //update status on database
        for (Order order : orders) {
            if (order.getOrderId().equals(orderId)) {
                isTrue = true;
                break;
            }
        }

        if (!isTrue) {
            Helper.setAttribute(request, 404, "Not found", "The requested URL was not found on this server");
            return false;
        }

        orderDao.updateOrderStatus(orderId, userId, 4);

        // send to request
        request.setAttribute("orders", orders);
        return isTrue;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!processRequest(request, response)) {
                // forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }

            // forward on 200
            response.sendRedirect(Router.SHOW_ORDERS_CONTROLLER);
        } catch (Exception e) {
            System.out.println(e);
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
