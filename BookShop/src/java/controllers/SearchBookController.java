package controllers;

import constant.Router;
import daos.CategoryDAO;
import daos.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.Product;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "java", urlPatterns = {"/" + Router.SEARCH_BOOK_CONTROLLER})
public class SearchBookController extends HttpServlet {

    protected void postHandler(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();

        //get name to search
        String name = GetParam.getStringParam(request, "name", "name", 0, 99, null);

        // get products by given name
        ArrayList<Product> products = productDAO.searchProductByName(name);
        request.setAttribute("products", products);

        // get categories for filter
        CategoryDAO categoryDao = new CategoryDAO();
        ArrayList<Category> categories = categoryDao.getAllCategory();
        request.setAttribute("categories", categories);
    }

    protected void getHandler(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDAO = new ProductDAO();

        // get products by given name
        ArrayList<Product> products = productDAO.getProducts(null, 0f, Float.MAX_VALUE);
        request.setAttribute("products", products);

        // get categories for filter
        CategoryDAO categoryDao = new CategoryDAO();
        ArrayList<Category> categories = categoryDao.getAllCategory();
        request.setAttribute("categories", categories);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            getHandler(request, response);
            request.getRequestDispatcher(Router.SEARCH_BOOK_PAGE).forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            postHandler(request, response);
            request.getRequestDispatcher(Router.SEARCH_BOOK_PAGE).forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
