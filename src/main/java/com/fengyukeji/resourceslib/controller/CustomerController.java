package com.fengyukeji.resourceslib.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.resourceslib.bean.Customer;
import com.fengyukeji.resourceslib.service.CustomerService;
import com.fengyukeji.resourceslib.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 用户控制器 
 * @author jh
 *
 * 2018年1月11日
 */

@RequestMapping("/Customer")
@Controller
public class CustomerController {
	@Autowired
	CustomerService customerService;
	
	/**
	 * 保存用户信息 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveCustomerInfo")
	public Msg saveCustomerInfo(HttpServletRequest request){
		String userName=request.getParameter("userName");
		String userPassword=request.getParameter("userPassword");
		String userRealName=request.getParameter("userRealName");
		String userEmail=request.getParameter("userEmail");
		customerService.saveCustomerInfo(userName, userRealName,userEmail,userPassword);
		return Msg.success();
	}
   //deleteOneCustomer
	/**
	 * 删除某个用户信息 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteOneCustomer")
	public Msg deleteOneCustomer(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		customerService.deleteOneCustomer(id);
		return Msg.success();
	} 
	
	/**
	 * 获取所有用户信息 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllCustomer")
	public Msg getAllCustomer(@RequestParam(value="pn",defaultValue = "1")Integer pn){
		PageHelper.startPage(pn, 6);
		List<Customer> cusList = customerService.getAllCustomer();
		PageInfo page = new PageInfo(cusList,1);
		
		return Msg.success().add("cusList", page);
	}

	/**
	 * 搜索用户
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/searchOneCustomer")
	public Msg searchOneCustomer(HttpServletRequest request) {
		String searchName=request.getParameter("searchName");
		List<Customer> cusList = customerService.getAllCustomer();
		double placePage=0;
		boolean find=false;
		for(int i=0;i<cusList.size();i++) {
		    placePage+=1;
			if(searchName.equals(cusList.get(i).getUsername())) {
				find=true;
				i=cusList.size();
			}
		}
		if(find==true) {
			placePage=Math.ceil(placePage/6);
			return Msg.success().add("placePage",placePage);
		}
		else
			return Msg.failed();
	}
	/**
	 * 用户登录 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loginCustomer")
	public Msg loginCustomer(HttpServletRequest request,HttpSession session){
		String userName=request.getParameter("userName");
		String userPassword=request.getParameter("userPassword");
	
		Customer customer=customerService.loginCustomer(userName,userPassword);
		if(customer!=null){
			   if(customer.getCurrentType()==1){
				   session.setMaxInactiveInterval(60*60*12);		//设置sessoin 过期时间 10小时
				   session.setAttribute("UserId", customer.getId());
				   session.setAttribute("UserName",customer.getUsername());
				   session.setAttribute("UserPassword", customer.getPassword());
				   session.setAttribute("UserType", customer.getCurrentType());
				   
				   Date logindate=new Date();
				   customerService.addDateCustomer(customer.getId(),logindate);//更新用户登录时间
			   }
			   return Msg.success().add("userType",customer.getCurrentType());
		}
		else{
			return Msg.failed();
	    }
   }


	/**
	 *更改用户登录权限
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/forbidLoginCustomer")
	public Msg forbidLoginCustomer(HttpServletRequest request){
		Integer id = Integer.parseInt(request.getParameter("id"));
		Integer currentType = Integer.parseInt(request.getParameter("currentType"));

		if(currentType==1)
			currentType=0;
		else if(currentType==0)
			currentType=1;
		customerService.forbidLoginCustomer(id, currentType);
		return Msg.success().add("type",currentType);
		
	}
	

	/**
	 *授权某个用户登录权限
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/greenOneLoginCustomer")
	public Msg greenOneLoginCustomer(HttpServletRequest request) {
		
		Integer id = Integer.parseInt(request.getParameter("msgId"));
		customerService.forbidLoginCustomer(id, 1);
		return Msg.success();
	}
	/**
	 *编辑用户信息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/editCustomerInfo")
	public Msg editCustomerInfo(HttpServletRequest request) {
		Integer id = Integer.parseInt(request.getParameter("id"));
		String name=request.getParameter("name");
		String realName=request.getParameter("realName");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		
		customerService.editCustomerInfo(id,name,realName,password,email);
		return Msg.success();
	}
	
	/**
	 * 退出登录 
	 * @return 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/exitCustomer")
	public Msg exitCustomer(HttpSession session) {
		 session.setAttribute("UserId", "");
		 session.setAttribute("UserName","");
		 session.setAttribute("UserPassword","");
		 session.setAttribute("UserType", "");
		return Msg.success();
	}

	/**
	 * 授权所有用户登录 
	 * @return 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/greenAllLoginCustomer")
	public Msg greenAllLoginCustomer() {
		
		customerService.greenAllLoginCustomer();
		return Msg.success();
	}

	/**
	 * 获取授权状态 
	 * @return 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAgreeState")
	public Msg getAgreeState(HttpServletRequest request) {
		Integer msgId = Integer.parseInt(request.getParameter("msgId"));
		Integer state=customerService.getAgreeState(msgId);
		if(state==0)
		    return Msg.success().add("state", "等待授权");
		else
			return Msg.success().add("state", "已经授权");
	}
	
}
