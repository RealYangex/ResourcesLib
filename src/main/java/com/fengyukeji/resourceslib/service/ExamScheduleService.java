package com.fengyukeji.resourceslib.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.ExamExample;
import com.fengyukeji.resourceslib.bean.ExamSchedule;
import com.fengyukeji.resourceslib.bean.ExamScheduleExample;
import com.fengyukeji.resourceslib.dao.ExamScheduleMapper;

/**
 * 考试安排
 * @author jh
 *
 * 2018年1月19日
 */
@Service
public class ExamScheduleService {
	@Autowired
	ExamScheduleMapper examScheduleMapper;

	
	/**
	 * 获取考试安排
	 * @return
	 */
	public List<ExamSchedule> getExamSchedule() {
		
		return examScheduleMapper.selectByExample(null);
	}

	/**
	 * 获添加考试安排
	 * @return
	 */
	public void addExamSchedule(Date startTime, Date endTime, Integer examTotalTime, Integer topicType,
			Integer topicNum, Float topicScore) {
		ExamSchedule  examSchedule=new ExamSchedule();
		examSchedule.setExamStartDate(startTime);
		examSchedule.setExamEndDate(endTime);
		examSchedule.setExamTime(examTotalTime);
		examSchedule.setExamType(topicType);
		examSchedule.setExamSubjectNum(topicNum);
		examSchedule.setExamAllScore(topicScore);
		examSchedule.setIsUse(0);
		
		examScheduleMapper.insertSelective(examSchedule);
	}

	/**
	 * 删除考试安排
	 * @return
	 */
	public void delExamSchedule(Integer id) {
		ExamScheduleExample example=new ExamScheduleExample();
		example.createCriteria().andIdEqualTo(id);
		examScheduleMapper.deleteByExample(example);
	}
	/**
	 * 考试安排开启与关闭
	 * @return
	 */
	public void isUseExamSchedule(Integer id,Integer state) {
		ExamSchedule examSchedule=new ExamSchedule();
		
	    if(state==1) {
			state=0;
		} 
		else if(state==0){
			state=1;
		}
	    
	    examSchedule.setIsUse(state);
	    examSchedule.setId(id);

		examScheduleMapper.updateByPrimaryKeySelective(examSchedule);
	}

	/**
	 * 在线考试获取考试安排
	 * @return
	 */
	public List<Float> getExamSchOnline() {
		Date date=new Date();
	    ExamScheduleExample examp=new ExamScheduleExample();
	    examp.createCriteria().andIsUseEqualTo(1).andExamStartDateLessThanOrEqualTo(date);
	    List<ExamSchedule> schList=examScheduleMapper.selectByExample(examp);
	    List<Float> list=new ArrayList<Float>();
	    if(schList.isEmpty()) {
	    	list.add(0f);
	        list.add(Float.parseFloat(schList.get(0).getExamTime().toString()));
	    }
	    else {
	    	list.add(Float.parseFloat(schList.get(0).getId().toString()));
	    	list.add(Float.parseFloat(schList.get(0).getExamTime().toString()));
	    	list.add(Float.parseFloat(schList.get(0).getExamAllScore().toString()));
	    	list.add(Float.parseFloat(schList.get(0).getExamSubjectNum().toString()));
	    }
		    return list;
	}
	
	
}
