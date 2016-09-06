package com.fcst.boom.service;

import java.util.List;

import com.fcst.boom.domain.Permission;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016年03月04日
 * Time: 23:06:12
 * 功能:T_ROOM表Service接口
 */

public interface PermissionService {

	List<Permission> getAllPermission(String roleId);

 
}
