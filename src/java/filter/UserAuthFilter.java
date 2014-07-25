package filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Implements Filter class
public class UserAuthFilter implements Filter {

    private ArrayList urlList;

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        String url = request.getServletPath();
        boolean allowedRequest = false;
        String strURL = "";
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.

        // To check if the url can be excluded or not
        for (int i = 0; i < urlList.size(); i++) {
            strURL = urlList.get(i).toString();
            if (url.startsWith(strURL)) {
                allowedRequest = true;
            }
        }

        if (!allowedRequest) {
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                // Forward the control to login.jsp if authentication fails
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }
        }
        chain.doFilter(req, res);
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        // Read the URLs to be avoided for authentication check (From web.xml)
        String urls = config.getInitParameter("avoid-urls");
        StringTokenizer token = new StringTokenizer(urls, ",");
        urlList = new ArrayList();
        while (token.hasMoreTokens()) {
            urlList.add(token.nextToken());
        }
    }
}
