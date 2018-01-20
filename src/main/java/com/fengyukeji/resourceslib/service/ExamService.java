package com.fengyukeji.resourceslib.service;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
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
		
}
