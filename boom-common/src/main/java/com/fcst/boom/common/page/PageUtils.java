package com.fcst.boom.common.page;

import java.util.List;
import java.util.Map;

/**
 * Description:分页操作工具类
 * Copyright (C) 2014 boco.com.cn All Right Reserved.
 * Author：LanChao
 * Create Date: 2014年12月2日
 * Modified By：
 * Modified Date：
 * Why & What is modified：
 * Version 1.0
 */
public class PageUtils {
	
	public static String PAGE_START="0";
	
	public static String PAGE_LIMIT="10";

	/**
	 * 产生分页
	 * @param <E>
	 * 
	 * @param pageArg
	 * @param retlist
	 * @return
	 */
	public static <T> PageList<T> makeListPage(PageArg pageArg, List<T> retlist) {
		if (retlist == null) {
			return null;
		}
		PageList<T> retpl = null;
		if (pageArg != null) {
			retpl = new PageList<T>(retlist, pageArg.getCurPage(), pageArg.getPageSize());
		} else {
			retpl = new PageList<T>(retlist);
		}
		return retpl;
	}

	/**
	 * 只能用到action中
	 * 
	 * @param request
	 * @return
	 */
	public static PageArg getPageArg(String start, String limit) {
		PageArg pageArg = new PageArg();
		if (limit != null && !"".equals(limit) && !"".equals(start) && start != null) {
			pageArg.setCurPage(Integer.parseInt(start), Integer.parseInt(limit));
			pageArg.setPageSize(Integer.parseInt(limit));
		} else {
			pageArg.setCurPage(1);
		}
		return pageArg;
	}
	
	/**
	 * jsonview专用
	*     
	* 方法描述：   
	* 创建人：madaoyong   
	* 创建时间：2015年5月11日 下午3:20:34   
	* 修改人：ThinkPad   
	* 修改时间：2015年5月11日 下午3:20:34   
	* 修改备注：   
	* @version    
	*
	 */
	public static PageArg getPageArg(Map<String, Object> page) {
		String start = String.valueOf(page.get("start"));
		String limit = String.valueOf(page.get("limit"));
		PageArg pageArg = new PageArg();
		if (limit != null && !"".equals(limit) && !"".equals(start) && start != null) {
			pageArg.setCurPage(Integer.parseInt(start), Integer.parseInt(limit));
			pageArg.setPageSize(Integer.parseInt(limit));
		} else {
			pageArg.setCurPage(1);
		}
		return pageArg;
	}

}
