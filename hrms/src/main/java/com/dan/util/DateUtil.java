package com.dan.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期类
 * @author gd
 *
 */
public class DateUtil {
	/*
	 * 返回格式化的日期
	 */
	public static Date getDate() throws ParseException {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.parse(sdf.format(date));
	}
}
