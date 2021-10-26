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
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "UpdateProductController", urlPatterns = {"/" + Router.UPDATE_PRODUCT_CONTROLLER})
public class UpdateProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();

        // get the current product
        Product product = (Product) request.getAttribute("product");

        // check existed product
        if (product == null) {
            Helper.setAttribute(request, 404, "Not found", "The requested URL was not found on this server");
            return false;
        }

        // validate params
        String name = GetParam.getStringParam(request, "name", "Product's name", 3, 50, null);
        String image = GetParam.getFileParam(request, "image", "Product's image", 1080 * 1080);
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
        if (image == null) {
            image = product.getImageUrl();
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
        productDao.updateProduct(product.getProductId(), name, image, quantity, price, description, publishedDate,
                categoryId);
        // send success message
        request.setAttribute("successMessage", "Update product successful.");
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(Router.UPDATE_PRODUCT_PAGE).forward(request, response);
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
                this.doGet(request, response);
                return;
            }
            // forward on 200
            this.doGet(request, response);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
