package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.List;

/**
 * 组织机构
 * @author qiyy
 *
 */
public class Organization extends BaseEntity implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7336533771042458641L;
	private String id;      // 组织机构ID
	private String parentId;// 组织机构父ID
	private String parentOrgName;//组织机构父名称
	
	private String name; 	// 组织机构名称
	private Integer sort;	// 排序
	private String code;	// 区域编码
	private String type;	// 机构类型
	private String grade;	// 机构等级
	private String address;	// 联系地址
	private String zipCode; // 邮政编码
	private String master;	// 负责人
	private String phone;	// 电话
	private String fax;		// 传真
	private String email;	// 邮箱
	private String remarks;//备注
	private String delFlag;//删除标记
	
	public static void sortList(List<Organization> list, List<Organization> sourcelist, String parentId, boolean cascade){
		for (int i=0; i<sourcelist.size(); i++){
			Organization e = sourcelist.get(i);
			if (e.getParentId()!=null && e.getParentId().equals(parentId)){
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						Organization child = sourcelist.get(j);
						if (child.getParentId()!=null && child.getParentId().equals(e.getId())){
							sortList(list, sourcelist, e.getId(), true);
							break;
						}
					}
				}
			}
		}
	}
	
	
	
	public String getParentOrgName() {
		return parentOrgName;
	}



	public void setParentOrgName(String parentOrgName) {
		this.parentOrgName = parentOrgName;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getMaster() {
		return master;
	}
	public void setMaster(String master) {
		this.master = master;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	
	
	

}
