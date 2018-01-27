package com.fengyukeji.resourceslib.intercepter;

import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author xt
 *
 * 2018年1月24日
 */
public class ResourcesVisitIntercepter implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
			Object adminName = request.getSession().getAttribute("username");
			Object customerName = request.getSession().getAttribute("UserName");
			//如果访问的是全部资源下的资源首页 允许未登录访问
			String requestId = request.getParameter("parentId");
			if(requestId!=null){
				
				if(requestId.equals("1")){
					return true;
				}
			}
			if(customerName!=null&&customerName!=""){
				return true;
			}
			if(adminName!=null){
				return true;
			}
			response.sendRedirect(request.getServletContext().getContextPath()+"/Customer/cannotVisit");
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
//	/*
//	 * 
//	public void visit(HttpServletRequest request){
//		String reqStr = request.getRequestURL().toString();
//		String downloadPattern = ".*/download";
//	    boolean isLoad = Pattern.matches(downloadPattern, reqStr);
//	    String visi
//		System.out.println("访问路径为："+reqStr);
//	}
//	*/
}
