package controllers;

import constant.Router;
import daos.OrderDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "OrderStatusController", urlPatterns = {"/" + Router.ORDER_STATUS_CONTROLLER})
public class OrderStatusController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO orderDao = new OrderDAO();

        // get params
        String orderId = GetParam.getStringParam(request, "orderId", "orderId", 0, 50, null);
        Integer newStatus = GetParam.getIntParams(request, "status", "status", 0, 4, null);

        if (orderId == null || newStatus == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }

        // update status in db
        orderDao.updateOrderStatus(orderId, newStatus);
        return true;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!processRequest(request, response)) {
                // forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            response.sendRedirect(Router.ADMIN_ORDER_CONTROLLER);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
