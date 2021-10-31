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

@WebServlet(name = "ShowOrderController", urlPatterns = {"/" + Router.SHOW_ORDERS_CONTROLLER})
public class ShowOrderController extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and
	 * <code>POST</code> methods.
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		OrderDAO orderDao = new OrderDAO();

		// get current userId
		String userId = (String) session.getAttribute("userId");

		// get user's orders
		ArrayList<Order> orders = orderDao.getOrdersByUserId(userId);

		// check empty
		if (orders == null) {
			request.setAttribute("emptyMessage", "There is no order yet");
			return;
		}

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
