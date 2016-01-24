package crm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crm.model.User;

public class AdminLoginCheckFilter implements Filter {

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		
		User user = (User) session.getAttribute("currentUser");
		
		if (user != null  && (user.getPower() == 4)) {
			chain.doFilter(request, response);
		} else{
			((HttpServletResponse) response).sendRedirect(httpRequest
					.getContextPath() + "/login.jsp");
		}
			
	}

	public void init(FilterConfig arg0) throws ServletException {

	}

}
