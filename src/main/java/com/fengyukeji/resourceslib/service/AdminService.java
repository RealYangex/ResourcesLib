package com.fengyukeji.resourceslib.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fengyukeji.resourceslib.bean.Admin;
import com.fengyukeji.resourceslib.bean.AdminExample;
import com.fengyukeji.resourceslib.dao.AdminMapper;

/**
 * adminService
 * @author 
 *
 * 2018年1月15日
 */
@Service
public class AdminService {
	@Autowired
	AdminMapper adminMapper;
	
	public Admin login(String username, String password) {
		AdminExample example = new AdminExample();
		example.createCriteria().andUsernameEqualTo(username).andPasswordEqualTo(password);
		List<Admin> adminList = adminMapper.selectByExample(example);
		if(!adminList.isEmpty()){
			return adminList.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 获取管理员信息
	 * @return
	 */
	public List<Admin> getAdmins() {
		// TODO Auto-generated method stub
		return adminMapper.selectByExample(null);
	}
	/**
	 * 修改管理员信息
	 * @return
	 */
	public void updateAdmin(Integer userid, String username, String password,String realname) 
	{   //调用dao层，修改数据 ，参数为bean层   
		//new Admin(userid,username,password)
		Admin admin= new Admin();
		admin.setUsername(username);
		admin.setId(userid);
		admin.setPassword(password);
		admin.setRealname(realname);
		adminMapper.updateByPrimaryKeySelective(admin);
	}
	
	/**
	 * 添加管理员
	 * @param admin
	 */
	public void addAdmin(Admin admin) {
		adminMapper.insertSelective(admin);
	}
	/**
	 * 删除管理员
	 * @param id
	 */
	public void deleteadmin(Integer id) {
		adminMapper.deleteByPrimaryKey(id);
	}

	/**
	 * 更新登录时间
	 * @param id
	 */
	public void addDateAdminLogin(Integer id, Date logindate) {
		Admin admin=new Admin();
		admin.setId(id);admin.setLastTime(logindate);
		adminMapper.updateByPrimaryKeySelective(admin);
	}

	
	
}
