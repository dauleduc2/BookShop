package controllers;

import constant.Router;
import daos.ProductDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Product;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "AddProductToCartController", urlPatterns = {"/" + Router.ADD_PRODUCT_TO_CART_CONTROLLER})
public class AddProductToCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // validate params
        Integer productId = GetParam.getIntParams(request, "productId", "Product", 1, Integer.MAX_VALUE, 0);
        Integer quantity = GetParam.getIntParams(request, "quantity", "Quanity", 1, Integer.MAX_VALUE, 1);

        // find product by given id
        Product product = productDao.getProductById(productId);

        // check existed product
        if (product == null) {
            Helper.setAttribute(request, 404, "Not found", "The requested URL was not found on this server");
            return false;
        }

        // check quantity
        if (quantity > product.getQuantity()) {
            request.setAttribute("quantityError", "The maximun quantity of product is " + product.getQuantity());
            return false;
        }

        // get products in cart
        HttpSession session = request.getSession();
        ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
        if (products == null) {
            products = new ArrayList<Product>();
        }

        // set quantity for product in cart
        for (Product pro : products) {
            // return if product is already in cart
            if (Objects.equals(pro.getProductId(), productId)) {
                quantity += pro.getQuantity();
                pro.setQuantity(quantity);
                return true;
            }
        }
        product.setQuantity(quantity);

        // send product to session
        products.add(product);
        session.setAttribute("products", products);
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
                // forward on 400
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher("/WEB-INF/view/testShowProduct.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
