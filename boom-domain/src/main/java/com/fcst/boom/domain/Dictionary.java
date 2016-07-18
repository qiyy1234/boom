package com.fcst.boom.domain;

import java.io.Serializable;

/**
 * 字典表实体
 * @author qiyy
 *
 */
public class Dictionary extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4877696709114855295L;
	
	private String dictName;//字典表名称
	
	private String dictValue;//字典表值
	
	private String dictParentId;//父id
	
	private Integer dictSort;//排序
	
	private String dictType;//字典表类型

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public String getDictValue() {
		return dictValue;
	}

	public void setDictValue(String dictValue) {
		this.dictValue = dictValue;
	}

	public String getDictParentId() {
		return dictParentId;
	}

	public void setDictParentId(String dictParentId) {
		this.dictParentId = dictParentId;
	}

	public Integer getDictSort() {
		return dictSort;
	}

	public void setDictSort(Integer dictSort) {
		this.dictSort = dictSort;
	}

	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}
	
	

}
