package com.fengyukeji.resourceslib.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.AdminSet;
import com.fengyukeji.resourceslib.bean.AdminSetExample;
import com.fengyukeji.resourceslib.dao.AdminSetMapper;

/**
 *AdminSetingService
 * @author 
 *
 * 2018年1月15日
 */
@Service
public class AdminSetingService {
	@Autowired
	AdminSetMapper adminSetMapper;

	
	/**
	 * 消息设置
	 * @return
	 * @throws
	 */
	public void msgSeting(Integer value) {
		AdminSetExample example = new AdminSetExample();
		example.createCriteria().andIdEqualTo(1);
		AdminSet adminSet=  new AdminSet();
		adminSet.setMessageRange(value);
		adminSetMapper.updateByExampleSelective(adminSet, example);
		
	}

	/**
	 * 访问设置
	 * @return
	 * @throws
	 */
	public void vistSeting(Integer value) {
		AdminSetExample example = new AdminSetExample();
		example.createCriteria().andIdEqualTo(1);
		AdminSet adminSet=  new AdminSet();
		adminSet.setVisitAuthority(value);
		adminSetMapper.updateByExampleSelective(adminSet, example);
		
	}

	/**
	 * 获取访问设置
	 * @return
	 * @throws
	 */
	public Integer getVistSeting() {
		return adminSetMapper.selectByExample(null).get(0).getVisitAuthority();
	}
	
	/**
	 * 获取消息范围
	 * @return
	 */
	public Integer getMsgSeting() {
		
		return adminSetMapper.selectByExample(null).get(0).getMessageRange();
	}
	
	
}
