package com.fengyukeji.resourceslib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.resourceslib.bean.Message;
import com.fengyukeji.resourceslib.service.SystemMessgeService;
import com.fengyukeji.resourceslib.utils.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 系统消息控制器 
 * @author jh
 *
 * 2018年1月13日
 */

@RequestMapping("/SystemMessge")
@Controller
public class SystemMessgeController {
	@Autowired
	SystemMessgeService systemMessgeService;
	
	/**
	 * 获取所有消息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllSystemMessge")
	public Msg getAllSystemMessge(@RequestParam(value="pn",defaultValue = "1")Integer pn,HttpServletRequest request) {
		Integer msgTypeSel=Integer.parseInt(request.getParameter("msgTypeSel"));
		PageHelper.startPage(pn, 4);
		List<Message> msgList = systemMessgeService.getAllSystemMessge(msgTypeSel);
		PageInfo page = new PageInfo(msgList,1);
		
		/*systemMessgeService.addSystemMessge();
		return Msg.success();*/
		return Msg.success().add("msgList",page);
	}

	/**
	 * 根据ID删除消息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteOneMessge")
	public Msg deleteOneMessge(HttpServletRequest request) {
		Integer msgId=Integer.parseInt(request.getParameter("msgId"));
		systemMessgeService.deleteOneMessge(msgId);
		return Msg.success();	
	}
	
	/**
	 * 删除所有考试消息
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteAllExmMessge")
	public Msg deleteAllExmMessge(HttpServletRequest request) {
		Integer msgType=Integer.parseInt(request.getParameter("msgType"));
		systemMessgeService.deleteAllExmMessge(msgType);
		return Msg.success();	
	}
	
	
	
	/**
	 * 改变消息授权状态
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/changeAgreeState")
	public void changeAgreeState(HttpServletRequest request) {
		Integer msgId=Integer.parseInt(request.getParameter("msgId"));
		
		systemMessgeService.changeAgreeState(msgId);
	}
}
