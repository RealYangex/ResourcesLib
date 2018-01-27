package com.fengyukeji.resourceslib.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Message;
import com.fengyukeji.resourceslib.bean.MessageExample;
import com.fengyukeji.resourceslib.dao.MessageMapper;

/**
 * SystemMessgeService
 * @author jh
 *
 * 2018年1月13日
 */
@Service
public class SystemMessgeService {
	@Autowired
	MessageMapper messageMapper;

	/**
	 * 获取所有系统消息
	 * @param customer
	 * @return 
	 */
	public List<Message> getAllSystemMessge(Integer msgTypeSel) {
		MessageExample example=new MessageExample();
		if(msgTypeSel==0)
		   example.createCriteria().andTypeBetween(0, 2);
		else if(msgTypeSel==1)
		   example.createCriteria().andTypeBetween(0, 0);
		else if(msgTypeSel==2)
		   example.createCriteria().andTypeBetween(1, 1);
		else if(msgTypeSel==3)
			example.createCriteria().andTypeBetween(2, 2);
		else if(msgTypeSel==4)
			example.createCriteria().andTypeBetween(3, 3);
		example.setOrderByClause("id desc");
		return messageMapper.selectByExample(example);
	}

	/**
	 * 添加系统消息
	 * @param customer
	 * @return 
	 */
	public void addSystemMessge() {	
		Message msg1=new Message();
		
		msg1.setContent("人民日报：当高铁屡屡被阻，你们又要求警察强硬了？对不起");
		msg1.setCustomerId(78);
		msg1.setIsReaded(1);
		msg1.setTime(new Date());
		msg1.setType(3);
		
		messageMapper.insertSelective(msg1);
	}

	/**
	 * 根据ID删除消息
	 * @return
	 */
	public void deleteOneMessge(Integer msgId) {
		
		messageMapper.deleteByPrimaryKey(msgId);
	}


	/**
	 * 改变消息授权状态
	 * @return
	 */
	public void changeAgreeState(Integer msgId) {
		Message message=new Message();
		message.setCustomerId(0);
		message.setId(msgId);
		messageMapper.updateByPrimaryKeySelective(message);
	}
	
	
	/**
	 * 删除所有考试消息
	 * @return
	 */
	public void deleteAllExmMessge(Integer msgType) {
		System.out.println(msgType);
		MessageExample example=new MessageExample();
		 example.createCriteria().andTypeEqualTo(msgType);
		 messageMapper.deleteByExample(example);
	}
	
	public void insertMessage(Message message) {
		messageMapper.insertSelective(message);
	}
	

}
