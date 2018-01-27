package com.fengyukeji.resourceslib.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.resourceslib.service.AdminSetingService;
import com.fengyukeji.resourceslib.utils.Msg;

@RequestMapping("/AdminSeting")
@Controller
public class AdminSetingController {
	@Autowired
	AdminSetingService adminSetingService;
	
	
	/**
	 * 消息设置
	 * @return
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/msgSeting")
	public Msg msgSeting(HttpServletRequest request,HttpSession session)
	{
		Integer value=Integer.parseInt(request.getParameter("value"));
		adminSetingService.msgSeting(value);
		
		return Msg.success();
	}
	
	/**
	 * 访问设置
	 * @return
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/vistSeting")
	public Msg vistSeting(HttpServletRequest request,HttpSession session)
	{
		Integer value=Integer.parseInt(request.getParameter("value"));
		adminSetingService.vistSeting(value);
		
		return Msg.success();
	}
	
	
	/**
	 * 获取访问设置
	 * @return
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("/getVistSeting")
	public Msg getVistSeting(HttpServletRequest request,HttpSession session)
	{
	   Integer value= adminSetingService.getVistSeting();
		
		return Msg.success().add("value", value);
	}
}
