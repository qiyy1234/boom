package com.fcst.boom.domain;

import java.io.Serializable;

public class Role extends BaseEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7336533771042458641L;
	private String id;      // 角色ID
	private String name; 	// 角色名称
	private String enname;	// 英文名称
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEnname() {
		return enname;
	}
	public void setEnname(String enname) {
		this.enname = enname;
	}
	
	

}
