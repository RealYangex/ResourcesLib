package com.fengyukeji.resourceslib.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fengyukeji.resourceslib.bean.ExamWithCustomerBean;
import com.fengyukeji.resourceslib.service.AdminSetingService;
import com.fengyukeji.resourceslib.service.ExamService;
import com.fengyukeji.resourceslib.service.SystemMessgeService;
import com.fengyukeji.resourceslib.utils.CreateImageCode;
import com.fengyukeji.resourceslib.utils.DateUtil;
import com.fengyukeji.resourceslib.utils.SimpleExcelWrite;

/**
 * 视图控制器 用于控制返回视图
 * @author xt
 *
 * 2018年1月3日
 */
@Controller
@RequestMapping("/View")
public class ViewController { 
	
	@Autowired 
	ExamService examService;
	
	@Autowired
	SystemMessgeService systemMessageService;
	
	@Autowired
	AdminSetingService adminSetingSerivce;
	
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
	public String adminIndex(HttpServletRequest request){
		
		//设置消息状态
		getMessage(request);
		return "adminIndex";
	}
	
	/**
	 *  返回管理员首页视图
	 * @return
	 */
	@RequestMapping("/index/admin")
	public String admin(HttpServletRequest request){
		
		//设置消息状态
		getMessage(request);
		return "adminIndex";
	}

	
	/**
	 *  返回管理员管理资源视图
	 * @return
	 */
	@RequestMapping("/adminResource")
	public String adminResource(HttpServletRequest request){
		
		//设置消息状态
		getMessage(request);
		return "adminResource";
	}
	/**
	 *  返回管理员会员管理视图
	 * @return
	 */
	@RequestMapping("/adminCoustomer")
	public String adminCoustomer(HttpServletRequest request){
		
		//设置消息状态
		getMessage(request);
		return "adminCoustomer";
	}
	
	/**
	 *  返回管理员系统消息视图
	 * @return
	 */
	@RequestMapping("/adminSystemMessge")
	public String adminSystemMessge(HttpServletRequest request){
		
		//设置系统消息为已读 2的系统消息
		systemMessageService.setMessageReaded(2);
		
		//设置消息状态
		getMessage(request);
		return "adminSystemMessge";
	}
	//+++++++++++++++++++++++++

	/**
	 *  返回管理考试视图
	 * @return
	 */
	@RequestMapping("/adminExamManage")
	public String adminExamManage(HttpServletRequest request){
		getMessage(request);
		return "adminExamManage";
	}
	
	/**
	 *  返回管理考试成绩视图
	 * @return
	 */
	@RequestMapping("/adminGradeManage")
	public String adminGradeManage(HttpServletRequest request){
		getMessage(request);
		return "adminGradeManage";
	}
	
	/**
	 *  返回管理考试消息视图
	 * @return
	 */
	@RequestMapping("/adminExamMessage")
	public String adminExamMessage(HttpServletRequest request){
		
		//设置系统消息为已读 3为考试消息
		systemMessageService.setMessageReaded(3);
		//设置消息状态
		getMessage(request);
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
	
	@RequestMapping("/exportExcelWrite")
	public String exportExcelWrite(HttpServletRequest request){	
		
		String data=request.getParameter("data");
		
		
		List<List<String>>datacol=new ArrayList();       //存数据的每一行每一列
		
		String[] dataArry=data.split("#");
		for(int i=0;i<dataArry.length;i++) 
		{
			String[] dataAr=dataArry[i].split("`");
			List<String> list = new ArrayList();
			for(int j = 0;j<dataAr.length;j++){
				
				list.add(dataAr[j]);
				
			}
			//List datarow = Arrays.asList(dataAr);	
		//	datacol.add(datarow);
			datacol.add(list);
		}
		SimpleExcelWrite.ListListData.addAll(datacol);
			
		return "exportExcelWrite";
	}
	
	
	@RequestMapping("/allExportExcelWrite")
	public String allExportExcelWrite(HttpServletRequest request){	
		
		List<List<String>>datacol=new ArrayList();       //存数据的每一行每一列
		
		List<String> list = new ArrayList();
		list.add("序 号");
		list.add("用户名");
		list.add("真实姓名");
		list.add("考试开始时间");
		list.add("考试结束时间");
		list.add("考试成绩");
		list.add("总分");
		datacol.add(list);
		List<ExamWithCustomerBean> examWithCustomerList = examService.getAllExamWithCustomer();
		int i =1;
		for(ExamWithCustomerBean examWithCustomer:examWithCustomerList){
			List<String> list2 = new ArrayList();
			list2.add(""+i);
			list2.add(examWithCustomer.getCustomer().getUsername());
			list2.add(examWithCustomer.getCustomer().getRealName());
			list2.add(DateUtil.SqlDateToLocalDate(examWithCustomer.getStartTime()));
			list2.add(DateUtil.SqlDateToLocalDate(examWithCustomer.getEndTime()));
			list2.add(examWithCustomer.getScore().toString());
			list2.add(examWithCustomer.getAllScore().toString());
			datacol.add(list2);
			i++;
		}
		SimpleExcelWrite.ListListData.addAll(datacol);
			
		return "exportExcelWrite";
	}
	
	/**
	 *  获取消息信息
	 */
	public void getMessage (HttpServletRequest request){
		
		long examMessage = 0;
		//根据用户设置的消息范围获取消息
		int messageRange = adminSetingSerivce.getMsgSeting();
		String range = "0000"+Integer.toBinaryString(messageRange);
		String rangBinartStr = range.substring(range.length()-4);
		List<Integer> list1 = new ArrayList();
		List<Integer> list2 = new ArrayList();
		if(rangBinartStr.substring(0, 1).equals("0")){
			list2.add(3);
			
			//获取未读的考试消息
			examMessage = systemMessageService.getMessgeCountByType(list2);
		}
		if(rangBinartStr.substring(1, 2).equals("0")){
			list1.add(2);
		}
		if(rangBinartStr.substring(2, 3).equals("0")){
			list1.add(1);
		}
		if(rangBinartStr.substring(3, 4).equals("0")){
			list1.add(0);
		}
		
		//获取未读系统消息
		long systemMessage = systemMessageService.getMessgeCountByType(list1);
		request.getSession().setAttribute("systemMessage", systemMessage);
		request.getSession().setAttribute("examMessage", examMessage);
	}
	
}
