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

@WebFilter(filterName = "CommonFilter", urlPatterns = {"/" + Router.CHANGE_PASSWORD_CONTROLLER, "/" + Router.PROFILE_CONTROLLER})
public class CommonFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        try {
            if (!Helper.protectedRouter(req, res, 0, 1, Router.LOGIN_PAGE)) {
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
