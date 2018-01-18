package com.fengyukeji.resourceslib.bean;
/**
 * 登录使用的bean
 * @author xt
 *
 * 2017年10月29日
 */
public class LoginBean {
	private String username;
	private String password;
	private String code;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "LoginBean [username=" + username + ", password=" + password
				+ ", code=" + code + "]";
	}
	
	
}
