package controllers;

import constant.Router;
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

<<<<<<< HEAD
/**
 *
 * @author Bana-na
 */
=======
>>>>>>> test
@WebServlet(name = "ChangeQuantityController", urlPatterns = {"/" + Router.CHANGE_QUANTITY_CONTROLLER})
public class ChangeQuantityController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        //get list of products
        ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");

        //get index of product
        Integer index = GetParam.getIntParams(request, "productIndex", "Product's index", 0, Integer.MAX_VALUE, null);

        //check option increase or descrease
        Integer isIncreased = GetParam.getIntParams(request, "isIncreased", "Is increased", 0, 1, null);

        // check params
        if (products == null || index == null || isIncreased == null) {
            return false;
        }

        // decrease
        if (isIncreased == 0) {
            int newQuantity = products.get(index).getQuantity() - 1;
            if (newQuantity == 0) { // remove if quantity = 0
                products.remove((int) index);
            } else {
                products.get(index).setQuantity(products.get(index).getQuantity() - 1);
                request.setAttribute("changeQuantityMessage", "Descrease quantity successfull");
            }
        } else { // increase
            products.get(index).setQuantity(products.get(index).getQuantity() + 1);
            request.setAttribute("changeQuantityMessage", "Increase quantity successfull");
        }

        // set products to session
        session.setAttribute("products", products);
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (!processRequest(request, response)) {
                // forward on 400
                request.getRequestDispatcher(Router.CART_PAGE).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher(Router.CART_PAGE).forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e.getMessage());
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
