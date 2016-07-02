package com.fcst.boom.common.page;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class PageEntity<T> implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4789600373806921815L;

	private int totalNum;
	
	private List<T> resultList = new ArrayList<T>();

	public int getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(int totalNum) {
		this.totalNum = totalNum;
	}

	public List<T> getResultList() {
		return resultList;
	}

	public void setResultList(List<T> resultList) {
		this.resultList = resultList;
	}
	
	

}
