package com.fengyukeji.resourceslib.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		
	}

	/**
	 * 访问设置
	 * @return
	 * @throws
	 */
	public void vistSeting(Integer value) {
		
		
	}

	/**
	 * 获取访问设置
	 * @return
	 * @throws
	 */
	public Integer getVistSeting() {
		return adminSetMapper.selectByExample(null).get(0).getVisitAuthority();
	}
	
	
}
