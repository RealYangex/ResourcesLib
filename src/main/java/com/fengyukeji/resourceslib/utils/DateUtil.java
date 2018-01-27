package com.fengyukeji.resourceslib.utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间工具类
 * @author xt
 *
 * 2018年1月12日
 */
public class DateUtil {
	
	/**
	 * 获取当前数据库格式的时间戳
	 * @return
	 */
	public static Timestamp getNowSqlDate(){
		return new java.sql.Timestamp(new Date().getTime());
	}
	
	/**
	 * 获取当前数据库格式的时间戳
	 * @return
	 */
	public static String SqlDateToLocalDate(Date date){
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
		String dateString = dateformat.format(date);
		return dateString;
	}
}
