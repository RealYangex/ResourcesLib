package com.fengyukeji.resourceslib.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.Subject;
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
		System.out.println(subjectList);
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
	
	/**
	 * 在线考试获取考试安排
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getExamSchOnline")
	public Msg getExamSchOnline(HttpServletRequest request,HttpSession session) {
		 List<Integer> schList=examScheduleService.getExamSchOnline();
		 session.setAttribute("schTime", schList.get(1));
		return Msg.success().add("schId", schList.get(0));
	}
	
	/**
	 * 初始化Exam并返回考试题目
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getExamSubject")
	public Msg initializeExam(HttpServletRequest request,HttpSession session) {
		//初始化用户信息
		Integer UserId= Integer.parseInt(request.getParameter("UserId"));
		Integer schId= Integer.parseInt(request.getParameter("schId"));
		List<Float> subjectNumAndExamIdList=examService.initializeExam(UserId,schId);
		
		String ExamId =subjectNumAndExamIdList.get(0).toString();
		int start=ExamId.indexOf(".");
		ExamId=ExamId.substring(0,start);
	    Integer examId=Integer.parseInt(ExamId);  //考生考试记录ID
	    String SubjectNum=subjectNumAndExamIdList.get(1).toString();
	    start=SubjectNum.indexOf(".");
	    SubjectNum=SubjectNum.substring(0,start);
	    Integer subjectNum=Integer.parseInt(SubjectNum);//考试题目数量
		Float subTotalScore=subjectNumAndExamIdList.get(2);
	    
	    List<SubjectAnwserBean> subjectList = examService.getExamSubject();

		//随机选出subjectNum道题存入subList
		int max=subjectList.size();
        int min=0;
        Random random = new Random();
        List<Integer> list = new ArrayList<Integer>();
        while(subjectNum!=0) {
        	int number = random.nextInt(max)%(max-min+1) + min;
        	if(!list.contains(number)){
                list.add(number);
                subjectNum--;
            }
        }
        Collections.sort(list);
 
        List<SubjectAnwserBean> subList=new ArrayList<SubjectAnwserBean>();
	    for(int i=0;i<list.size();i++) {
	    	subList.add(subjectList.get(list.get(i)));
	    }
         
	    //记录题目ID并返回本套题ID
	    Integer exasubId=examService.addExamIdandSubId(subList);
	    session.setAttribute("examId", examId);
	    session.setAttribute("exasubId", exasubId);
	    session.setAttribute("subTotalScore", subTotalScore);
		return Msg.success().add("subExamList", subList ).add("subTotalScore", subTotalScore);
	}

	/**
	 * 处理考试结果
	 * @return
	 */
	@ResponseBody
	@RequestMapping("disposeExamResult")
	public Msg disposeExamResult(HttpServletRequest request,HttpSession session) {
		Integer examId=(Integer) session.getAttribute("examId");//考试记录ID
		Float subTotalScore= (Float) session.getAttribute("subTotalScore");//题目设定的总分
		Integer exasubId=(Integer) session.getAttribute("exasubId");      //本套题ID
		
		String subId=request.getParameter("subIds");
        subId=subId.substring(0, subId.length()-2);
       
		String[] subIds = subId.split(",#,");
	   
	    List<Integer[]> list=new ArrayList<Integer[]>();
		for(int i=0;i<subIds.length;i++) {
			String[] subIdContent =subIds[i].substring(0,subIds[i].length()).split(",");
			 Integer[] cntInts=new Integer[3];
			for(int j=0;j<subIdContent.length;j++) {
				cntInts[j]=Integer.parseInt(subIdContent[j]);
			}
			list.add(cntInts);
		}
      
	Float totalScore=examService.disposeExamResult(examId,list,subTotalScore,exasubId);
		
		return Msg.success().add("totalScore", totalScore);
	}
}
