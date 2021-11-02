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
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "ShowProductInCategory", urlPatterns = {"/" + Router.SHOW_PRODUCT_IN_CATEGORY_CONTROLLER})
public class ShowProductInCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get params
        Integer categoryId = GetParam.getIntParams(request, "categoryId", "Category", 0, Integer.MAX_VALUE, null);

        // check params
        if (categoryId == null) {
            Helper.setAttribute(request, 404, "Not found", "The requested URL was not found on this server");
            return false;
        }

        // get products in category
        ArrayList<Product> products = productDao.getProductsByCategoryId(categoryId);

        // send to request
        request.setAttribute("products", products);
        return true;
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
            request.getRequestDispatcher("WEB-INF/view/showProductInCategory.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
