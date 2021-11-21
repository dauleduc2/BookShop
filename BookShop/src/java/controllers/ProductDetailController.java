package controllers;

import constant.Router;
import daos.CategoryDAO;
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
import models.Category;
import models.Product;
import models.StatusCode;
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
        CategoryDAO categoryDAO = new CategoryDAO();
        // get productId
        Integer productId = GetParam.getIntParams(request, "productId", "Product", 1, Integer.MAX_VALUE, 0);

        // find product by given id
        Product product = productDao.getProductById(productId);

        // check existed product
        if (product == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }

        Category category = categoryDAO.getCategoryByID(product.getCategoryId());

        // set attribute product
        request.setAttribute("category", category);
        request.setAttribute("product", product);

        // get and send successMessage if existed
        HttpSession session = request.getSession();
        request.setAttribute("successMessage", (String) session.getAttribute("successMessage"));
        session.setAttribute("successMessage", null);
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
            System.out.println(e);
            // forward on 500
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
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
            Helper.setAttribute(request, StatusCode.NOT_FOUND.ordinal(), "Not found", "The requested URL was not found on this server");
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
                request.setAttribute("productId", productId);
                session.setAttribute("successMessage", "Add product to cart successful");
                return true;
            }
        }
        product.setQuantity(quantity);

        // send product to session
        products.add(product);
        request.setAttribute("productId", productId);
        session.setAttribute("products", products);
        session.setAttribute("successMessage", "Add product to cart successful");
        return true;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!Helper.protectedRouter(request, response, 0, 0, Router.LOGIN_PAGE)) {
                return;
            }
            if (!postHandler(request, response)) {
                // forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            response.sendRedirect(Router.PRODUCT_DETAIL_CONTROLLER + "?productId=" + request.getAttribute("productId"));
        } catch (Exception e) {
            System.out.println(e);
            // forward on 500
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.ordinal(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
