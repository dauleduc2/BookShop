package controllers;

import constant.Router;
import daos.ProductDAO;
import java.io.IOException;
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

@WebServlet(name = "FilterController", urlPatterns = {"/" + Router.FILTER_CONTROLLER})
public class FilterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get params
        Integer categoryId = GetParam.getIntParams(request, "categoryId", "category", 0, Integer.MAX_VALUE, 1033);
        Float minPrice = GetParam.getFloatParams(request, "minPrice", "min price", 0, Float.MAX_VALUE, 0.0f);
        Float maxPrice = GetParam.getFloatParams(request, "maxPrice", "max price", 0, Float.MAX_VALUE, Float.MAX_VALUE);

        // check price
        if (minPrice > maxPrice) {
            request.setAttribute("priceError", "Min price cannot greater than max price");
            return false;
        }

        // get products
        ArrayList<Product> products = productDao.getProducts(categoryId, minPrice, maxPrice);

        // send products
        request.setAttribute("products", products);
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/view/testFilter.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher("WEB-INF/view/testFilter.jsp").forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher("WEB-INF/view/testFilter.jsp").forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
