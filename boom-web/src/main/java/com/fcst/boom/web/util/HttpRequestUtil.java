package com.fcst.boom.web.util;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

/**
 * http请求工具类，封装请求对象中获取参数值等方法
 * @author qiyy
 *
 */
public class HttpRequestUtil {

	/** log4j日志器 */
	private static Logger logger=Logger.getLogger(HttpRequestUtil.class);
	
	/**
	 * 获取request参数值
	 * @param request request对象
	 * @param paraName 参数名
	 * @return
	 */
	public static String getReqParaValue(HttpServletRequest request,String paraName){
		String paraValue="";
		if(request.getParameter(paraName)!=null){
			paraValue=request.getParameter(paraName).trim();
		}
		return paraValue;
	}
	
	/**
	 * 获取request参数值（经过utf-8解码转换）
	 * @param request request对象
	 * @param paraName 参数名
	 * @return
	 */
	public static String getReqParaDecodeValue(HttpServletRequest request,String paraName){
		String paraValue="";
		if(request.getParameter(paraName)!=null){
			try{
				paraValue=URLDecoder.decode(request.getParameter(paraName), "UTF-8");
			}catch(Exception ex){}
		}
		return paraValue;
	}
	
	/**
	 * request参数将String转换成List（以sign为List元素分割点）
	 * @param request request对象
	 * @param paraName 参数名
	 * @return
	 */
	public static ArrayList<String> getReqParaListForString(HttpServletRequest request,String paraName,String sign){
		String str=getReqParaValue(request,paraName);
		return getListForString(str,sign);
	}
	
	/**
	 * 将String分割为List（以sign为List元素分割点）
	 * @param str 源数据
	 * @param sign 分割点
	 * @return
	 */
	public static ArrayList<String> getListForString(String str,String sign){
		ArrayList<String> al=new ArrayList<String>();
		if(str.length()>0){
			if(str.lastIndexOf(sign)!=str.length()-1){
				str+=sign;
			}
			if(str.indexOf(sign)>=0){
				boolean bWhile=true;
				while(bWhile){
					if(str.indexOf(sign)>=0){
						al.add(str.substring(0,str.indexOf(sign)).trim());
						str=str.substring(str.indexOf(sign)+1);
					}
					if(str.trim().equals("") || str.trim().length()==0){
						bWhile=false;
					}
				}
			}else{
				al.add(str);
			}
		}
		return al;
	}
	
	/**
	 * 将request参数自动转换成Map对象
	 * @param request request对象
	 * @return
	 */
	public static Map getReqParaMap(HttpServletRequest request){
		Map map=new HashMap();
		Set<String> setKey = request.getParameterMap().keySet();
        for(String key:setKey) {
        	map.put(key, getReqParaValue(request,key));
        }
		return map;
	}
}
