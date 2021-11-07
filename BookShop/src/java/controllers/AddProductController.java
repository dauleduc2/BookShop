package controllers;

import constant.Router;
import daos.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Product;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "AddProductController", urlPatterns = {"/" + Router.ADD_PRODUCT_CONTROLLER})
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

        //validate param
        String name = GetParam.getStringParam(request, "name", "Book's Name", 5, 50, null);
        String imageUrl = GetParam.getFileParam(request, "productAvatar", "Product avatar", 1080 * 1080);
        Integer quantity = GetParam.getIntParams(request, "quantity", "Quantity", 0, Integer.MAX_VALUE, null);
        Float price = GetParam.getFloatParams(request, "price", "Price", 0, Float.MAX_VALUE, null);
        String description = GetParam.getStringParam(request, "description", "Description", 5, Integer.MAX_VALUE, null);
        String publishedDate = GetParam.getStringParam(request, "publishedDate", "Published date", 7, 12, null);
        Integer categoryId = GetParam.getIntParams(request, "type", "Type", 0, Integer.MAX_VALUE, null);

        //check params
        if (name == null || imageUrl == null || quantity == null || price == null || description == null || publishedDate == null) {
            isTrue = false;
        }

        // check duplicated name
        if (name != null && productDao.getProductByName(name) != null) {
            request.setAttribute("nameError", "This product's name is already existed");
            isTrue = false;
        }

        //check error occur
        if (!isTrue) {
            return false;
        }

        //add new product to database
        Product product = new Product(null, categoryId, name, imageUrl, quantity, price, description, publishedDate, null);
        productDao.addNewProduct(product);

        //send success message
        request.setAttribute("successMessage", "Add product successful.");

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
            this.doGet(request, response);
        } catch (Exception e) {
            // forward on 500
            System.out.println(e.getMessage());
            Helper.setAttribute(request, StatusCode.INTERNAL_SERVER_ERROR.ordinal(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }
    }

}
