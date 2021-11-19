package controllers;

import constant.Router;
import daos.OrderDAO;
import daos.OrderItemDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;
import models.OrderItem;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "OrderController", urlPatterns = {"/" + Router.ADMIN_ORDER_CONTROLLER})
public class OrderController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> methods.
     */
    protected void getHandler(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO orderDao = new OrderDAO();

        // get order list
        ArrayList<Order> orders = orderDao.getAllOrder();
        request.setAttribute("orders", orders);
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            getHandler(request, response);
            request.getRequestDispatcher(Router.ADMIN_ORDER_PAGE).forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

    /**
     * Processes requests for both HTTP <code>POST</code> methods.
     */
    protected boolean postHandler(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        OrderItemDAO orderItemDao = new OrderItemDAO();

        // get orderId
        String orderId = GetParam.getStringParam(request, "orderId", "orderId", 0, 50, null);

        // get order items
        ArrayList<OrderItem> orderItems = orderItemDao.getOrderItemByOrderId(orderId);
        if (orderItems.isEmpty()) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }

        request.setAttribute("orderItems", orderItems);
        return true;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!postHandler(request, response)) {
                // forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher(Router.ADMIN_ORDERITEM_PAGE).forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
