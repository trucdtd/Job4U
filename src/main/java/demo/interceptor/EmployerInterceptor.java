/*
 * package demo.interceptor;
 * 
 * import jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse; import
 * org.springframework.stereotype.Component; import
 * org.springframework.web.servlet.HandlerInterceptor;
 * 
 * @Component public class EmployerInterceptor implements HandlerInterceptor {
 * 
 * @Override public boolean preHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler) throws Exception { Object
 * userIsLoggedIn = request.getSession().getAttribute("userIsLoggedIn"); Integer
 * userRole = (Integer) request.getSession().getAttribute("role");
 * 
 * if (userIsLoggedIn == null || !userIsLoggedIn.equals(true) || userRole ==
 * null || userRole != 2) { response.sendRedirect("/Login"); // Chuyển hướng đến
 * trang đăng nhập nếu không phải là nhà tuyển dụng return false; } return true;
 * } }
 */