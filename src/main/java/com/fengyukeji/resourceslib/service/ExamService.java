package com.fengyukeji.resourceslib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.dao.SubjectMapper;

/**
 * 考试服务类
 * @author xt
 *
 * 2018年1月18日
 */
@Service
public class ExamService {
	
	@Autowired
	SubjectMapper subjectMapper;
	
	/**
	 * 获取答案和
	 * @return
	 */
	public List<SubjectAnwserBean> getSubjectAnwser(Integer pageIndex) {
		System.out.println(subjectMapper);
		subjectMapper.selectSubjectAnwser(pageIndex);
		return subjectMapper.selectSubjectAnwser(pageIndex);
	}
	
	/**
	 * 获取携带答案的问题
	 * @return
	 */
	public List<Subject> getSubjectWithAnwser() {
		
		return subjectMapper.selectSubjectWithAnwser();
	}

		
}
