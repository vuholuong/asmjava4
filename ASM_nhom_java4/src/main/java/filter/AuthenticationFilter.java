package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.User;

@WebFilter("/*") // Áp dụng cho tất cả các URL
public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo Filter nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        String uri = httpRequest.getRequestURI();
        User user = (User) httpRequest.getSession().getAttribute("user");

        // Danh sách các URL không yêu cầu đăng nhập
        String[] publicUrls = {"/top-videos","/videoall", "/account/sign-in", 
        		"/account/sign-up", "/account/forgot-password", "/login.jsp" ,
        		"/dangki.jsp","/forgot-password.jsp","/index.jsp"};

        boolean isPublicUrl = false;
        for (String url : publicUrls) {
            if (uri.endsWith(url)) {
                isPublicUrl = true;
                break;
            }
        }

        // Nếu không đăng nhập và truy cập vào URL yêu cầu quyền
        if (!isPublicUrl && user == null) {
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/top-videos");
            return;
        }

        // Nếu user đăng nhập nhưng truy cập URL không phù hợp với quyền
        if (user != null && uri.startsWith("/admin") && !user.getAdmin()) {
            httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập!");
            return;
        }

        // Tiếp tục xử lý request nếu hợp lệ
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Hủy bỏ Filter 
    }
}
