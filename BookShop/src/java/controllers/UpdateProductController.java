package controllers;

import constant.Router;
import daos.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "UpdateProductController", urlPatterns = {"/" + Router.UPDATE_PRODUCT_CONTROLLER})
public class UpdateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>POST</code> methods.
     */
    protected boolean postHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get the current product
        Integer productId = GetParam.getIntParams(request, "productId", "ProductId", 0, Integer.MAX_VALUE, null);
        if (productId == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }
        Product product = productDao.getProductById(productId);

        // check existed product
        if (product == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }

        // validate params
        String name = GetParam.getStringParam(request, "name", "Product's name", 3, 50, null);
        String imageUrl = GetParam.getFileParam(request, "productAvatar", "Product avatar", 1080 * 1080);
        Integer quantity = GetParam.getIntParams(request, "quantity", "Quantity", 0, Integer.MAX_VALUE, null);
        Float price = GetParam.getFloatParams(request, "price", "Price", 0, Float.MAX_VALUE, null);
        String description = GetParam.getStringParam(request, "description", "Discription", 3, 255, null);
        String publishedDate = GetParam.getStringParam(request, "publishedDate", "Published date", 7, 12, null);
        Integer categoryId = GetParam.getIntParams(request, "type", "Type", 0, Integer.MAX_VALUE, null);

        // check duplicated name
        if (name != null && !name.equals(product.getName()) && productDao.getProductByName(name) != null) {
            request.setAttribute("nameError", "This product's name is already existed");
            return false;
        }

        // check null value for params
        if (name == null) {
            name = product.getName();
        }
        if (imageUrl == null) {
            imageUrl = product.getImageUrl();
        }
        if (quantity == null) {
            quantity = product.getQuantity();
        }
        if (price == null) {
            price = product.getPrice();
        }
        if (description == null) {
            description = product.getDescription();
        }
        if (publishedDate == null) {
            publishedDate = product.getPublishedDate();
        }
        if (categoryId == null) {
            categoryId = product.getCategoryId();
        }

        // update to database
        productDao.updateProduct(product.getProductId(), name, imageUrl, quantity, price, description, publishedDate,
                categoryId);
        // send success message
        request.setAttribute("successMessage", "Update product successful.");
        return true;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> methods.
     */
    protected boolean getHandler(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get the current product
        Integer productId = GetParam.getIntParams(request, "productId", "ProductId", 0, Integer.MAX_VALUE, null);
        System.out.println(productId);
        Product product = productDao.getProductById(productId);

        // check existed product
        if (product == null) {
            Helper.setAttribute(request, StatusCode.NOT_FOUND.getValue(), "Not found", "The requested URL was not found on this server");
            return false;
        }

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
                //forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            request.getRequestDispatcher(Router.UPDATE_PRODUCT_PAGE).forward(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e);
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            if (!postHandler(request, response)) {
                //forward on 404
                request.getRequestDispatcher(Router.ERROR).forward(request, response);
                return;
            }
            // forward on 200
            this.doGet(request, response);
        } catch (Exception e) {
            System.out.println(e);
            // forward on 500
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
