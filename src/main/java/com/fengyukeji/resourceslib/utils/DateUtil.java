package com.fengyukeji.resourceslib.utils;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 时间工具类
 * @author xt
 *
 * 2018年1月12日
 */
public class DateUtil {
	
	public static Timestamp getNowSqlDate(){
		return new java.sql.Timestamp(new Date().getTime());
	}
}
