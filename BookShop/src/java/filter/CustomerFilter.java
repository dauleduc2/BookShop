package filter;

import constant.Router;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.StatusCode;
import utils.Helper;

@WebFilter(filterName = "CustomerFilter", urlPatterns = {"/" + Router.CANCEL_ORDER_CONTROLLER,
    "/" + Router.CART_CONTROLLER, "/" + Router.CHANGE_QUANTITY_CONTROLLER,
    "/" + Router.CHECKOUT_CONTROLLER, "/" + Router.PRODUCT_IN_ORDER_CONTROLLER,
    "/" + Router.REMOVE_PRODUCT_CONTROLLER, "/" + Router.SHOW_ORDERS_CONTROLLER})
public class CustomerFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        try {
            if (!Helper.protectedRouter(req, res, 0, 0, Router.LOGIN_PAGE)) {
                return;
            }
            chain.doFilter(request, response);
        } catch (Exception e) {
            System.out.println(e);
            Helper.setAttribute(req, StatusCode.INTERNAL_SERVER_ERROR.getValue(), "Something failed", "Please try again later");
            request.getRequestDispatcher(Router.ERROR).forward(request, response);
        }

    }

    public void destroy() {
    }

    public void init(FilterConfig filterConfig) {

    }
}
