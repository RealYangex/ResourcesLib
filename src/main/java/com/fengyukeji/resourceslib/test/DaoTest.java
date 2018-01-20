package com.fengyukeji.resourceslib.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.bean.SubjectAnwserBean;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
import com.fengyukeji.resourceslib.service.ExamService;
import com.fengyukeji.resourceslib.service.ResourceService;

/**
 * 测试dao层
 * @author xt
 *
 * 2017年11月17日
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"classpath:applicationContext.xml"})
public class DaoTest {
	@Autowired
	ResourceService re ;
	@Autowired
	ExamService examService ;
	@Test
	public void testQuestionAnwser(){
		
		List<SubjectWithAnwserBean> subjectAnwserList = examService.getSubjectWithAnwserByType(0,3);
		for(SubjectWithAnwserBean SubjectAnwser:subjectAnwserList){
			System.out.println(SubjectAnwser);
		}
		
	}
	
	@Test
	public void testQuestion(){
		
		List<SubjectAnwserBean> subjectAnwserList = examService.getSubjectAnwser(0);
		for(SubjectAnwserBean SubjectAnwser:subjectAnwserList){
			System.out.println(SubjectAnwser);
		}
		
	}
	
	@Test
	public void  rtr() {
		
		re.getFile(1);
	}
}
