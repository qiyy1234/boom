package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.Date;

public class BaseEntity implements Serializable {
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 6351548162269407571L;

	/**
	 * id
	 */
	private String id;
	
	/**
	 * 创建人
	 */
	private String createUser;
	
	/**
	 * 创建时间
	 */
	private Date createDate;
	
	private String createDateStr;
	
	/**
	 * 修改人
	 */
	private String updateUser;
	
	/**
	 * 修改时间
	 */
	private Date updateDate;
	
	private String updateDateStr;
	
	/**
	 * 备注
	 */
	private String remark;
	
	/**
	 * 分页开始第几条
	 */
	private String start;
	
	/**
	 * 每页显示多少条
	 */
    private String length;
    
    


	public String getCreateDateStr() {
		return createDateStr;
	}

	public void setCreateDateStr(String createDateStr) {
		this.createDateStr = createDateStr;
	}

	public String getUpdateDateStr() {
		return updateDateStr;
	}

	public void setUpdateDateStr(String updateDateStr) {
		this.updateDateStr = updateDateStr;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getLength() {
		return length;
	}

	public void setLength(String length) {
		this.length = length;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}
	
	
	
	

}
