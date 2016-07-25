package com.jxapq.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginFilter implements Filter {
	@Override
	public void destroy() {}
	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		// 获取用户访问的地址url.主要是有一些是不需要进行过滤的页面
		List list = (List) session.getAttribute("userList");
		String url = request.getRequestURL().toString();
		String view = request.getParameter("view");
		if(view == null){
			view="";
		}
		if (list != null || url.endsWith("login.jsp")
				|| url.endsWith("index.jsp") 
				|| url.contains("UploadifyServlet")
				|| url.contains("QueryServlet")
				|| view .equals("userLoginView")
				|| view .equals("adminLoginView")  
				|| view .equals("registerView")
				|| view .equals("exitView")
				|| view .equals("alterCodeView")
				|| view .equals("forgetpass1View")
				|| view .equals("forgetpass2View")
				|| view .equals("forgetpass3View")
				|| url.endsWith("register.jsp")
				|| url.endsWith("forgetpass1View.jsp")
				|| url.endsWith("forgetpass2View.jsp")
				|| url.endsWith("forgetpass3View.jsp")
				|| url.endsWith("wangjimima01.jsp")
				|| url.endsWith("wangjimima02.jsp")
				|| url.endsWith("wangjimima03.jsp")
				|| url.endsWith("wangjimima04.jsp") 
				
				|| view .equals("validateCodeView")

				|| url.endsWith("second.jsp") 
				|| url.endsWith("welcome.jsp") 
				|| url.endsWith("01-jie.jsp") 
				
				|| url.endsWith(".css")
				|| url.endsWith(".js") 
				|| url.endsWith(".gif")
				|| url.endsWith(".png") 
				|| url.endsWith(".jpg")) {
			// 满足条件就继续执行
			chain.doFilter(request, response);
		} else {
			// 不满足条件就跳转到其他页面
			PrintWriter out = res.getWriter();
			response.sendRedirect(request.getContextPath()
					+ "/jxapq/jsp/login.jsp");
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

}
