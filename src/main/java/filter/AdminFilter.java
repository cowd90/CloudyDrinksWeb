package filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

@WebFilter(filterName = "AdminFilter")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {

    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;

        HttpSession session = httpServletRequest.getSession();
        Object obj = session.getAttribute("user");
        User user = null;
        if (obj != null) {
            user = (User) obj;
        }

        String rootPath = httpServletRequest.getScheme() + "://" + httpServletRequest.getServerName() + ":" + httpServletRequest.getServerPort() + httpServletRequest.getContextPath();
        String uri = httpServletRequest.getServletPath();

        // Filter if user enter admin url
        if (uri.endsWith("/admin") || uri.equals("/admin/index.jsp")) {
            if (user != null) {
                if (user.isAdmin()) {
                    chain.doFilter(request, response);
                } else {
                    httpServletResponse.sendRedirect(rootPath);
                }
            } else {
                httpServletResponse.sendRedirect(rootPath + "/auth");
            }
        } else {
            chain.doFilter(request, response);
        }

    }
}
