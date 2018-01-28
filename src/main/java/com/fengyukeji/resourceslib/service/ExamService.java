package com.fengyukeji.resourceslib.service;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.AnwserExample;
import com.fengyukeji.resourceslib.bean.Exam;
import com.fengyukeji.resourceslib.bean.ExamExample;
import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.ExamWithCustomerBean;
import com.fengyukeji.resourceslib.bean.ExamresExam;
import com.fengyukeji.resourceslib.bean.ExamresExamExample;
import com.fengyukeji.resourceslib.bean.Message;
import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
import com.fengyukeji.resourceslib.dao.AnwserMapper;
import com.fengyukeji.resourceslib.dao.CustomerMapper;
import com.fengyukeji.resourceslib.dao.ExamMapper;
import com.fengyukeji.resourceslib.dao.ExamScheduleMapper;
import com.fengyukeji.resourceslib.dao.ExamresExamMapper;
import com.fengyukeji.resourceslib.dao.MessageMapper;
import com.fengyukeji.resourceslib.dao.SubjectMapper;

/**
 * 考试服务类
 * @author xt
 *
 * 2018年1月18日
 */
@Service
public class ExamService {
	public static int ANWSER_SHOW_NUM = 6; 
	
	public static int EAXM_SHOW_NUM = 11; 
	
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
	
	@Autowired
	MessageMapper messageMapper;
	
	@Autowired
	CustomerMapper customerMapper;
	/**
	 * 获取答案和
	 * @return
	 */
	public List<SubjectAnwserBean> getSubjectAnwser(Integer pageIndex) {
		
		List<SubjectAnwserBean>  saList = new ArrayList();
		List<Anwser>  aList = new ArrayList();
		
		List<SubjectWithAnwserBean> subWithAnwserList = subjectMapper.selectSubjectWithAnwser(pageIndex*ANWSER_SHOW_NUM,ANWSER_SHOW_NUM);
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
		
		return subjectMapper.selectSubjectWithAnwser(pageIndex,ANWSER_SHOW_NUM);
	}
	
	/**
	 * 获取携带答案的问题
	 * @return
	 */
	public List<SubjectWithAnwserBean> getSubjectWithAnwserByType(Integer pageIndex,Integer page) {
		
		return subjectMapper.selectSubjectWithAnwserByType(pageIndex,page,ANWSER_SHOW_NUM);
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
	 * 根据关键词查询 题目和答案
	 * @param insearchKey
	 * @return
	 */
	public List<SubjectAnwserBean> getSubjectAnwserBys(String insearchKey) {
		List<SubjectAnwserBean>  saList = new ArrayList();
		List<Anwser>  aList = new ArrayList();
		List<SubjectWithAnwserBean> subWithAnwserList = subjectMapper.selectSubjectWithAnwserByInseachKey("%"+insearchKey+"%", ANWSER_SHOW_NUM);
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
	public Float disposeExamResult(Integer examId, List<String[]> list,Float subTotalScore,Integer exasubId) {
	    Float totalScore=0f;//记录总分
	    int trueNum=0;      //记录做对几题
	   
	   Integer resExamId= examresExamMapper.selectByPrimaryKey(exasubId).getExamId();
	    for(int i=0;i<list.size();i++) {
	    	String T[]=list.get(i);
	    	ExamresExamExample example=new  ExamresExamExample();
	    	example.createCriteria().andExamIdEqualTo(resExamId).andSubjectIdEqualTo(Integer.parseInt(T[0]));
	    	 
	    	ExamresExam examresExam=new ExamresExam();
	    	examresExam.setUserAnwser(T[3]);
			examresExamMapper.updateByExampleSelective(examresExam, example);
	    	
	    	
	    	
	    	Subject subject=subjectMapper.selectByPrimaryKey(Integer.parseInt(T[0]));
	    	if((T[1].equals("1"))&&(T[2].equals("1"))) {
	    		trueNum++;
	    		 subject.setId(Integer.parseInt(T[0]));
	    		 subject.setSubjectDoes(subject.getSubjectDoes()+1);	
	    		 subject.setSubjectSuccesses(subject.getSubjectSuccesses()+1);
	    	} 
	    	if((T[1].equals("1"))&&(T[2].equals("0"))) {
	    		 subject.setId(Integer.parseInt(T[0]));
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
	   Integer  customerId=examMapper.selectByPrimaryKey(examId).getCustomerId();
	   String username=customerMapper.selectByPrimaryKey(customerId).getUsername();
	   
	   Message msg=new Message();
	   msg.setCustomerId(customerId);
	   msg.setTime(date);
	   msg.setContent("用户"+username+"：完成了考试！");
	   msg.setType(3);
	   msg.setIsReaded(0);
	   messageMapper.insertSelective(msg);
	   return  totalScore;
	}
	
	/**
	 * 获取考试信息
	 * @param pageIndex 页数索引
	 * @return
	 */
	public List<ExamWithCustomerBean> getExamWithCustomer(Integer pageIndex) {
		return examMapper.selectEaxmWithCustomer(pageIndex*EAXM_SHOW_NUM, EAXM_SHOW_NUM);
	}
	
	/**
	 * 获取考试记录条数
	 * @return
	 */
	public long getExamCount() {
		return examMapper.countByExample(null);
	}
	
	/**
	 * 根据id 删除考试记录
	 * @param id
	 */
	public void deleteEaxmById(Integer id) {
		examMapper.deleteByPrimaryKey(id);
	}
	
	/**
	 * 获取所有的考试记录 
	 * @return
	 */
	public List<ExamWithCustomerBean> getAllExamWithCustomer() {
		return examMapper.selectAllExamWithCustomer();
	}
	
	/**
	 * 根据分数高低来获取数据
	 * @param pageIndex
	 * @param string
	 * @return
	 */
	public List<ExamWithCustomerBean> getExamWithCustomerSortByScore(
			Integer pageIndex, String sort) {
		if(sort.equals("up")){
			return examMapper.selectEaxmWithCustomerSortByScoreUp(pageIndex*EAXM_SHOW_NUM, EAXM_SHOW_NUM);
		}else{
			return examMapper.selectEaxmWithCustomerSortByScoreDown(pageIndex*EAXM_SHOW_NUM, EAXM_SHOW_NUM);
		}
	}

	/**
	 * 获取考试选的答案
	 * @param request
	 * @return
	 */
	public List<ExamresExam> getExamAnswer( Integer id) {
		Integer examSubjectId=examMapper.selectByPrimaryKey(id).getExamSubjectId();
		Integer examId=examresExamMapper.selectByPrimaryKey(examSubjectId).getExamId();
		ExamresExamExample example=new ExamresExamExample();
		example.createCriteria().andExamIdEqualTo(examId);
		List<ExamresExam> examresExam=examresExamMapper.selectByExample(example);
		
		return examresExam;
	}

	/**
	 * 获取用户考试的题目
	 * @param request
	 * @return
	 */
	public List<Subject> getExamSubject(Integer id) {
		Integer examSubjectId=examMapper.selectByPrimaryKey(id).getExamSubjectId();
		Integer examId=examresExamMapper.selectByPrimaryKey(examSubjectId).getExamId();
		ExamresExamExample example=new ExamresExamExample();
		example.createCriteria().andExamIdEqualTo(examId);
		List<ExamresExam> examresExam=examresExamMapper.selectByExample(example);
		List<Subject> subjectList=new ArrayList<Subject>();
		for(int i=0;i<examresExam.size();i++) {
			Integer subId=examresExam.get(i).getSubjectId();
			Subject subject=subjectMapper.selectByPrimaryKey(subId);
			
			AnwserExample Aexample=new AnwserExample();
			Aexample.createCriteria().andSubjectIdEqualTo(subId);
			List<Anwser> anwserList= anwserMapper.selectByExample(Aexample);
			subject.setAnwserList(anwserList);
			subjectList.add(subject);
		}
		
		return subjectList;
	}
}
