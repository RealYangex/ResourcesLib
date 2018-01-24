package com.fengyukeji.resourceslib.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fengyukeji.resourceslib.utils.CreateImageCode;

/**
 * 视图控制器 用于控制返回视图
 * @author xt
 *
 * 2018年1月3日
 */
@Controller
@RequestMapping("/View")
public class ViewController {
	/**
	 * 登录
	 * @return
	 */
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	
	/**
	 *  返回首页视图
	 * @return
	 */
	@RequestMapping("/index")
	public String Index(){
		return "index";
	}
	
	/**
	 *  返回管理员首页视图
	 * @return
	 */
	@RequestMapping("/adminIndex")
	public String adminIndex(){
		return "adminIndex";
	}
	
	/**
	 *  返回管理员首页视图
	 * @return
	 */
	@RequestMapping("/index/admin")
	public String admin(){
		return "adminIndex";
	}

	
	/**
	 *  返回管理员管理资源视图
	 * @return
	 */
	@RequestMapping("/adminResource")
	public String adminResource(){
		return "adminResource";
	}
	/**
	 *  返回管理员会员管理视图
	 * @return
	 */
	@RequestMapping("/adminCoustomer")
	public String adminCoustomer(){
		return "adminCoustomer";
	}
	
	/**
	 *  返回管理员系统消息视图
	 * @return
	 */
	@RequestMapping("/adminSystemMessge")
	public String adminSystemMessge(){
		return "adminSystemMessge";
	}
	//+++++++++++++++++++++++++

	/**
	 *  返回管理考试视图
	 * @return
	 */
	@RequestMapping("/adminExamManage")
	public String adminExamManage(){
		return "adminExamManage";
	}
	
	/**
	 *  返回管理考试成绩视图
	 * @return
	 */
	@RequestMapping("/adminGradeManage")
	public String adminGradeManage(){
		return "adminGradeManage";
	}
	
	/**
	 *  返回管理考试消息视图
	 * @return
	 */
	@RequestMapping("/adminExamMessage")
	public String adminExamMessage(){
		return "adminExamMessage";
	}
	
	/**
	 *  返回设置视图
	 * @return
	 */
	@RequestMapping("/adminSetting")
	public String adminSetting(){
		return "adminSetting";
	}
	
	/**
	 *  返回退出视图
	 * @return
	 */
	@RequestMapping("/adminExit")
	public void adminExit(){
		
		//转发到跳转即可
	}
		


	/**
	 *  返回在线考试视图
	 * @return
	 */
	@RequestMapping("/examination")
	public String examination(){
		return "examination";
	}

	
	/**
	 *  返回用户注册视图
	 * @return
	 */
	@RequestMapping("/userRegist")
	public String userRegist(){
		return "userRegist";
	}
	
	/**
	 *  下载空的试题添加模板
	 * @return
	 */
	@RequestMapping("/downloadEmptyExcel")
	public String downloadEmptyExcel(){
		return "downloadEmptyExcel";
	}
	
	/**
	 * 验证码
	 */
	@RequestMapping("/imageCode")
	public void imageCode(HttpServletRequest req, HttpServletResponse response,HttpSession session){
		 // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        
        
        CreateImageCode vCode = new CreateImageCode(100,30,5,10);
        session.setAttribute("code", vCode.getCode());
        try {
			vCode.write(response.getOutputStream());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
