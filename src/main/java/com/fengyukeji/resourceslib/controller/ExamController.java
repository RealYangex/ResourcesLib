package com.fengyukeji.resourceslib.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
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
	@RequestMapping("getSubjectAnwser")
	public Msg getSubjectAnwser(HttpServletRequest request){
		Integer pageIndex = Integer.parseInt(request.getParameter("page"));
		List<SubjectAnwserBean> subjectAnwserList = examService.getSubjectAnwser(pageIndex);
		
		return Msg.success();
	}
}
