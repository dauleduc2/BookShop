package controllers;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import constant.Router;
import daos.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

/**
 *
 * @author Admin
 */
@WebServlet(name = "java", urlPatterns = {"/" + Router.SEARCH_BOOK_CONTROLLER})
public class SearchBookController extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		//get name to search
//        String name = GetParam.getStringParam(request, "name", "name", 0, 99, null);

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.getRequestDispatcher(Router.SEARCH_BOOK_PAGE).forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		try {
			processRequest(request, response);
			//get name to search
			String name = GetParam.getStringParam(request, "name", "name", 0, 99, null);
			ProductDAO productDAO = new ProductDAO();
			ArrayList<Product> products = productDAO.searchProductByName(name);
			request.setAttribute("products", products);
			request.getRequestDispatcher("WEB-INF/view/testFilter.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			// forward on 500
			Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
			request.getRequestDispatcher(Router.ERROR).forward(request, response);
		}
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}

}
