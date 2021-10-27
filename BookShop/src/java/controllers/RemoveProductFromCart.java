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
import javax.servlet.http.HttpSession;
import models.Product;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "RemoveProductFromCart", urlPatterns = {"/RemoveProductFromCart"})
public class RemoveProductFromCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        ProductDAO productDao = new ProductDAO();

        // get productId
        Integer productId = GetParam.getIntParams(request, "productId", "Product", 1, Integer.MAX_VALUE, 0);

        // find product by given id
        Product product = productDao.getProductById(productId);

        // get the products from cart
        ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");

        // check existed product
        if (product == null || products.isEmpty()) {
            Helper.setAttribute(request, 404, "Not found", "The requested URL was not found on this server");
            return false;
        }

        // remove product from cart
        products.remove(product);

        // set products to session
        session.setAttribute("products", products);

        // send success message
        request.setAttribute("successMessage", "Remove product successful");
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
            response.sendRedirect(Router.CART_CONTROLLER);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
