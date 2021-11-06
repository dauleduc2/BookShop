package controllers;

import constant.Router;
import daos.CategoryDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Category;
import models.StatusCode;
import utils.GetParam;
import utils.Helper;

@WebServlet(name = "AddCategoryController", urlPatterns = {"/" + Router.ADD_CATEGORY_CONTROLLER})
public class AddCategoryController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        CategoryDAO categoryDao = new CategoryDAO();

        //validate params
        String name = GetParam.getStringParam(request, "category", "Category's Name", 1, 50, null);

        //check param
        if (name == null) {
            return false;
        }

        //check caterogy is existed
        if (categoryDao.getCategoryByName(name) != null) {
            request.setAttribute("categoryError", "This Category's Name was existed.");
            return false;
        }

        //add new category
        Category category = new Category(null, name, null);
        categoryDao.addNewCategory(category);

        //send success message
        request.setAttribute("successMessage", "Add category successful.");

        return true;
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(Router.ADD_CATEGORY_PAGE).forward(request, response);
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
                request.getRequestDispatcher(Router.ADD_CATEGORY_PAGE).forward(request, response);
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
