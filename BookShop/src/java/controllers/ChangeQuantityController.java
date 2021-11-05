/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import constant.Router;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Bana-na
 */
@WebServlet(name = "ChangeQuantityController", urlPatterns = {"/" + Router.CHANGE_QUANTITY_CONTROLLER})
public class ChangeQuantityController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected boolean processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        //get list of products
        ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");

        //index
        int index = GetParam.getIntParams(request, "productIndex", "Product's index", 0, Integer.MAX_VALUE, -1);

        //increase or descrease
        int isIncreased = GetParam.getIntParams(request, "isIncreased", "Is increased", 0, 1, -1);

        if (products == null || index == -1 || isIncreased == -1) {
            return false;
        }

        if (isIncreased == 0) {
            int newQuantity = products.get(index).getQuantity() - 1;
            if (newQuantity == 0) {
                products.remove(index);
            } else {
                products.get(index).setQuantity(products.get(index).getQuantity() - 1);
                request.setAttribute("changeQuantityMessage", "Descrease quantity successfull");
            }
        } else {
            products.get(index).setQuantity(products.get(index).getQuantity() + 1);
            request.setAttribute("changeQuantityMessage", "Increase quantity successfull");
        }
        session.setAttribute("products", products);
        return true;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
