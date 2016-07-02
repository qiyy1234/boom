package com.fcst.boom.common;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Description:正则表达式工具类
 * Copyright (C) 2014 boco.com.cn All Right Reserved.
 * Author：LanChao
 * Create Date: 2014年12月3日
 * Modified By：
 * Modified Date：
 * Why & What is modified：
 * Version 1.0
 */
public class RegexTools {
	
	/**
	 * 匹配IPV4正则
	 */
	public static final String REGEX_IPV4 = "(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])";
	
	/**
	 * 匹配IPV6正则
	 */
	public static final String REGEX_IPV6 = "\\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)(\\.(25[0-5]|2[0-4]\\d|1\\d\\d|[1-9]?\\d)){3}))|:)))(%.+)?\\s*";
	
	/**
	 * 网址
	 */
	public static final String NET_ADDRESS = "http[s]{0,1}://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?";
	
	/**
	 * 匹配Email正则
	 */
	public static final String REGEX_MAIL = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
	
	/**
	 * 汉字
	 */
	public static final String CHINESE_CHART = "[\u4e00-\u9fa5]+";
	
	/**
	 * 英文
	 */
	public static final String ENGLISH_CHART = "[A-Za-z]+";
	
	
	/**
	 * Definition: 根据正则表达式匹配字符串，并将所有匹配到的结果返回
	 * @param inputStr 要进行匹配的字符串
	 * @param regex 正则表达式
	 * @return
	 * @Author: LanChao
	 * @Created date: 2014年12月4日
	 */
	public static List<String> getAllMatching(String inputStr, String regex) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(inputStr.trim());
		List<String> list = new ArrayList<String>();
		while (matcher.find()) {
			list.add(matcher.group(0).trim());
		}
		return list;
	}
	
	
	/**
	 * Definition:根据正则表达式匹配字符串，并将所有匹配到的某分组结果返回
	 * @param inputStr 要进行匹配的字符串
	 * @param regex 正则表达式
	 * @param group 要返回的组值
	 * @return
	 * @Author: LanChao
	 * @Created date: 2014年12月4日
	 */
	public static List<String> getAllMatchingGroup(String inputStr, String regex, int group){
		List<String> list = new ArrayList<String>();
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(inputStr.trim());
		while (matcher.find()) {
			list.add(matcher.group(group).trim());
		}
		return list;
	}
	
	/**
	 * Definition:判断字符串是否被正则表达式匹配到
	 * @param str 字符串
	 * @param regex 正则表达式
	 * @return
	 * @Author: LanChao
	 * @Created date: 2014年12月10日
	 */
	public static boolean isMatched(String str, String regex) {
		Pattern pattern = Pattern.compile(str);
		Matcher matcher = pattern.matcher(regex);
		return matcher.matches();
	}
	
}

	