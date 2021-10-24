package constant;

public class Router {

    // jsp file mapping
    public static final String LOGIN_PAGE = "/WEB-INF/view/loginPage.jsp";
    public static final String ERROR = "/WEB-INF/view/commonView/errorPage.jsp";
    public static final String HOME_PAGE = "/WEB-INF/view/home.jsp";
    public static final String REGISTER_PAGE = "/WEB-INF/view/registerPage.jsp";
    public static final String ME_PAGE = "WEB-INF/view/mePage.jsp";
    public static final String CHANGE_PASSWORD_PAGE = "WEB-INF/view/changePassword.jsp";
    public static final String ADD_PRODUCT_PAGE = "WEB-INF/view/addNewProductPage.jsp";
    public static final String PRODUCT_DETAIL_PAGE = "WEB-INF/view/productDetailPage.jsp";
    public static final String UPDATE_PRODUCT_PAGE = "WEB-INF/view/updateProductPage.jsp";
    // router mapping
    public static final String LOGIN_CONTROLLER = "login";
    public static final String REGISTER_CONTROLLER = "register";
    public static final String CHANGE_PASSWORD_CONTROLLER = "password";
    public static final String PROFILE_CONTROLLER = "me";
    public static final String SIGNOUT_CONTROLLER = "signout";
    public static final String HOME_CONTROLLER = "home";
    public static final String ADDPRODUCT_CONTROLLER = "addbook";
    public static final String PRODUCT_DETAIL_CONTROLLER = "product";
    public static final String UPDATE_PRODUCT_CONTROLLER = "updateproduct";
}
