package com.fengyukeji.resourceslib.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.Exam;
import com.fengyukeji.resourceslib.bean.ExamExample;
import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.ExamresExam;
import com.fengyukeji.resourceslib.bean.ExamresExamExample;
import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
import com.fengyukeji.resourceslib.dao.AnwserMapper;
import com.fengyukeji.resourceslib.dao.ExamMapper;
import com.fengyukeji.resourceslib.dao.ExamScheduleMapper;
import com.fengyukeji.resourceslib.dao.ExamresExamMapper;
import com.fengyukeji.resourceslib.dao.SubjectMapper;

/**
 * 考试服务类
 * @author xt
 *
 * 2018年1月18日
 */
@Service
public class ExamService {
	public static int SHOW_NUM = 6; 
	
	@Autowired
	SubjectMapper subjectMapper;
	@Autowired
	ExamScheduleMapper examScheduleMapper;
	@Autowired
	ExamMapper examMapper;
	@Autowired
	AnwserMapper anwserMapper;
	@Autowired
	ExamresExamMapper examresExamMapper; 
	/**
	 * 获取答案和
	 * @return
	 */
	public List<SubjectAnwserBean> getSubjectAnwser(Integer pageIndex) {
		
		List<SubjectAnwserBean>  saList = new ArrayList();
		List<Anwser>  aList = new ArrayList();
		
		List<SubjectWithAnwserBean> subWithAnwserList = subjectMapper.selectSubjectWithAnwser(pageIndex,SHOW_NUM);
		for(SubjectWithAnwserBean sab :subWithAnwserList){
			aList = sab.getAnwserList();
			String trueAnwser = "";
			String anwser = "";
			List<String>  strList = new ArrayList();
			for(Anwser a:aList){
				
				if(a.getIsTrue()==true){
					trueAnwser = a.getAnwserContent();
				}
				//anwser+=a.getAnwserContent()+";";
				strList.add(a.getAnwserContent());
			}
			saList.add(new SubjectAnwserBean(sab.getId(), sab.getSubjectContent(), sab.getSubjectType(), sab.getSubjectDoes(), sab.getSubjectSuccesses(), sab.getSubjectError(), strList, trueAnwser));
		}
		return saList;
	}
	
	/**
	 * 获取携带答案的问题
	 * @return
	 */
	public List<SubjectWithAnwserBean> getSubjectWithAnwser(Integer pageIndex) {
		
		return subjectMapper.selectSubjectWithAnwser(pageIndex,SHOW_NUM);
	}
	
	/**
	 * 获取携带答案的问题
	 * @return
	 */
	public List<SubjectWithAnwserBean> getSubjectWithAnwserByType(Integer pageIndex,Integer page) {
		
		return subjectMapper.selectSubjectWithAnwserByType(pageIndex,page,SHOW_NUM);
	}
	
	/**
	 * 获取试题库题目数量
	 * @return
	 */
	public long getAnwserCount(){
		return subjectMapper.countByExample(null);
	}

	/**
	 * 初始化Exam
	 * @return
	 */
	public List<Float> initializeExam(Integer userId,Integer schId) {
		ExamSchedule schedule=examScheduleMapper.selectByPrimaryKey(schId);
		Exam exam=new Exam();
		exam.setCustomerId(userId);
		Date date=new Date();
		exam.setStartTime(date);
		exam.setAllScore(schedule.getExamAllScore());
		exam.setScore(0f);
		examMapper.insertSelective(exam);
		
		ExamExample example=new ExamExample();
		example.createCriteria().andCustomerIdEqualTo(userId);
	
		List<Exam> exaM=examMapper.selectByExample(example);
		Integer getId=exaM.get(exaM.size()-1).getId();
		
		List<Float> list=new ArrayList<Float>();
		list.add(Float.parseFloat(getId.toString()));
		list.add(Float.parseFloat(schedule.getExamSubjectNum().toString()));
		list.add(schedule.getExamAllScore());
		return list;//返回考试题目数量和考生考试记录ID
	}

	/**
	 * 获取考试题目
	 * @return
	 */
	public List<SubjectAnwserBean> getExamSubject() {
		List<SubjectAnwserBean>  saList = new ArrayList();
		List<Anwser>  aList = new ArrayList();
		int SUBNUM=subjectMapper.selectByExample(null).size();

		List<SubjectWithAnwserBean> subWithAnwserList = subjectMapper.selectSubjectWithAnwser(1,SUBNUM);
		for(SubjectWithAnwserBean sab :subWithAnwserList){
			aList = sab.getAnwserList();
			String trueAnwser = "";
			String anwser = "";
			List<String>  strList = new ArrayList();
			for(Anwser a:aList){
				
				if(a.getIsTrue()==true){
					trueAnwser = a.getAnwserContent();
				}
				strList.add(a.getAnwserContent());
			}
			saList.add(new SubjectAnwserBean(sab.getId(), sab.getSubjectContent(), sab.getSubjectType(), sab.getSubjectDoes(), sab.getSubjectSuccesses(), sab.getSubjectError(), strList, trueAnwser));
		}
		return saList;
	}

	/**
	 * 记录题目ID
	 * @return 
	 * @return
	 */
	public Integer addExamIdandSubId(List<SubjectAnwserBean> subList) {
	
		List<ExamresExam> list=examresExamMapper.selectByExample(null);
		Integer maxId=0;
		
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getExamId()>maxId)
				maxId=list.get(i).getExamId();
		}
		maxId++;
		
		for(int i=0;i<subList.size();i++) {
			ExamresExam examresExam=new ExamresExam();
			examresExam.setExamId(maxId);
			examresExam.setSubjectId(subList.get(i).getId());
			examresExamMapper.insertSelective(examresExam);
		}
		ExamresExamExample example=new ExamresExamExample();
		example.createCriteria().andExamIdEqualTo(maxId);
		Integer exasubId = examresExamMapper.selectByExample(example).get(0).getId();
		return exasubId;//返回本套题目ID
	}

	/**
	 * 处理考试结果
	 * @return 
	 * @return
	 */
	public Float disposeExamResult(Integer examId, List<Integer[]> list,Float subTotalScore,Integer exasubId) {
	    Float totalScore=0f;//记录总分
	    int trueNum=0;      //记录做对几题
	    
	    for(int i=0;i<list.size();i++) {
	    	Integer T[]=list.get(i);
	    	Subject  subject=subjectMapper.selectByPrimaryKey(T[0]);
	    	if((T[1]==1)&&(T[2]==1)) {
	    		trueNum++;
	    		 subject.setId(T[0]);
	    		 subject.setSubjectDoes(subject.getSubjectDoes()+1);	
	    		 subject.setSubjectSuccesses(subject.getSubjectSuccesses()+1);
	    	} 
	    	if((T[1]==1)&&(T[2]==0)) {
	    		 subject.setId(T[0]);
	    		 subject.setSubjectDoes(subject.getSubjectDoes()+1);
	    		 subject.setSubjectError(subject.getSubjectError()+1);
	    	}

			subjectMapper.updateByPrimaryKeySelective(subject);
	   }
	    
	    if(trueNum!=0)
	       totalScore=subTotalScore/list.size()*trueNum;
	    Exam exam=new Exam();
	    exam.setId(examId);
	    exam.setScore(totalScore);
	    exam.setExamSubjectId(exasubId);
	    Date date=new Date();
		exam.setEndTime(date);
	    
	   examMapper.updateByPrimaryKeySelective(exam);
	   return  totalScore;
	}
}
