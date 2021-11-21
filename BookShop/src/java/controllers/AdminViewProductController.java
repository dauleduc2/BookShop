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

@WebServlet(name = "AdminViewProductController", urlPatterns = {"/AdminViewProductController"})
public class AdminViewProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get params
        Integer offset = GetParam.getIntParams(request, "page", "Page", 0, Integer.MAX_VALUE, null);
        Integer limit = GetParam.getIntParams(request, "limit", "Limit", 0, Integer.MAX_VALUE, null);

        // check params
        if (offset == null || limit == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }

        ArrayList<Product> products = productDao.getProductForAdmin((offset - 1) * 10, limit);
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
            request.getRequestDispatcher("").forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
