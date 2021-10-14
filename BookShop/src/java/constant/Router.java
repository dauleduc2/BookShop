package constant;

public class Router {

    // jsp file mapping
    public static final String LOGIN_PAGE = "/WEB-INF/view/loginPage.jsp";
    public static final String ERROR = "/WEB-INF/view/error.jsp";
    public static final String HOME_PAGE = "/WEB-INF/view/home.jsp";
    public static final String REGISTER_PAGE = "/WEB-INF/view/registerPage.jsp";
    public static final String ME_PAGE = "WEB-INF/view/mePage.jsp";
    public static final String CHANGE_PASSWORD_PAGE = "WEB-INF/view/changePassword.jsp";

    // router mapping
    public static final String LOGIN_CONTROLLER = "login";
    public static final String REGISTER_CONTROLLER = "register";
    public static final String CHANGE_PASSWORD_CONTROLLER = "password";
    public static final String PROFILE_CONTROLLER = "me";
    public static final String SIGNOUT_CONTROLLER = "signout";
    public static final String HOME_CONTROLLER = "home";

}
