package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.List;

public class Permission extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private Permission parent;	// 父级菜单
	
	private String name;
	
	private String url;
	
	private String type;
	
	private String percode;
	
	private Long pId;
	
	private String parentids;
	
	private String sortstring;
	
	private String available;
	
	private List<Permission> subsetPermission;
	
	private boolean checked;
	
	private String open = "false";
	
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public List<Permission> getSubsetPermission() {
		return subsetPermission;
	}

	public void setSubsetPermission(List<Permission> subsetPermission) {
		this.subsetPermission = subsetPermission;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getPercode() {
		return percode;
	}

	public void setPercode(String percode) {
		this.percode = percode;
	}

	public Long getpId() {
		return pId;
	}

	public void setpId(Long pId) {
		this.pId = pId;
	}

	public String getParentids() {
		return parentids;
	}

	public void setParentids(String parentids) {
		this.parentids = parentids;
	}

	public String getSortstring() {
		return sortstring;
	}

	public void setSortstring(String sortstring) {
		this.sortstring = sortstring;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOpen() {
		return open;
	}

	public void setOpen(String open) {
		this.open = open;
	}

	public Permission getParent() {
		return parent;
	}

	public void setParent(Permission parent) {
		this.parent = parent;
	}

	public static void sortList(List<Permission> list, List<Permission> sourcelist, 
			List<Permission> myPermissionList, String parentId, boolean cascade) {
		// TODO Auto-generated method stub
		System.out.println("--- --- permission sortList ---start-----");
		
		for (int i=0; i<sourcelist.size(); i++){
			Permission e = sourcelist.get(i);
			if (e.getParent()!=null && e.getParent().getId()!=null
					&& e.getParent().getId().equals(parentId)){
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						Permission child = sourcelist.get(j);
						if (child.getParent()!=null && child.getParent().getId()!=null
								&& child.getParent().getId().equals(e.getId())){
							sortList(list, sourcelist,myPermissionList, e.getId(), true);
							break;
						}
					}
				}
			}
		}
		System.out.println("--- --- permission sortList ---end-----");
		
		
	}



	
	
}
