package com.fcst.boom.domain;

import java.io.Serializable;
import java.util.Map;

public abstract class BaseEntityEnd<T>  implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 实体编号（唯一标识）
	 */
	protected String id;
	
	/**
	 * 当前用户
	 */
	protected User currentUser;
	
	/**
	 * 自定义SQL（SQL标识，SQL内容）
	 */
	protected Map<String, String> sqlMap;
	
	/**
	 * 是否是新记录（默认：false），调用setIsNewRecord()设置新记录，使用自定义ID。
	 * 设置为true后强制执行插入语句，ID不会自动生成，需从手动传入。
	 */
	protected boolean isNewRecord = false;

	public BaseEntityEnd() {
		
	}
	
	public BaseEntityEnd(String id) {
		this();
		this.id = id;
	}

	
	
	
}
