package com.fengyukeji.resourceslib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
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
}
