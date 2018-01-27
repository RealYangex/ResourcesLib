package com.fengyukeji.resourceslib.controller;

import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.resourceslib.bean.Admin;
import com.fengyukeji.resourceslib.bean.LoginBean;
import com.fengyukeji.resourceslib.service.AdminService;
import com.fengyukeji.resourceslib.utils.Msg;

@RequestMapping("/AdmLogin")
@Controller
public class AdminController {
	@Autowired
	AdminService  adminService;
	
	/**
	 * 登录方法
	 * @return
	 * @throws UnknownHostException 
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Msg login(LoginBean loginBean,HttpSession session,HttpServletRequest request) throws UnknownHostException{
		String code = (String) session.getAttribute("code");
		
		String name = (String) request.getParameter("name");
		String pass = (String) request.getParameter("pass");
		String codE = (String) request.getParameter("codE");
		loginBean.setUsername(name);loginBean.setPassword(pass);loginBean.setCode(codE);
		
		if(code.equalsIgnoreCase(loginBean.getCode())){
			Admin admin = adminService.login(loginBean.getUsername(), loginBean.getPassword());
			//验证码通过
			if(admin!=null){
				session.setMaxInactiveInterval(60*60*12);									//设置sessoin 过期时间 10小时
				session.setAttribute("userid", admin.getId());
				session.setAttribute("username", admin.getUsername());
				session.setAttribute("password", admin.getPassword());
				session.setAttribute("realname", admin.getRealname());
				 Date logindate=new Date();
				 adminService.addDateAdminLogin(admin.getId(),logindate);
				return Msg.success();
				
			}else{
				return Msg.failed();
			}
		}else{
			Msg msg = new Msg();
			msg.setCode(300);
			msg.setMessage("验证码错误");
			return msg;
		}
		
	}
   //
	/**
	 * 账户修改
	 * @return
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/modefiyAdminInfo")
	
	public Msg modifyOne(HttpServletRequest request,HttpSession session)
	{
		Integer userid=Integer.parseInt(request.getParameter("userid"));
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String realname=request.getParameter("realname");
		
		adminService.updateAdmin(userid,username,password,realname);           //调用service层
	
		session.setAttribute("username", username);
		session.setAttribute("password", password);
		session.setAttribute("realname", realname);
		return Msg.success();             
		
	}
	
	
	
	
	
	
	/**
	 * 退出
	 */
	@RequestMapping("/exit")
	public void exit(HttpServletRequest request,HttpSession session,HttpServletResponse response){
		session.setAttribute("username", null);
		try {
			response.sendRedirect(request.getContextPath()+"/logout.jsp");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
