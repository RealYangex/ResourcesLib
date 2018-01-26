package com.fengyukeji.resourceslib.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录验证拦截器
 * @author xt
 *
 * 2017年9月14日
 */
public class AdminLoginIntercepter implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		 String  username = (String) request.getSession().getAttribute("username");
		 System.out.println(request.getRequestURI());
	       if (username == null||username.equals("")) {
	             System.out.println("尚未登录，调到登录页面");
	             response.sendRedirect(request.getContextPath()+"/login.jsp");
	             return false;
	         }else{
//	        	 System.out.println("通过验证");
	        	 return true;
	         }
	}

	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	 
	
}
