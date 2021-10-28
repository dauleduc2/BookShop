package controllers;

import constant.Router;
import daos.OrderDAO;
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

@WebServlet(name = "CheckoutController", urlPatterns = {"/" + Router.CHECKOUT_CONTROLLER})
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO orderDao = new OrderDAO();
        ProductDAO productDao = new ProductDAO();
        HttpSession session = request.getSession();
        boolean isTrue = true;

        // check params
        String consigneeName = GetParam.getStringParam(request, "consigneeName", "Consignee name", 5, 255, null);
        String address = GetParam.getStringParam(request, "address", "Address", 5, 255, null);
        String phone = GetParam.getPhoneParams(request, "phone", "Phone number");

        if (consigneeName == null || address == null || phone == null) {
            isTrue = false;
        }

        // get products from cart
        ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");

//        // check quantity
//        Product product;
//        for (Product p : products) {
//            product = productDao.getProductById(p.getProductId());
//            if (product.getQuantity() < p.getQuantity()) {
//                request.setAttribute(product.getProductId() + "Error", "The current quantity in stock: " + product.getQuantity());
//                isTrue = false;
//            }
//        }
        if (!isTrue) {
            return isTrue;
        }

        // get current userId
        String userId = (String) session.getAttribute("userId");

        // save to db
        if (!orderDao.addNewOrder(products, 0, userId, consigneeName, address, phone)) {
            throw new Exception();
        }

        // update products in cart
        products.clear();
        session.setAttribute("products", products);
        request.setAttribute("successMessage", "Checkout successful");
        return true;
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.CART_CONTROLLER).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher("WEB-INF/view/checkoutSuccess.jsp").forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }
}
