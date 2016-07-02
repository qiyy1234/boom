package com.fcst.boom.domain;

import java.io.Serializable;

import com.fcst.boom.common.page.PageBean;

/**
 * 菜单管理Entity
 * @author qiyy
 * 2016-06-26
 */
public class Menu extends PageBean implements Serializable {
	private Menu parent;	// 父级菜单
	private String parentIds; // 所有父级编号
	private String name; 	// 名称
	private String href; 	// 链接
	private String target; 	// 目标（ mainFrame、_blank、_self、_parent、_top）
	private String icon; 	// 图标
	private Integer sort; 	// 排序
	private String isShow; 	// 是否在菜单中显示（1：显示；0：不显示）
}
