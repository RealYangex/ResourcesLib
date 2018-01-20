package com.fengyukeji.resourceslib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
import com.fengyukeji.resourceslib.service.ExamScheduleService;
import com.fengyukeji.resourceslib.service.ExamService;
import com.fengyukeji.resourceslib.utils.Msg;

/**
 * 
 * @author xt
 *
 * 2018年1月18日
 */
@Controller
@RequestMapping("/Exam")
public class ExamController {
	
	@Autowired
	ExamService examService;
	
	@Autowired
	ExamScheduleService examScheduleService;
	/**
	 * 获取题目答案
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getSubjectAnwser")
	public Msg getSubjectAnwser(HttpServletRequest request){
		Integer page = Integer.parseInt(request.getParameter("page"));
		List<SubjectAnwserBean> subjectList = examService.getSubjectAnwser(page);
		long subjectCount = examService.getAnwserCount();
		return Msg.success().add("subjectAnwsers", subjectList).add("subjectCount", subjectCount).add("showNum", ExamService.SHOW_NUM);
	}

	/**
	 * 获取考试安排
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getExamSchedule")
	public Msg getExamSchedule(){
		List<ExamSchedule> ExamScheduleList = examScheduleService.getExamSchedule();
		return Msg.success().add("schList", ExamScheduleList);
	}
	
	/**
	 * 添加考试安排
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addExamSchedule")
	public Msg addExamSchedule(HttpServletRequest request) throws ParseException{
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		Date startTime=sdf.parse(request.getParameter("startTime"));
		Date endTime=sdf.parse(request.getParameter("endTime"));
		
		Integer examTotalTime=Integer.parseInt(request.getParameter("examTotalTime"));
		Integer topicType=Integer.parseInt(request.getParameter("topicType"));
		Integer topicNum=Integer.parseInt(request.getParameter("topicNum"));
		Float topicScore=Float.parseFloat(request.getParameter("topicScore"));
		
		examScheduleService.addExamSchedule(startTime,endTime,examTotalTime,topicType,topicNum,topicScore);
		return Msg.success();
	}
	
	/**
	 * 删除考试安排
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delExamSchedule")
	public Msg delExamSchedule(HttpServletRequest request) {
		Integer id= Integer.parseInt(request.getParameter("id"));
		examScheduleService.delExamSchedule(id);
		return Msg.success();
	}
	
	/**
	 * 考试安排开启与关闭
	 * @return
	 */
	@ResponseBody
	@RequestMapping("isUseExamSchedule")
	public Msg isUseExamSchedule(HttpServletRequest request) {
		Integer id= Integer.parseInt(request.getParameter("id"));
		Integer state= Integer.parseInt(request.getParameter("state"));

		examScheduleService.isUseExamSchedule(id,state);
		return Msg.success();
	}
}
