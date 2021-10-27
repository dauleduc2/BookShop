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

@WebServlet(name = "ProductDetailController", urlPatterns = {"/" + Router.PRODUCT_DETAIL_CONTROLLER})
public class ProductDetailController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean getHandler(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get productId
        Integer productId = GetParam.getIntParams(request, "productId", "Product", 1, Integer.MAX_VALUE, 0);

        // find product by given id
        Product product = productDao.getProductById(productId);

        // check existed product
        if (product == null) {
            Helper.setAttribute(request, 404, "Not found", "The requested URL was not found on this server");
            return false;
        }

        // set attribute product
        request.setAttribute("product", product);
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!getHandler(request, response)) {
                // forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher(Router.PRODUCT_DETAIL_PAGE).forward(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

    protected boolean postHandler(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("productId", productId);
        session.setAttribute("products", products);
        request.setAttribute("successMessage", "Add product to cart successful");
        return true;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!postHandler(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            this.doGet(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
