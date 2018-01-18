package com.fengyukeji.resourceslib.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.resAdminSet;
import com.fengyukeji.resourceslib.dao.resAdminSetMapper;

/**
 *AdminSetingService
 * @author 
 *
 * 2018年1月15日
 */
@Service
public class AdminSetingService {
	@Autowired
	resAdminSetMapper adminSetMapper;

	
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
	
	
}
