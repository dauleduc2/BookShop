package controllers;

import constant.Router;
import daos.ProductDAO;
import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "AddProductController", urlPatterns = {"/" + Router.ADDPRODUCT_CONTROLLER})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1024, maxFileSize = 1024 * 1024 * 1024, maxRequestSize = 1024 * 1024 * 1024)
public class AddProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        ProductDAO productDao = new ProductDAO();
        boolean isTrue = true;

        String name = GetParam.getStringParam(request, "name", "Book's Name", 5, 50, null);

        String imageUrl = GetParam.getFileParam(request, "productAvatar", "Product avatar", 1080 * 1080);
        Integer quantity = GetParam.getIntParams(request, "quantity", "Quantity", 0, Integer.MAX_VALUE, null);
        Float price = GetParam.getFloatParams(request, "price", "Price", 0, Float.MAX_VALUE, null);
        String description = GetParam.getStringParam(request, "description", "Description", 5, Integer.MAX_VALUE, null);
        Date publishedDate = GetParam.getDateParams(request, "publishedDate", "Published date");
        Integer categoryId = GetParam.getIntParams(request, "type", "type", 0, 20, null);
        if (name == null || imageUrl == null || quantity == null || price == null || description == null || publishedDate == null || categoryId == null) {
            isTrue = false;
        }
        if (!isTrue) {
            return false;
        }

        Product product = new Product(null, categoryId, name, imageUrl, quantity, price, description, publishedDate);
        productDao.addNewProduct(product);
        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(Router.ADD_PRODUCT_PAGE).forward(request, response);
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
                request.getRequestDispatcher(Router.ADD_PRODUCT_PAGE).forward(request, response);
                return;
            }
            // forward on 200
            response.sendRedirect(Router.HOME_CONTROLLER);
        } catch (Exception e) {
            // forward on 500
            Helper.setAttribute(request, 500, "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
