package com.fengyukeji.resourceslib.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
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
import com.fengyukeji.resourceslib.bean.Message;
import com.fengyukeji.resourceslib.bean.Resources;
import com.fengyukeji.resourceslib.service.AdminSetingService;
import com.fengyukeji.resourceslib.service.CustomerService;
import com.fengyukeji.resourceslib.service.ResourceService;
import com.fengyukeji.resourceslib.service.SystemMessgeService;
import com.fengyukeji.resourceslib.utils.DateUtil;
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
	
	@Autowired
	SystemMessgeService systemMessageService;
	
	@Autowired
	ResourceService resourceService;
	
	@Autowired
	AdminSetingService adminSettingService;
	
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
	    boolean bool=	customerService.checkCustomer(userName);
		if(bool==false) {
			Integer userId = customerService.saveCustomerInfo(userName, userRealName,userEmail,userPassword);
			
			//记录请求授权信息
			Message message = new Message(null,userId,DateUtil.getNowSqlDate(),"用户："+userName+";真实姓名："+userRealName+";邮箱:"+userEmail+" 完成注册，请求授权",2,null);
			systemMessageService.insertMessage(message);
			return Msg.success();
		}else {
			Msg msg = new Msg();
			msg.setCode(300);
			msg.setMessage("用户名已存在！");
			return msg;
		}
		
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
		PageHelper.startPage(pn, 12);
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
		 session.setAttribute("UserId", null);
		 session.setAttribute("UserName",null);
		 session.setAttribute("UserPassword",null);
		 session.setAttribute("UserType", null);
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
	
	/**
	 * 返回不可以访问
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/cannotVisit")
	public Msg cannotVisit(HttpServletRequest request){
		
		String visit = request.getParameter("visit");
		Msg msg = new Msg();
		if("0".equals(visit)){
			msg.setMessage("当前系统设置仅管理员可以访问，请联管理员");
			msg.setCode(400);
		}else{
			msg.setMessage("请先登录");
			msg.setCode(300);
		}
		return msg;
	}
	
	/**
	 * 返回不可以访问
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkLogin")
	public Msg checkLogin(HttpServletRequest request){
		Object UserName = request.getSession().getAttribute("UserName");
		
		//判断管理设置的访问权限
		Integer visitSet = adminSettingService.getVistSeting();
		
		Msg msg = new Msg();
		
		if(visitSet==1){
			if(UserName==null||UserName==""){
				msg.setCode(100);
				return msg;
			}else{
				msg.setCode(200);
				return msg;
			}
		}else if(visitSet==0){
			msg.setCode(400);
			return msg;
		}else{
			msg.setCode(200);
			return msg;
		}
		
		
	}
	
	/**
	 * 返回不可以访问
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/visit")
	public Msg visit(HttpServletRequest request){
		String  UserName = request.getSession().getAttribute("UserName").toString();
		Integer userId = Integer.parseInt( request.getSession().getAttribute("UserId").toString());
		String type = request.getParameter("type");
		Integer  id = Integer.parseInt(request.getParameter("id"));
		if(type.equals("2")){
			
			//下载消息
			Resources res = resourceService.getFile(id);
			if(res!=null){
				String name = res.getName();
				Message message = new Message(null,userId,DateUtil.getNowSqlDate(),"用户："+UserName+" 下载了【"+name+"】资源",1,null);
				systemMessageService.insertMessage(message);
			}
			
		}else{
			
			//访问消息
			Resources res = resourceService.getFile(id);
			if(res!=null){
				String name = res.getName();
				Message message = new Message(null,userId,DateUtil.getNowSqlDate(),"用户："+UserName+" 访问了【"+name+"】资源",0,null);
				systemMessageService.insertMessage(message);
			}
		}
		return Msg.success();
	}
	
	/**
	 * 获取访问人次
	 * @return
	 * @throws UnknownHostException 
	 */
	@ResponseBody
	@RequestMapping("/visitCount")
	public Msg visitCount() throws UnknownHostException{
		//获取当前时间
		Date date=new Date();
		//获取系统ip
		InetAddress addr = InetAddress.getLocalHost();
		String ip=addr.getHostAddress().toString(); 
		
		List<Object> visitCountList=customerService.visitCount(date,ip);
		Integer totalCount=(Integer) visitCountList.get(0);
		Integer todayCount=(Integer) visitCountList.get(1);
		return Msg.success().add("totalCount",totalCount).add("todayCount", todayCount);
	}
}
