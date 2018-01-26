package com.fengyukeji.resourceslib.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Customer;
import com.fengyukeji.resourceslib.bean.CustomerExample;
import com.fengyukeji.resourceslib.bean.MessageExample;
import com.fengyukeji.resourceslib.dao.CustomerMapper;

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
}
