package com.fengyukeji.resourceslib.service;

import java.net.UnknownHostException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Customer;
import com.fengyukeji.resourceslib.bean.CustomerExample;
import com.fengyukeji.resourceslib.bean.MessageExample;
import com.fengyukeji.resourceslib.bean.Visit;
import com.fengyukeji.resourceslib.bean.VisitExample;
import com.fengyukeji.resourceslib.dao.CustomerMapper;
import com.fengyukeji.resourceslib.dao.VisitMapper;

/**
 * CustomerService
 * @author jh
 *
 * 2018年1月11日
 */
@Service
public class CustomerService {
	@Autowired
	CustomerMapper customerMapper; 
	
	@Autowired
	VisitMapper visitMapper;
	/**
	 * 保存用户信息
	 * @param customer
	 * @return 
	 */
	public Integer saveCustomerInfo(String userName,String userRealName,String userEmail,String userPassword) {
		Customer customer=new Customer();
		customer.setUsername(userName);
		customer.setPassword(userPassword);
		customer.setRealName(userRealName);
		customer.setEamil(userEmail);
		customer.setCurrentType(2);
		customerMapper.insertSelective(customer);
		Integer id = customer.getId();
		return id;
	}
	/**
	 * 用户登录
	 * @param logindate 
	 * @param customer
	 * @return 
	 */
	public Customer loginCustomer(String userName,String userPassword) {
		CustomerExample  example = new CustomerExample();
		example.createCriteria().andUsernameEqualTo(userName).andPasswordEqualTo(userPassword);
		List<Customer> customerList = customerMapper.selectByExample(example);
		if(!customerList.isEmpty()){
			return customerList.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 获取所有用户信息
	 * @param customer
	 * @return 
	 */
	public List<Customer> getAllCustomer() {
		return customerMapper.selectByExample(null);
	}
	

	/**
	 * 删除某个信息
	 * @param customer
	 * @return 
	 */
	public void deleteOneCustomer(Integer id) {
		customerMapper.deleteByPrimaryKey(id);
	}
	
	/**
	 * 更改用户登录权限信息
	 * @param customer
	 * @return 
	 */
	public void forbidLoginCustomer(Integer id, Integer currentType) {
		Customer customer=new Customer();
		customer.setId(id);
		customer.setCurrentType(currentType);
		customerMapper.updateByPrimaryKeySelective(customer);
		
	}
	
	/**
	 * 更新用户登录时间
	 * @param customer
	 * @return 
	 */
	public void addDateCustomer(Integer id, Date logindate) {
		Customer customer=new Customer();
		customer.setId(id);
		customer.setLastTime(logindate);
		customerMapper.updateByPrimaryKeySelective(customer);
	}
	
	/**
	 * 编辑用户
	 * @param customer
	 * @return 
	 */
	public void editCustomerInfo(Integer id, String name, String realName, String password, String email) {
		Customer customer=new Customer();
		customer.setId(id);
		customer.setUsername(name);
		customer.setRealName(realName);
		customer.setPassword(password);
		customer.setEamil(email);
		
		customerMapper.updateByPrimaryKeySelective(customer);
	}
	
	/**
	 * 授权所有用户登录
	 * @return 
	 * @return
	 */
	public void greenAllLoginCustomer() {
		//MessageExample example=new MessageExample();
		CustomerExample example=new CustomerExample();
		 example.createCriteria().andCurrentTypeEqualTo(2);
		List<Customer> cusList=customerMapper.selectByExample(example);
		
		for(int i=0;i<cusList.size();i++) {
			
			Customer customer=new Customer();
			customer.setId(cusList.get(i).getId());
			customer.setCurrentType(1);
			customerMapper.updateByPrimaryKeySelective(customer);
		}
	}
	
	/**
	 * 获取授权状态 
	 * @return 
	 * @return
	 */
	public Integer getAgreeState(Integer msgId) {
		Customer cus=customerMapper.selectByPrimaryKey(msgId);
		if(cus.getCurrentType()==2)
		    return 0;
		else
			return 1;
	}
	
	/**
	 * 获取所有的用户数量
	 * @return
	 */
	public long getAllCustomerCount() {
		
		return customerMapper.countByExample(null);
	}
	
	/**
	 * 获取访问人次
	 * @return
	 * @throws ParseException 
	 */
	public List<Object> visitCount(Date date, String ip) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//定义要输出日期字符串的
		String sdat=sdf.format(date).substring(0, 10)+" 00:00:00";

		Date dat = null;
		try {
			dat = sdf.parse(sdat);
		} catch (ParseException e) {
			e.printStackTrace();
		} 
		
		VisitExample example=new VisitExample();
		example.createCriteria().andVisitTimeBetween(dat, date).andAddressEqualTo(ip);
		
		List<Visit> visitList=visitMapper.selectByExample(example);
		
		if(visitList.size()==0) {
			Visit record=new Visit();
			record.setVisitTime(date);
			record.setAddress(ip);
			visitMapper.insertSelective(record);
		}
		List<Object> visitCountList =new ArrayList<Object>() ;
	    Integer total=visitMapper.selectByExample(null).size();
	    visitCountList.add(total);
	    
	    VisitExample examplee=new VisitExample();
		examplee.createCriteria().andVisitTimeBetween(dat, date);
		Integer day=visitMapper.selectByExample(examplee).size();
		
		visitCountList.add(day);
		
		return visitCountList;
	}
	
	/**
	 * 获取所有访问记录
	 * @return
	 */
	public long getVisitCount() {
		
		return visitMapper.countByExample(null);
	}
	/**
	 * 校验用户名
	 * @return
	 */
	public boolean checkCustomer(String userName) {
		CustomerExample example=new CustomerExample();
		example.createCriteria().andUsernameEqualTo(userName);
	int isExist=customerMapper.selectByExample(example).size();
	if(isExist==0)
		return false;
	else
		return true;
	}
}
