package utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Helper {

    /**
     * Check that user is login or not
     *
     * @param request servlet request
     * @return true if logined false if not
     */
    public static boolean isLogin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }
        String userId = (String) session.getAttribute("userId");

        return userId != null;
    }
}
