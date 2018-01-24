package com.fengyukeji.resourceslib.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Anwser;
import com.fengyukeji.resourceslib.bean.Subject;
import com.fengyukeji.resourceslib.bean.SubjectWithAnwserBean;
import com.fengyukeji.resourceslib.dao.AnwserMapper;
import com.fengyukeji.resourceslib.dao.SubjectMapper;
import com.fengyukeji.resourceslib.utils.SimpleExcelWrite;

/**
 * subject Service
 * @author xt
 *
 * 2018年1月21日
 */
@Service
public class SubjectService {
	
	@Autowired
	SubjectMapper subjectMapper;
	
	@Autowired
	AnwserMapper anwserMapper;
	/**
	 * 根据id删除问题以及答案
	 * @param id
	 */
	public void deleteSubjectAnwser(Integer id) {
		subjectMapper.deleteByPrimaryKey(id);
	}
	
	/**
	 * 根据问题内容插入问题 返回自增长
	 * @param subject
	 * @return
	 */
	public Integer addSubect(Subject subject) {
		subjectMapper.insertSelective(subject);
		Integer id = subject.getId();
		return id;
	}
	
	/**
	 * 批量录入
	 */
	public boolean insertConfirm() {
		SimpleExcelWrite simpleExcel = new SimpleExcelWrite();
		List<SubjectWithAnwserBean> confirmList = simpleExcel.readExcel();
		if(confirmList==null) return false;
		for(SubjectWithAnwserBean sub:confirmList){
			String subjectContent = sub.getSubjectContent();
			Subject subject = new Subject(null, subjectContent, 1, null, null, null, null);
			subjectMapper.insertSelective(subject);
			Integer id = subject.getId();
			List<Anwser> anwserList = sub.getAnwserList();
			for(Anwser anwser:anwserList){
				anwser.setSubjectId(id);
				anwserMapper.insertSelective(anwser);
			}
		}
		return true;
	}
	
}
