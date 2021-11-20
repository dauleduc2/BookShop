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
import javax.servlet.http.HttpSession;
import models.Order;
import models.OrderItem;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "ProductInOrderController", urlPatterns = {"/ProductInOrderController"})
public class ProductInOrderController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and
	 * <code>POST</code> methods.
	 */
	protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		OrderDAO orderDao = new OrderDAO();
		OrderItemDAO orderItemDao = new OrderItemDAO();
		boolean isTrue = false;
		//Get userId
		String userId = (String) session.getAttribute("userId");

		//Get user's order
		ArrayList<Order> orders = orderDao.getOrdersByUserId(userId);

		//Get orderId
		String orderId = GetParam.getStringParam(request, "orderId", "orderId", 0, Integer.MAX_VALUE, null);

		//Check params
		if (orderId == null) {
			return false;
		}

		//Check userId and orderId that matched
		for (Order order : orders) {
			if (order.getOrderId().equals(orderId)) {
				isTrue = true;
				break;
			}
		}

		if (!isTrue) {
			Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
			return false;
		}

		// Get list of orderItem
		ArrayList<OrderItem> orderItems = orderItemDao.getOrderItemByOrderId(orderId);

		//send request
		request.setAttribute("orderItems", orderItems);
		return isTrue;
	}

	/* Handles the HTTP <code>GET</code> method.
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		try {
//			if (!processRequest(request, response)) {
//				// forward on 404
//				request.getRequestDispatcher(Router.ERROR).forward(request, response);
//				return;
//			}
			// forward on 200
			request.getRequestDispatcher("WEB-INF/view/productInOrder.jsp").forward(request, response);

		} catch (Exception e) {
			System.out.println(e);
			// forward on 500
			Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
			request.getRequestDispatcher(Router.ERROR).forward(request, response);
		}
	}

}
