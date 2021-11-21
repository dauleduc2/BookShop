package controllers;

import constant.Router;
import daos.OrderDAO;
import daos.OrderItemDAO;
import daos.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Order;
import models.OrderItem;
import models.Product;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "OrderStatusController", urlPatterns = {"/" + Router.ORDER_STATUS_CONTROLLER})
public class OrderStatusController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected Integer processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO orderDao = new OrderDAO();

        // get params
        String orderId = GetParam.getStringParam(request, "orderId", "orderId", 0, 50, null);
        Integer newStatus = GetParam.getIntParams(request, "status", "status", 0, 4, null);

        if (orderId == null || newStatus == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return 1;
        }

        // get current order
        Order order = orderDao.getOrderByOrderId(orderId);

        // check quantity
        if (order.getStatus() == 0 && newStatus != 4) {
            OrderItemDAO orderItemDao = new OrderItemDAO();
            ProductDAO productDao = new ProductDAO();
            ArrayList<OrderItem> orderItems = orderItemDao.getOrderItemByOrderId(order.getOrderId());
            for (OrderItem orderItem : orderItems) {
                Product product = productDao.getProductById(orderItem.getProductId());
                if (product.getQuantity() < orderItem.getQuantity()) {
                    request.setAttribute("quantityError", "Products do not have enough quantity");
                    return 2;
                }
            }
        }

        // update status in db
        if (!orderDao.updateOrderStatus(order, order.getStatus(), newStatus)) {
            throw new Exception();
        }
        return 0;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Integer check = processRequest(request, response);
            if (check == 1) {
                // forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            } else if (check == 2) {
                // forward on 400
                response.sendRedirect(Router.ADMIN_ORDER_CONTROLLER);
                return;
            }
            // forward on 200
            response.sendRedirect(Router.ADMIN_ORDER_CONTROLLER);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
