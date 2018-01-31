package com.fengyukeji.resourceslib.bean;
/**
 * 统计时间对应的提交量 pojo
 * @author xt
 *
 * 2018年1月2日
 */
public class CountByDate {
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private int num;
	private String date;
	public CountByDate(String date,int num) {
		this.num = num;
		this.date = date;
	}
	public CountByDate() {
	}
	
	
}
