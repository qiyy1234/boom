package com.fcst.boom.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * Description:日期操作工具类
 * Copyright (C) 2014 boco.com.cn All Right Reserved.
 * Author：madaoyong
 * Create Date: 2014年12月2日
 * Modified By：
 * Modified Date：
 * Why & What is modified：
 * Version 1.0
 */
public class DateTools {
	
	private static final Logger logger = LoggerFactory.getLogger(DateTools.class.getName());
	
	private final static String[] monthColumn = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
	
	private final static String[] transColumn = {"01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"};

	/**
	 * 日期格式：yyyy-MM-dd HH:mm:ss
	 */
	public static final String COMMON_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 *  日期格式：yyyyMMddHHmmss
	 */
	public static final String COMMON_DATE_FORMAT_TRIM = "yyyyMMddHHmmss";
	
	/**
	 *  日期格式：yyyy-MM-dd
	 */
	public static final String YEAR_MONTH_DAY_DATE = "yyyy-MM-dd";
	
	/**
	 *  日期格式：yyyy-MM
	 */
	public static final String YEAR_MONTH_DATE = "yyyy-MM";
	
	/**
	 *  日期格式：yyyy
	 */
	public static final String YEAR_DATE = "yyyy";
	

	public static Date parser(String strDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		try {
			return sdf.parse(strDate);
		} catch (Exception e) {
			return null;
		}
	}

	public static Date parser(String strDate, String fmt) {
		SimpleDateFormat sdf = new SimpleDateFormat(fmt);
		try {
			return sdf.parse(strDate);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 根据给定格式得到当前日期时间
	 * 
	 * @param fmt
	 *            需要的日期格式
	 * @return 符合格式要求的日期字符串 返回格式一般应为yyyy-MM-dd HH:mm:ss
	 */
	public static String getDateStr(String fmt) {
		Date myDate = new Date(System.currentTimeMillis());
		SimpleDateFormat sDateformat = new SimpleDateFormat(fmt);
		sDateformat.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		return sDateformat.format(myDate);
	}

	/**
	 * 将指定日期格式化
	 * 
	 * @param fmt
	 * @param date
	 * @return
	 */
	public static String getDateStr(String fmt, Date date) {
		SimpleDateFormat sDateformat = new SimpleDateFormat(fmt);
		return sDateformat.format(date);
	}

	public static String getDateByStr(String fromFmt, String toFmt,
			String dateStr) throws ParseException {
		SimpleDateFormat from = new SimpleDateFormat(fromFmt);
		SimpleDateFormat to = new SimpleDateFormat(toFmt);
		Date temp;
		temp = from.parse(dateStr);
		dateStr = to.format(temp);
		return dateStr;
	}

	/**
	 * 将指定日期格式化
	 * 
	 * @param fmt
	 * @param date
	 * @return
	 */
	public static String getDateByStr(String fmt, String dateStr) {
		SimpleDateFormat sDateformat = new SimpleDateFormat(fmt);
		try {
			Date dates = sDateformat.parse(dateStr);
			return sDateformat.format(dates);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dateStr;
	}

	public static String getCommonDateStr(Calendar calendar) {
		if (calendar == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(COMMON_DATE_FORMAT);
		return sdf.format(calendar.getTime());
	}

	public static Calendar getCommonDate(String dateStr) {
		try {
			return getCal(dateStr, COMMON_DATE_FORMAT);
		} catch (Exception ex) {
			return null;
		}
	}

	/**
	 * 把给定的日期字符串转换成Calendar型
	 * 
	 * @param strdate
	 *            给定日期字符串
	 * @param fmt
	 *            给定日期字符串的格式
	 * @return 初始化好的Calendar类
	 * @exception ParseException
	 */

	public static Calendar getCal(String strdate, String fmt) throws Exception {
		Calendar cal = null;
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (strdate == null || fmt == null) {
				throw new Exception("error.app.util.datatools.IncorrectPara",
						null);
			}
			// 根据给定日期格式得到当前时间
			SimpleDateFormat nowDate = new SimpleDateFormat(fmt);
			// 转换为格式为Date类型
			Date d = nowDate.parse(strdate, new java.text.ParsePosition(0));
			// 如果转换返回Date为空则抛出参数解析错误消息
			if (d == null) {
				throw new Exception("error.app.util.datatools.IncorrectParse",
						null);
			}
			// 得到一个Calendar实例
			cal = Calendar.getInstance();
			// Calendar日期归零
			cal.clear();
			// 设定当前时间
			cal.setTime(d);
		} catch (Exception e) { // 此处应该捕获ParseException，由于采用了ParsePosition(0)格式所以此异常不用捕获
			e.printStackTrace();
			throw new Exception(e);
		}
		return cal;

	}

	/**
	 * 给定日期所在周是给定年的第几周
	 * 
	 * @param strdate
	 *            给定的日期字符串
	 * @param fmt
	 *            给定日期的格式
	 * @return 返回整型数字
	 * @exception CommonException
	 */
	public static int getWeekOfYear(String strdate, String fmt)
			throws Exception {
		// 返回值初始化，指定一个小于0的不可能得到的数字
		int ret = -1;
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (strdate == null || fmt == null) {
				throw new Exception("error.app.util.datatools.IncorrectPara",
						null);
			}
			// 根据给定参数转换为Calendar类型
			Calendar cal = getCal(strdate, fmt);
			// 转换异常则返回错误消息
			if (cal == null) {
				throw new Exception(
						"error.app.util.datatools.IncorrectCalendar", null);
			}
			// 得到给定日期所在周是给定年的第几周
			ret = cal.get(Calendar.WEEK_OF_YEAR);
		} catch (Exception e) {
			throw new Exception("error.app.util.datatools.exception", null);
		}
		return ret;

	}

	/**
	 * 给定日期所在周的全部日期
	 * 
	 * @param strdate
	 *            给定的日期字符串
	 * @param oldfmt
	 *            给定日期的格式
	 * @param newfmt
	 *            返回日期的格式
	 * @return 从周一开始到周日的日期
	 * @exception CommonException
	 */
	@SuppressWarnings("static-access")
	public static String[] getWeekDay(String strdate, String oldfmt,
			String newfmt) throws Exception {
		String weekday[] = new String[7];
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (strdate == null || oldfmt == null || newfmt == null) {
				throw new Exception("error.app.util.datatools.IncorrectPara",
						null);
			}
			// 根据给定参数转换为Calendar类型
			Calendar cal = getCal(strdate, oldfmt);
			// 转换异常则返回错误消息
			if (cal == null) {
				throw new Exception(
						"error.app.util.datatools.IncorrectCalendar", null);
			}
			// 得到给定日期是本周的的几天
			int dayOfWeek = cal.get(cal.DAY_OF_WEEK);
			// 修改为中国习惯，从周一开始算一周时间
			cal.add(cal.DATE, -dayOfWeek + 2);
			// 根据参数设定返回格式
			SimpleDateFormat sdf = new SimpleDateFormat(newfmt);
			// 循环得到一周的时间
			weekday[0] = sdf.format(cal.getTime());
			for (int i = 1; i < 7; i++) {
				cal.add(cal.DATE, 1);
				weekday[i] = sdf.format(cal.getTime());
			}
		} catch (IndexOutOfBoundsException iobe) {
			throw new Exception(
					"error.app.util.datatools.IndexOutOfBoundsException", null);
		}
		return weekday;

	}

	/**
	 * 本方法完成得到给定周的全部日期
	 * 
	 * @param year
	 *            给定年
	 * @param week
	 *            给定周
	 * @param newfmt
	 *            返回日期的格式
	 * @return 从周一开始到周日的日期
	 */
	public static String[] getWeekDate(String year, int week, String newfmt)
			throws Exception {
		String jweekday[] = new String[7];
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (year == null || year.length() < 4 || week <= 0
					|| newfmt == null) {
				throw new Exception("error.app.util.datatools.IncorrectPara",
						null);
			}
			// 根据给定参数转换为Calendar类型,起始计算时间调整为当年的1月1日
			Calendar cal = getCal(year + "0101", "yyyyMMdd");
			// 转换异常则返回错误消息
			if (cal == null) {
				throw new Exception(
						"error.app.util.datatools.IncorrectCalendar", null);

			}
			// java类的周计算从0开始，调整正常习惯为java描述需要减1
			week = week - 1;
			// 日期调整至当给定周的第一天
			cal.add(Calendar.DATE, week * 7 - cal.get(Calendar.DAY_OF_WEEK) + 2);
			// 根据参数设定返回格式
			SimpleDateFormat sdf = new SimpleDateFormat(newfmt);
			jweekday[0] = sdf.format(cal.getTime());
			// 循环得到一周的时间
			for (int i = 1; i < 7; i++) {
				cal.add(Calendar.DATE, 1);
				jweekday[i] = sdf.format(cal.getTime());
			}
		} catch (IndexOutOfBoundsException iobe) {
			throw new Exception(iobe.getMessage());
		}
		return jweekday;

	}

	/**
	 * Definition: 获得两个时间段内间隔
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return 间隔分钟数
	 * @throws FrameworkException 
	 * @Author: madaoyong
	 * @Created date: 2014年12月2日
	 */
	public static double getDaysBetweenDate(Date startDate, Date endDate) throws Exception {
		long betweenTime = (endDate.getTime() - startDate.getTime());
//		double day = betweenTime / (24 * 60 * 60 * 1000);
//		double hour = (((double) betweenTime / (60 * 60 * 1000)) - day * 24);
//		double minute = hour * 60;
		return betweenTime/(60*1000);
	}

	/**
	 * Definition:本方法完成计算给定时间之前一段时间的日期时间
	 * @param deftime 给定时间字符串
	 * @param oldfmt 以小时为单位
	 * @param timediff 给定时间的格式
	 * @param newfmt 返回时间的格式
	 * @return 时间字符串
	 * @throws FrameworkException
	 * @Author: madaoyong
	 * @Created date: 2014年12月2日
	 */
	public static String getBeforeTime(String deftime, String oldfmt,
			int timediff, String newfmt) throws Exception {
		String strBeforeTime = null;
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (deftime == null || deftime.equals("")) {
				throw new Exception("error.app.util.datatools.IncorrectPara", null);
			}
			// 根据给定参数转换为Calendar类型
			Calendar cal = getCal(deftime, oldfmt);
			// 转换异常则返回错误消息
			if (cal == null) {
				throw new Exception("error.app.util.datatools.IncorrectCalendar", null);

			}
			// 以分钟计算之前的日期
			cal.add(Calendar.MINUTE, -timediff * 60);
			// 根据参数设定返回格式
			SimpleDateFormat sdf = new SimpleDateFormat(newfmt);
			// 格式化返回日期
			strBeforeTime = sdf.format(cal.getTime());
		} catch (Exception e) {
			throw new Exception("error.app.util.datatools.exception", null);
		}
		return strBeforeTime;

	}

	/**
	 * 获取给定时间之后具体天数的时间
	 * 
	 * @param deftime
	 *            String 指定的时间
	 * @param oldfmt
	 *            String 指定的时间格式
	 * @param timediff
	 *            int 天数
	 * @param newfmt
	 *            String 指定的时间格式
	 * @return String
	 * @throws Exception
	 */
	public static String getAfterTime(String deftime, String oldfmt,
			int timediff, String newfmt) throws Exception {
		String strAfterTime = null;
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (deftime == null || deftime.equals("")) {
				throw new Exception("error.app.util.datatools.IncorrectPara", null);
			}
			// 根据给定参数转换为Calendar类型
			Calendar cal = getCal(deftime, oldfmt);
			// 转换异常则返回错误消息
			if (cal == null) {
				throw new Exception("error.app.util.datatools.IncorrectCalendar", null);
			}
			// 以分钟计算之后的日期
			cal.add(Calendar.MINUTE, +timediff * 60);
			// 根据参数设定返回格式
			SimpleDateFormat sdf = new SimpleDateFormat(newfmt);
			// 格式化返回日期
			strAfterTime = sdf.format(cal.getTime());
		} catch (Exception e) {
			throw new Exception("error.app.util.datatools.exception", null);
		}
		return strAfterTime;

	}

	/**
	 * Definition:本方法完成把给定字符串转换成需要格式，如果不够位数则自动0补满位
	 * @param mydate 给定时间
	 * @param oldfmt 给定时间格式
	 * @param newfmt 返回时间格式
	 * @return 返回时间字符串
	 * @throws FrameworkException
	 * @Author: madaoyong
	 * @Created date: 2014年12月2日
	 */
	public static String fmtDate(String mydate, String oldfmt, String newfmt)
			throws Exception {
		String restr = null;
		try {
			// 判断给定参数是否为空，如果空则返回参数错误消息
			if (mydate == null || oldfmt == null || newfmt == null) {
				throw new Exception("error.app.util.datatools.IncorrectPara", null);
			}
			SimpleDateFormat newDate = new SimpleDateFormat(newfmt);
			// 根据给定参数转换为Calendar类型
			Calendar cal = getCal(mydate, oldfmt);
			// 转换异常则返回错误消息
			if (cal == null) {
				throw new Exception("error.app.util.datatools.IncorrectCalendar", null);
			}
			// 按给定格式返回
			restr = newDate.format(cal.getTime());
		} catch (Exception e) {
			throw new Exception("error.app.util.datatools.exception", null);
		}
		return restr;

	}

	// 判断当前时间是否在时间date之前
	// 时间格式 2005-4-21 16:16:34
	public static boolean isDateBefore(String date) {
		try {
			Date date1 = new Date();
			DateFormat df = DateFormat.getDateTimeInstance();
			return date1.before(df.parse(date));
		} catch (ParseException e) {
			return false;
		}
	}

	// 判断当前时间是否在时间date之前
	// 时间格式 2005-4-21 16:16:34
	public static boolean isDateBetween(String time, String startTime,
			String endTime) {
		try {
			DateFormat df = DateFormat.getDateTimeInstance();
			Date date1 = df.parse(time);
			if (date1.before(df.parse(endTime))
					&& date1.after(df.parse(startTime))) {
				return true;
			} else {
				return false;
			}
		} catch (ParseException e) {
			return false;
		}
	}

	/**
	 * 判断是否超时
	 * 
	 * @param beginDate
	 *            long
	 * @param TimeOutmillis
	 *            long
	 * @return boolean
	 */
	public static boolean whileUnitTimerOut(long beginDate, long TimeOutmillis) {
		long currentDate = System.currentTimeMillis();
		long endDate = beginDate + TimeOutmillis;
		return currentDate <= endDate;
	}

	/**
	 * 格式化时间
	 * 
	 * @param dateString
	 *            String
	 * @return Date
	 */
	public static Date formatDateString(String dateString) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date startDate = null;
		try {
			startDate = sdf.parse(dateString);
		} catch (ParseException ex) {
			startDate = null;
		}
		return startDate;
	}

	/*
	 * 判断当前的时间 密码是否过期。 pwdModDate 密码最后修改一次的时间 policyDate 密码策略的制定的天数
	 * 现在的时间在周期的后的时间返回true 密码过期
	 */
	public static Boolean pwdIsOverdue(String pwdModDate, String policyDate) {
		String expiredDateStr = "";
		int policy = Integer.parseInt(policyDate);
		try {
			expiredDateStr = DateTools.getAfterTime(pwdModDate,
					"yyyy-MM-dd HH:mm:ss", policy * 24, "yyyy-MM-dd HH:mm:ss");
			Calendar expiredDate = DateTools.getCal(expiredDateStr,
					"yyyy-MM-dd HH:mm:ss");
			String now = DateTools.getDateStr("yyyy-MM-dd HH:mm:ss");
			Calendar nowcalendar = DateTools.getCal(now, "yyyy-MM-dd HH:mm:ss");
			return nowcalendar.before(expiredDate); //
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * 把字符串的时间转变成long型
	 * 
	 * @param str
	 *            字符串时间
	 * @param mode
	 *            字符串时间格式
	 * @return Date
	 */
	public static long parse(String str, String mode) {
		Date date = null;
		SimpleDateFormat formatter = new SimpleDateFormat(mode);
		try {
			date = formatter.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date.getTime();
	}

	/**
	 * 根据给定格式得到指定日期时间
	 * 
	 * @param fmt
	 *            需要的日期格式
	 * @param datelong
	 *            需要转换的long型时间
	 * @return
	 */
	public static String getLongbyDate(String fmt, long datelong) {
		Date myDate = new Date(datelong);
		SimpleDateFormat sDateformat = new SimpleDateFormat(fmt);
		// sDateformat.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
		return sDateformat.format(myDate).toString();
	}

	/**
	 * 根据日期得到周几
	 * 
	 * @param dt
	 * @return
	 */
	public static String getWeekOfDate(Date dt) {
		String[] weekDays = { "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
		Calendar cal = Calendar.getInstance();
		cal.setTime(dt);

		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
		if (w < 0)
			w = 0;

		return weekDays[w];
	}

	/**
	 * 
	 * Definition: 转换周期时间窜 author: HanDeGang Created date: Mar 21, 2013
	 * 
	 * @param executeCycleType
	 * @param executeCycle
	 * @return
	 */
	public static String getExecuteCycleInfo(String executeCycleType,
			String executeCycle) {
		String info = "";
		if ("weeks".equals(executeCycleType)) {
			info = executeCycle + "周";
		} else if ("days".equals(executeCycleType)) {
			info = executeCycle + "天";
		} else if ("hours".equals(executeCycleType)) {
			info = executeCycle + "小时";
		} else if ("minutes".equals(executeCycleType)) {
			info = executeCycle + "分";
		}
		return info;
	}

	/**
	 * 
	 * Definition: 得到昨天 author: HanDeGang Created date: Nov 4, 2013
	 * 
	 * @return
	 */
	public static String getYesterday() {
		SimpleDateFormat sdf = new SimpleDateFormat(YEAR_MONTH_DAY_DATE);
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		Date yesterday = cal.getTime();
		return sdf.format(yesterday);
	}

	/**
	 * 
	 * Definition: 得到去年的今天 author: HanDeGang Created date: Nov 4, 2013
	 * 
	 * @return
	 */
	public static String getLastYearToday() {
		SimpleDateFormat sdf = new SimpleDateFormat(YEAR_MONTH_DAY_DATE);
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.YEAR, -1);
		Date lastYearToday = cal.getTime();
		return sdf.format(lastYearToday);
	}

	/**
	 * 
	 * Definition: 得到上个月结束的日期 author: HanDeGang Created date: Nov 27, 2013
	 * 
	 * @param dateFormat
	 *            日期格式
	 * @return
	 */
	public static String getLastMonthEnd(String dateFormat) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);
		int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, maxDay);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		Date date = cal.getTime();
		SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
		return sdf.format(date);
	}

	/**
	 * 
	 * Definition: author: HanDeGang Created date: Dec 11, 2013
	 * 
	 * @param formatDate
	 *            yyyy-MM-dd HH:mm:ss
	 * @param date
	 *            2013-11-18 15:28:27.449
	 * @return
	 * @throws ParseException
	 */
	public static Long transferStringDateToLong(String formatDate, String date)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(formatDate);
		Date dt = sdf.parse(date);
		return dt.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前天开始时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getDayStart() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		return cal.getTime();
	}
	
	
	/**
	 * 
	 * Definition: 获得当前天结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getDayEnd() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前时间下一分钟
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getMinEnd() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE)+1);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前时间上一小时
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getMinTime() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MINUTE, cal.get(Calendar.MINUTE)-60);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得下一月时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getNextMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, 1);
		cal.add(Calendar.DATE, -cal.get(Calendar.DATE)+1);
		cal.set(Calendar.HOUR, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得下一天时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getNextDay(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		//cal.add(Calendar.MONTH, 0);
		//cal.add(Calendar.DATE, 1);
		cal.set(Calendar.HOUR, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得下一小时时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getNextHour(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, 0);
		cal.add(Calendar.DATE, 0);
		cal.add(Calendar.HOUR, 1);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前周开始日期
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getWeekStart() {
		Calendar cal = Calendar.getInstance();
		int mondayDay = -6;//与本周一相差天数
		cal.add(Calendar.DATE, mondayDay );
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前周结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getWeekEnd() {
		Calendar cal = Calendar.getInstance();
		//cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前月开始时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getMonthStart() {
		Calendar cal = Calendar.getInstance();
		int mondayDay = -30;
		cal.add(Calendar.DATE, mondayDay );
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前月结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getMonthEnd() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前季度开始时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getQuarterStart() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 0);
		//cal.add(Calendar.DATE, -cal.get(Calendar.DATE)+1);
		cal.add(Calendar.DATE, 0);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当前季度结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getQuarterEnd() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.MONTH, -3);
		cal.add(Calendar.DATE, 0);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当年开始时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getYearStart() {
		Calendar cal = Calendar.getInstance();
		System.out.println(cal.get(Calendar.MONTH));
		cal.add(Calendar.YEAR, 0);
		cal.add(Calendar.MONTH, -cal.get(Calendar.MONTH));
		cal.add(Calendar.DATE, -cal.get(Calendar.DATE)+1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得当年结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getYearEnd() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.MONTH, 1);
		cal.add(Calendar.DATE, -1);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得前一周开始日期
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getPreviousWeekStart() {
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int mondayDay;//与本周一相差天数
		if (dayOfWeek == 1) {
			mondayDay = -6;
		} else {
			mondayDay = 2 - dayOfWeek;
		}
		cal.add(Calendar.DATE, mondayDay - 7);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得前一周结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getPreviousWeekEnd() {
		Calendar cal = Calendar.getInstance();
		int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		int mondayDay;//与本周一相差天数
		if (dayOfWeek == 1) {
			mondayDay = -6;
		} else {
			mondayDay = 2 - dayOfWeek;
		}
		cal.add(Calendar.DATE, mondayDay - 1);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得前一个月开始时间
	 * author: madaoyong
	 * Created date: Feb 24, 2013
	 * @return
	 */
	public static Date getPreviousMonthStart() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);
		int minDay = cal.getActualMinimum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, minDay);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得前一个月结束时间
	 * author: madaoyong
	 * Created date: Feb 24, 2013
	 * @return
	 */
	public static Date getPreviousMonthEnd() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, -1);
		int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, maxDay);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}

	/**
	 * 
	 * Definition: 获得前一天时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getPreviousDay() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}
	
	/**
	 * 
	 * Definition: 获得前一天时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getPreviousDay(int ss) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, ss);
		return cal.getTime();
	}
	/**
	 * 
	 * Definition: 获得前一天开始时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getPreviousDayStartTime() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 1);
		return cal.getTime();
	}
	/**
	 * 
	 * Definition: 获得前一天结束时间
	 * author: madaoyong
	 * Created date: Feb 28, 2013
	 * @return
	 */
	public static Date getPreviousDayEndTime() {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		return cal.getTime();
	}
	
	/**
	 * 返回java.sql.Date类型的字段值。
	 * @return 
	 */
	public static java.sql.Date getSqlDate(){			
		return new java.sql.Date(new java.util.Date().getTime());	
	}
	
	/**
	 * 返回java.sql.Timestamp类型的字段值。
	 * 
	 * @return 有日期和时间（毫秒级）
	 */
	public static java.sql.Timestamp getSqlTimestamp(){		
		return new java.sql.Timestamp(new java.util.Date().getTime());	
	}
	
	/**
	 * Definition: 获得两个时间段内间隔
	 * @param startDate 开始时间
	 * @param endDate 结束时间
	 * @return 间隔分钟数
	 * @throws FrameworkException 
	 * @Author: madaoyong
	 * @Created date: 2014年12月2日
	 */
	public static boolean isDaysBetweenDate(Date startDate, Date endDate, int intervalTime) throws Exception {
		boolean isTime = false;
		int a = (int)DateTools.getDaysBetweenDate(endDate, startDate);
		logger.info("开始时间："+startDate);
		logger.info("结束时间："+endDate);
		logger.info("时间差："+a);
		if(a <= intervalTime){
			isTime = true;
		}
		return isTime;
	}
	
	/**
	 * 英文月份转换
	*     
	* 方法描述：   
	* 创建人：madaoyong   
	* 创建时间：2015年8月4日 上午9:10:02   
	* 修改人：madaoyong   
	* 修改时间：2015年8月4日 上午9:10:02   
	* 修改备注：   
	* @version    
	*
	 */
	public static String getMonthTrans(String month){
		String transString = "";
		for(int i = 0 ; i < transColumn.length ; i++){
			if(transColumn[i].equals(month)){
				transString = monthColumn[i];
				break;
			}
		}
		return transString;
	}
	
	/**
	 * 天转换type 0:不需要补位0； 1：表示需要补位0
	*     
	* 方法描述：   
	* 创建人：madaoyong   
	* 创建时间：2015年8月5日 下午2:25:03   
	* 修改人：madaoyong   
	* 修改时间：2015年8月5日 下午2:25:03   
	* 修改备注：   
	* @version    
	*
	 */
	public static String getDayTrans(String day, int type){
		String transString = "";
		if(day != null && !"".equals(day)){
			day = String.valueOf(Integer.valueOf(day));
			String s = day.substring(0, 1);
			if(Integer.valueOf(s) > 9){
				transString = day;
			}else{
				if(type == 1){
					transString = "0"+day;
				}else{
					if(day.length() == 2){
						transString = day;
					}else{
						transString = " "+day;
					}
				}
			}
		}
		return transString;
	}
	
	/**
	 * 英文月份转换(当前时间前一天时间) type 0:不需要补位0； 1：表示需要补位0
	*     
	* 方法描述：   
	* 创建人：madaoyong   
	* 创建时间：2015年8月5日 下午2:25:32   
	* 修改人：madaoyong   
	* 修改时间：2015年8月5日 下午2:25:32   
	* 修改备注：   
	* @version    
	*
	 */
	public static String getLastMonthTrans(int type){
		String returnDate = "";
		String date = DateTools.getDateStr(DateTools.YEAR_MONTH_DAY_DATE, DateTools.getPreviousDay());
		String[] dates = date.split("-");
		String month = getMonthTrans(dates[1]);
		String day = getDayTrans(dates[2], type);
		returnDate = month +" "+ day;
		return returnDate;
	}
	
	/**
	 * 英文月份转换(当前时间) type 0:不需要补位0； 1：表示需要补位0
	*     
	* 方法描述：   
	* 创建人：madaoyong   
	* 创建时间：2015年8月5日 下午2:25:32   
	* 修改人：madaoyong   
	* 修改时间：2015年8月5日 下午2:25:32   
	* 修改备注：   
	* @version    
	*
	 */
	public static String getLastMonthCurrent(int type){
		String returnDate = "";
		String date = DateTools.getDateStr(DateTools.YEAR_MONTH_DAY_DATE);
		String[] dates = date.split("-");
		String month = getMonthTrans(dates[1]);
		String day = getDayTrans(dates[2], type);
		returnDate = month +" "+ day;
		return returnDate;
	}
	
	/**
	 * 验证是否时间
	 * @Title: isValidDate 
	 * @Description: TODO(这里用一句话描述这个方法的作用) 
	 * @param @param str
	 * @param @return 设定文件 
	 * @return boolean 返回类型 
	 * @throws
	 */
	public static boolean isValidDate(String str) {
		boolean convertSuccess = true;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			format.setLenient(false);
			format.parse(str);
		} catch (ParseException e) {
			convertSuccess = false;
		}
		return convertSuccess;
	}

}
