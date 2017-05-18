<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %> 
<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.4
Version: 1.4
Purchase: http://wrapbootstrap.com
-->
<%
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath()+"/";
	
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:16:09 GMT -->
<head>
    <meta charset="utf-8" />
    <title>boom</title>

    <meta name="description" content="Dashboard" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

	
    <!--Basic Styles-->
    <link href="<%=basePath %>resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
    <link href="<%=basePath %>resources/assets/css/font-awesome.min.css" rel="stylesheet" />
    <!--Beyond styles-->
    <link id="beyond-link" href="<%=basePath %>resources/assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath %>resources/assets/css/typicons.min.css" rel="stylesheet" />
    
    <link href="<%=basePath %>resources/assets/css/animate.min.css" rel="stylesheet" />
    
    <link id="skin-link" href="#" rel="stylesheet" type="text/css" />

    <link href="<%=basePath %>resources/assets/css/dataTables.bootstrap.css" rel="stylesheet" />

    <link href="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="<%=basePath %>resources/assets/js/skins.min.js"></script>
    
    <style type="text/css">
		.ztree {overflow:auto;margin:0;_margin-top:10px;padding:10px 0 0 10px;}
	</style>
    
    
</head>
<!-- /Head -->
<!-- Body -->
<body>
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loader"></div>
    </div>
    <!--  /Loading Container -->
    
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">

            <!-- Page Content -->
            <div class="page-body">
            
              <div class="row">
               <div class="col-lg-12 col-sm-12 col-xs-12">
                <div class="widget">
                
                		<div class="widget-header bg-blue">
								<i class="widget-icon fa fa-arrow-down"></i> <span
									class="widget-caption">Colored Header <input type="hidden" id="roleParam" /></span>
								<div class="widget-buttons">
									<a href="#" data-toggle="config"> <i class="fa fa-cog"></i>
									</a> <a href="#" data-toggle="maximize"> <i
										class="fa fa-expand"></i>
									</a> <a href="#" data-toggle="collapse"> <i class="fa fa-minus"></i>
									</a> <a href="#" data-toggle="dispose"> <i class="fa fa-times"></i>
									</a>
								</div>
								<!--Widget Buttons-->
							</div>
                
                
            	<div  class="widget-body" id="collapseTwo" >
                	<table width="100%">
                    	<tr>
                        	<td>名称：<input type="text" name="find_name" id="find_name"></td>
                            <td align="right">
                            	<a href="#" class="btn btn-blue btn-sm" onclick="findRoleList()">查询</a>&nbsp;
                                <%-- <shiro:hasPermission name="role:add"> --%><a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target="#roleAddDiv" onClick="addFrom();" >添加</a><%-- </shiro:hasPermission> --%> 
                            </td>
                        </tr>
					</table>
                    <br>
                    <table class="table table-striped table-bordered table-hover" id="roledatatable">
                    	<thead>
                        	<tr>
                            	<th width="15%">角色名称</th>
                                <th width="10%">英文名称</th>
                                <th width="10%">归属机构</th>
                                <th width="10%">数据范围</th>
                                <th width="10%">创建人</th>
                                <th width="15%">创建时间</th>
                                <th width="30%">操作</th>
                             </tr>
                         </thead>
                         <tbody>
                         </tbody>
                     </table>
                </div>
            </div>
            <!-- /Page Content -->

        </div>
        <!-- /Page Container -->
        <!-- Main Container -->
		  </div>
		</div>
	  </div>
    </div>
    
    <!--角色添加-->
    <div class="modal fade" id="roleAddDiv" tabindex="-1" role="dialog" aria-labelledby="roleAddDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">角色添加</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="roleForm">     
                                                   
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right">归属部门：</label>
										<div class="col-sm-8">
											<div class="input-group col-sm-16">
												<input class="form-control" id="orgNameDept" type="text" value="" readonly> 
												    <span class="input-group-btn">
													<a href="javascript:void(0);" id="parentTreeSelcDept"
													class="btn btn-default popover1" data-container="body"
													data-titleclass="bordered-blue" data-toggle="popover"
													data-placement="bottom" data-title="选择所属部门"
													data-content="<div class='popover1 widget-body'>
				                                   <ul id='parentTreeDept' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTreeDept('parentTreeDept','parentTreeSelcDept','parentIdDept','orgNameDept')>确定</a>&nbsp;
													<a align='right' class='btn btn-blue btn-xs' onclick=clearZtree('orgNameDept','parentIdDept','parentTreeSelcDept')>清除</a>
											       </span>
											"data-original-title="" title=""> GoTo </a> 
												<input type="text" id="parentIdDept" name="officeId" /> 
											</div>
										</div>
									</div>
                            	
                            	
                            	<div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">角色名称：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_role_name" name="name" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">英文名称：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_role_enname" name="enname" />
		                            </div>
		                        </div>

		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">角色类型：</label>
		                            <div class="col-sm-9">
		                            	<select name="roleType" id="roleType" style="width:100%;">
                                                <option value="assignment" >任务分配</option>
                                                <option value="security-role" >管理角色</option>
                                                <option value="user" >普通角色</option>
                                            </select>
		                            </div>
		                        </div>
		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">是否系统数据：</label>
		                            <div class="col-sm-9">
		                         		<select name="sysData" id="sysData" style="width:100%;">
                                                <option value="1" >是</option>
                                                <option value="0" >否</option>
                                            </select>
		                            </div>
		                        </div>
		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">是否可用：</label>
		                            <div class="col-sm-9">
		                            	<select name="useable" id="useable" style="width:100%;">
                                                <option value="1" >是</option>
                                                <option value="0" >否</option>
                                            </select>
		                            </div>
		                        </div>
		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">数据范围：</label>
		                            <div class="col-sm-9">
		                            	<!-- <input type="text" class="form-control" id="dataScope" name="dataScope" /> -->
		                            	<select class="form-control" id="dataScope" name="dataScope"></select>
		                            </div>
		                        </div>
		                                                         <div class="form-group">
		                                                                       	<label class="col-sm-2 control-label no-padding-right">角色授权：</label>
<div class="col-lg-9 col-sm-9 col-xs-9">
                                    <div class="widget transparent">
                                        <div class="widget-header">
                                            <span class="widget-caption" >角色授权  Transparent Widget </span>
                                            <div class="widget-buttons">
                                                <a href="#" data-toggle="collapse">
                                                    <i class="fa blue  fa-minus"></i>
                                                </a>
                                                <a href="#" data-toggle="dispose">
                                                    <i class="fa fa-times danger"></i>
                                                </a>
                                            </div><!--Widget Buttons-->
                                        </div><!--Widget Header-->
                                        
                                        <div class="widget-body" style="display: block;">
                                             <div id="ztree_select" class="ztree"></div>
                                        </div><!--Widget Body-->
                                        <input type="hidden" class="form-control" id="menuIds" name="menuIds" />
                                    </div><!--Widget-->
                                </div>
                              	</div>  
                                
                                
		                        
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea class="form-control" id="add_role_remark" name="remark">
		                            	</textarea>
		                            </div>
                                </div>

                               <table class="table" >
                               		<tr>
                                    	<td align="center">
                                        	<a href="#" id="roleAddBtn" onclick="addRole()"  class="btn btn-azure">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                       		<a href="#" data-dismiss="modal" aria-hidden="true"  class="btn btn-azure">取消</a>
                                        </td>
                                    </tr>
                               </table>
                                   

                            </form>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    
    <!--角色修改-->
    <div class="modal fade" id="roleUpdateDiv" tabindex="-1" role="dialog" aria-labelledby="roleUpdateDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">角色修改</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="roleForm">     
                                                   
									<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right">归属部门：</label>
										<div class="col-sm-8">
											<div class="input-group col-sm-16">
												<input class="form-control" id="orgNameDept" type="text" value="" readonly> 
												    <span class="input-group-btn">
													<a href="javascript:void(0);" id="parentTreeSelcDept"
													class="btn btn-default popover1" data-container="body"
													data-titleclass="bordered-blue" data-toggle="popover"
													data-placement="bottom" data-title="选择所属部门"
													data-content="<div class='popover1 widget-body'>
				                                   <ul id='parentTreeDept' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTreeDept('parentTreeDept','parentTreeSelcDept','parentIdDept','orgNameDept')>确定</a>&nbsp;
													<a align='right' class='btn btn-blue btn-xs' onclick=clearZtree('orgNameDept','parentIdDept','parentTreeSelcDept')>清除</a>
											       </span>
											"data-original-title="" title=""> GoTo </a> 
												<input type="text" id="parentIdDept" name="officeId" /> 
											</div>
										</div>
									</div>
                            	
                            	
                            	<div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">角色名称：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_role_name" name="name" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">英文名称：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_role_enname" name="enname" />
		                            </div>
		                        </div>

		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">角色类型：</label>
		                            <div class="col-sm-9">
		                            	<select name="roleType" id="roleType" style="width:100%;">
                                                <option value="assignment" >任务分配</option>
                                                <option value="security-role" >管理角色</option>
                                                <option value="user" >普通角色</option>
                                            </select>
		                            </div>
		                        </div>
		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">是否系统数据：</label>
		                            <div class="col-sm-9">
		                         		<select name="sysData" id="sysData" style="width:100%;">
                                                <option value="1" >是</option>
                                                <option value="0" >否</option>
                                            </select>
		                            </div>
		                        </div>
		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">是否可用：</label>
		                            <div class="col-sm-9">
		                            	<select name="useable" id="useable" style="width:100%;">
                                                <option value="1" >是</option>
                                                <option value="0" >否</option>
                                            </select>
		                            </div>
		                        </div>
		                                                        <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">数据范围：</label>
		                            <div class="col-sm-9">
		                            	<!-- <input type="text" class="form-control" id="dataScope" name="dataScope" /> -->
		                            	<select class="form-control" id="dataScopeUpdate" name="dataScopeUpdate"></select>
		                            </div>
		                        </div>
		                                                         <div class="form-group">
		                                                                       	<label class="col-sm-2 control-label no-padding-right">角色授权：</label>
<div class="col-lg-9 col-sm-9 col-xs-9">
                                    <div class="widget transparent">
                                        <div class="widget-header">
                                            <span class="widget-caption" >角色授权  Transparent Widget </span>
                                            <div class="widget-buttons">
                                                <a href="#" data-toggle="collapse">
                                                    <i class="fa blue  fa-minus"></i>
                                                </a>
                                                <a href="#" data-toggle="dispose">
                                                    <i class="fa fa-times danger"></i>
                                                </a>
                                            </div><!--Widget Buttons-->
                                        </div><!--Widget Header-->
                                        
                                        <div class="widget-body" style="display: block;">
                                             <div id="ztree_selectUpdate" class="ztree"></div>
                                        </div><!--Widget Body-->
                                        <input type="hidden" class="form-control" id="menuIds" name="menuIds" />
                                    </div><!--Widget-->
                                </div>
                              	</div>  
                                
                                
		                        
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea class="form-control" id="add_role_remark" name="remark">
		                            	</textarea>
		                            </div>
                                </div>

                               <table class="table" >
                               		<tr>
                                    	<td align="center">
                                        	<a href="#" id="roleAddBtn" onclick="addRole()"  class="btn btn-azure">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                       		<a href="#" data-dismiss="modal" aria-hidden="true"  class="btn btn-azure">取消</a>
                                        </td>
                                    </tr>
                               </table>
                                   

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!--角色详情-->
    <div class="modal fade" id="roleDetailDiv" tabindex="-1" role="dialog" aria-labelledby="roleDetailDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">角色详情</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="roleForm">
                                <div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">角色职位：</label>
		                        	<div class="col-sm-9">
                                        <input type="text" class="form-control" id="detail_role_name" name="name" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">英文名称：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="detail_role_enname" name="name" disabled="disabled" />
		                            </div>
		                        </div>
		                        <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">创建人：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_role_create_user" name="enname" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">创建时间：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_role_create_date" name="enname" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">修改人：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_role_update_user" name="enname" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">修改时间：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_role_update_date" name="enname" />
                                    </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9" >
		                            	<textarea class="form-control" id="detail_role_remark" name="remark" disabled="disabled">
		                            	</textarea>
		                            </div>
                                </div>
                                
                                <table class="table">
                                	<tr>
                                    	<td align="center">
                                        	<a href="#" data-dismiss="modal" aria-hidden="true" onclick="closeDetailDiv()"  class="btn btn-azure">取消</a>
                                        </td>
                                    </tr>
                                </table>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!--POWER ZTREE -->
<!--     <div class="modal fade" id="powerDetailDiv">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">权限菜单TREE</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="roleForm">
                            
                                <div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right"></label>
		                        	<div class="col-sm-9" id="sload">
                                        <ul id="tree" class="tree" style="overflow:auto;"></ul>
                                    </div>
                                </div>
                                
                                <table class="table">
                                	<tr>
                                    	<td align="center">
                                        	<a href="#" data-dismiss="modal" aria-hidden="true" onclick="closeDetailDiv()"  class="btn btn-azure">保存</a>
                                        	<a href="#" data-dismiss="modal" aria-hidden="true" onclick="closeDetailDiv()"  class="btn btn-azure">取消</a>
                                        </td>
                                    </tr>
                                </table>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    
    
    <div class="modal fade" id="powerDetailDiv">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">权限菜单TREE</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                        
                            <form class="form-horizontal" role="form" id="roleForm">
                                     <input type="hidden" class="form-control" id="roleId" name="roleId" />
                                     <input type="hidden" class="form-control" id="ZT" name="ZT" />
                                <div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right"></label>
		                        	<div class="col-sm-9" id="sload">
                                      <!--   <ul id="tree" class="tree" style="overflow:auto;"></ul> -->
                                      <div id="ztree" class="ztree"></div>
                                    </div>
                                </div>
                                
                                <table class="table">
                                	<tr>
                                    	<td align="center">
                                        	<a href="#" data-dismiss="modal" aria-hidden="true" onclick="savePower()"  class="btn btn-azure">保存</a>
                                        	<a href="#" data-dismiss="modal" aria-hidden="true" onclick="closeDetailDiv()"  class="btn btn-azure">取消</a>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
               
                                
    <div class="col-lg-12 col-sm-12 col-xs-12" id="pageBody">

                                    <div class="tabbable">
                                        <ul class="nav nav-tabs" id="myTab">
                                            <li class="active">
                                                <a data-toggle="tab" href="#home"  aria-expanded="true">
                                                                                                                                                            角色分配明细
                                                </a>
                                            </li>

                                            <li class="tab-red">
                                                <a data-toggle="tab" href="#profile" onClick="proDept();proPeople();" aria-expanded="false">
                                                                                                                                                              角色分配
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div id="home" class="tab-pane active">
                    <div class="grid-example">
            <div class="row">
            <div class="form-group">
            
              <div class="col-sm-2 text-right">
                     <label class="control-label no-padding-right">角色名称:</label></div>
              <div class="col-sm-2"><span id="nameSee"></span></div>
              
              <div class="col-sm-2 text-right">
                     <label class="control-label no-padding-right">英文名称:</label></div>
              <div class="col-sm-2"><span id="ennameSee"></span></div>
              
              <div class="col-sm-2 text-right">
                     <label class="control-label no-padding-right">归属机构:</label></div>
              <div class="col-sm-2"><span id="officeNameSee"></span></div>
             </div>
             </div> 
             
                         <div class="row">
            <div class="form-group">
              <div class="col-sm-2 text-right">
                     <label class="control-label no-padding-right">角色类型:</label></div>
              <div class="col-sm-2"><span id="roleTypeSee"></span></div>
              <div class="col-sm-2 text-right">
                     <label class="control-label no-padding-right">数据范围:</label></div>
              <div class="col-sm-2"><span id="dataScopeNameSee"></span></div>
             </div>
             </div> 
                                                                                                                        
                    </div>
                    
                    <table class="table table-striped table-bordered table-hover" id="roledatatableselect">
                    	<thead>
                        	<tr>
                            	<td width="20%">归属公司</td>
                                <td width="20%">归属部门</td>
                                <td width="15%">登录名称</td>
                                <td width="15%">姓名</td>
                                <td width="15%">电话</td>
                            <!--     <td width="15%">手机</td> -->
                                <td width="15%">操作</td>
                             </tr>
                         </thead>
                         <tbody>
                         </tbody>
                     </table>
                                            </div>

                                            <div id="profile" class="tab-pane">
                                                
                                                <div class="row">
                                    <div class="col-xs-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h10>所在部门</h10>
                                            </div>
                                            <div class="panel-body">
                                       <!--          <ul>
                                                    <li>
                                                        Your Name: Mr zhan
                                                    </li>
                                                    <li>Bank Name: Example Bank</li>
                                                    <li>SWIFT : 000-111-234</li>
                                                    <li>Account Number : 22-33-44-009</li>
                                                </ul> -->
                                                <ul>
                                                <li>
								                <div id="ztreeSelect" class="ztree"></div>
                                                </li>
                                                </ul>
                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="span7">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h10>待选人员</h10>
                                                </div>
                                                <div class="panel-body">
                                          <!--           <ul>
                                                        <li>
                                                            Email : you@example.com
                                                        </li>
                                                        <li>Mobile : 888-555-2311</li>
                                                        <li>Email  : <a href="#">yourname@mail.com</a></li>
                                                    </ul> -->
                                                    <ul>
                                                      <li>
                                                      <div id="ztreeWait" class="ztree"></div>
                                                      </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                     <div class="col-xs-4">
                                        <div class="span7">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h10>选定人员</h10>
                                                </div>
                                                <div class="panel-body">
                                          <!--           <ul>
                                                        <li>
                                                            Email : you@example.com
                                                        </li>
                                                        <li>Mobile : 888-555-2311</li>
                                                        <li>Email  : <a href="#">yourname@mail.com</a></li>
                                                    </ul> -->
                                                    <ul>
                                                      <li>
                                                      <div id="ztreePeople" class="ztree"></div>
                                                      </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                   <hr class="wide">  
                            <h5>Popover On Buttons</h5>       
                                   
                                   <div class="col-lg-12 col-sm-12 col-xs-12">
                                            <div class="buttons-preview text-align-center">
                                               <a href="javascript:void(0);" class="btn btn-darkorange shiny" onClick="saveDark();" >Dark Orange</a>
                                            </div>
                                        </div>
                                   
                                   <hr class="wide">             
                                                
                                            </div>

                                        </div>
                                    </div>
                                  <div class="horizontal-space"></div>
                                </div>
    
    
    <!--Basic Scripts-->     
    
    <script src="<%=basePath %>resources/assets/js/jquery-1.11.3/jquery.min.js"></script> 
    <script src="<%=basePath %>resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="<%=basePath %>resources/assets/js/beyond.js"></script>

    <!--Page Related Scripts-->
    <script src="<%=basePath %>resources/assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>

	<script src="<%=basePath %>resources/common/boomjs/role.js"></script>
	
	<!--treeTable用到的js-->
    <script type="text/javascript" src="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js"></script>
    
    <script type="text/javascript" src="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/js/jquery.ztree.exedit-3.5.min.js"></script>
<script>

 InitiateRoleDataTable.init(); 

/**
 * 将from转换为json格式封装
 */
 var tree;
 $(function(){
	 $.fn.serializeObject = function() {  
		    var o = {};  
		    var a = this.serializeArray();  
		    $.each(a, function() {  
		        if (o[this.name]) {  
		            if (!o[this.name].push) {  
		                o[this.name] = [ o[this.name] ];  
		            }  
		            o[this.name].push(this.value || '');  
		        } else {  
		            o[this.name] = this.value || '';  
		        }  
		    });  
		    return o;  
		}; 
	$("#pageBody").hide();	
 	getAllRoleList('ztree_select'); 
 	getAllRoleList('ztree_selectUpdate'); 
 });
 
  function getAllRoleList(treeId){
	 var setting = {
				view: {
					dblClickExpand: false,
					showLine: true,
					selectedMulti: false,
				},
	            check: {    
                    enable: true,
                },
				data:{
					simpleData:{
						enable:true,
						idKey:"id",
						pIdKey:"pId",
						rootPId:'0',
						}
		             },
		};		
		
	$.ajax({
		type:"post",
		url:basePath+"rest/boom/role/menuList", 
	    success:function(resultData){
		 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
		  	var zTreeNodes = eval(zTreeNodess);
			$.fn.zTree.init($("#"+treeId), setting, zTreeNodes).expandAll(true);
			tree = $.fn.zTree.getZTreeObj(treeId);
			},
		}); 
 }
 
 function addRole(){
		var ids = [], 
		nodes = tree.getCheckedNodes(true);
		for(var i=0; i<nodes.length; i++) {
			ids.push(nodes[i].id);
		}
		$("#menuIds").val(ids);
	 
		var formData = JSON.stringify($('#roleForm').serializeObject());
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/role/add",
			data:formData,
			contentType:"application/json; charset=utf-8",
	        dataType:"json",
	        success:function(resultData){
	        	alert(resultData.msg);
	        	if(resultData.result){
	        		cleanAddForm();
	            	$('#roleAddDiv').modal('hide');
	            	oTableInitiateRole.fnDraw();
	        	}
			}
		});
		
	}	
 
/* 	
 * +'<a href="#" class="btn btn-primary btn-sm" onclick="powerRoleDG(\''+full.id+'\')"><i class="fa fa-gift"></i>菜单赋权</a>&nbsp;'
 var zTree;
		    var setting = {
					view: {
						dblClickExpand: false,
						showLine: true,
						selectedMulti: false
					},
		            check: {    
	                    enable: true  
	                },
					data:{
						simpleData:{
							enable:true,
							idKey:"id",
							pIdKey:"pId",
							rootPId:'0'
							}
			             },
			};
		    
  function powerRoleDG(roleId){
	    $("#roleId").val(roleId);
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/role/powerRoleDG",
			data: {"roleId":roleId},
		    success:function(resultData){
			 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
			    var zT  = zTreeNodess.replace(/subsetPermission/gm,'nodes');  
			  	var zTreeNodes = eval(zT);
			  	$("#ZT").val(JSON.stringify(zTreeNodes));
			 	 $.fn.zTree.init($("#ztree"), setting, zTreeNodes).expandAll(true);
				},
			}); 
			$('#powerDetailDiv').modal();
		}  */
  
<%--   function savePower(){
      var treeObj=$.fn.zTree.getZTreeObj("ztree");
      var nodes=treeObj.getCheckedNodes(true);
		alert(nodes);
		var tmpNode;
		var ids = "";
		for(var i=0; i<nodes.length; i++){
			tmpNode = nodes[i];
			if(i!=nodes.length-1){
				ids += tmpNode.id+",";
			}else{
				ids += tmpNode.id;
			}
		}
		var roleId = $("#roleId").val();
		var url = "<%=basePath%>rest/boom/role/doAuthSave";
		var postData;
		postData = {"roleId":roleId,"ids":ids};
		$("#zhongxin").hide();
		$("#zhongxin2").show();
		$.post(url,postData,function(data){
			//if(data && data=="success"){
				top.Dialog.close();
			//}
		});
  } --%>
		
	$("#parentTreeSelcDept").click(function(){
			 var treeId = 'parentTreeDept';
				$.ajax({
					type:"post",
					url:basePath+"rest/boom/organization/treeData?type=2",
				    success:function(resultData){
					 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
					  	var zTreeNodes = eval(zTreeNodess);
						$.fn.zTree.init($("#"+treeId), setting, zTreeNodes).expandAll(true);
						zTree = $.fn.zTree.getZTreeObj(treeId);
						},
					}); 
			    });
	
	  function seleteParentTreeDept(treeId,ahrefId,parentId,orgNameId){
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
		    var nodes = treeObj.getSelectedNodes();
		    var ab =JSON.stringify(nodes);
		    json = eval(ab);
		    var id = json[0].id;
		    var name = json[0].name;
			 $("#"+parentId).val(id);
			 $("#"+orgNameId).val(name);
			 $("#"+ahrefId).click();
		} 
	 
	 function clearZtree(aid,valueid,ahrefId){
		    $("#"+aid).val("");
		    $("#"+valueid).val("");
		    $("#"+ahrefId).click();
		}
	 
	 var zTree;
	 var setting = {
	 		view: {
	 			dblClickExpand: false,
	 			showLine: true,
	 			selectedMulti: false
	 		},
	 		callback: {
	 			beforeClick: beforeClick,
	 			onDblClick: zTreeOnDblClick
	 		},
	 		data:{
	 			simpleData:{
	 				enable:true,
	 				idKey:"id",
	 				pIdKey:"parentId",
	 				rootPId:'0'
	 				}
	              },
	 };

	 function zTreeOnDblClick(event, treeId, treeNode) {
	 /*    alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);  */
	 }

	 function beforeClick(treeId, treeNode) {
     /* var check = (treeNode && !treeNode.isParent);
	 	if (!check) 
	 	  Notify('父节点不可以选择....', 'top-right', '2000', 'danger', 'fa-tag', true);
	 	return check; */
	 }
	  
	 function addFrom(){
			$("#dataScope").text('');
			$("#dataScopeUpdate").text('');
			 var html = "";  
			    $.ajax({  
			        type: "post",  
			        async: false,  
			        url: basePath+"rest/boom/role/selectDataScope",   // basePath+"boom/user/upload",
			        data: "",  
			        dataType: "json",  
			        success: function(data) {
			        	if (data != 0) {  
			         	var obj = eval(data);
			         	for(var key in obj){ //第一层循环取到各个list 
			         		var List = obj[key]; 
			         		for(var ob in List){ //第二层循环取list中的对象 
			         		  html += "<option  value='" + List[ob ].id + "'>" + List[ob ].name + "</option>";
			         		  
			         		     } 
			         		   } 
			        	    }   
				            else { 
				                html = "<option>网络异常</option>";  
				            } 
			        }  
			    });  
			    $(html).appendTo("#dataScope");
			    $(html).appendTo("#dataScopeUpdate");
		}
	 
	 function powerRole(roleId){
		 $("#roleParam").val(roleId);
		 $("#pageBody").show();
			$.ajax({
				type:"post",
				url:basePath+"rest/boom/role/assign",
				data: {"roleId":roleId},
				dataType: "json",  
		        success:function(resultData){
		        	if(resultData.result){
		        		var name = JSON.stringify(resultData.role.name);
			        	$("#nameSee").html(name);
			        	var enname = JSON.stringify(resultData.role.enname);
			        	$("#ennameSee").html(enname);
			        	var officeName = JSON.stringify(resultData.role.office.name);
			        	$("#officeNameSee").html(officeName);
			        	var roleType = JSON.stringify(resultData.role.roleType);
			        	$("#roleTypeSee").html(roleType);
			        	var dataScopeName = JSON.stringify(resultData.role.dataScopeName);
			        	$("#dataScopeNameSee").html(dataScopeName);
			        	
		            	findUserList(roleId);
		        	}
		        	
				}
			});
	    }
	 
	 function findUserList(roleId){
	 $('#roledatatableselect').dataTable({
		 "destroy":true,
         "sDom": "t<'row DTTTFooter'<'col-sm-6'i><'col-sm-6'p>>",
         "language": {
             url: basePath+'resources/assets/internation/message_zh_CN.txt'
         },
         //自动列宽
         "bAutoWidth": false,
         //加载数据时显示正在加载信息
         "bProcessing": true,
         //分页
         "paging": true,
         //从服务器处理分页
         "bServerSide": true,
         //查询请求action url
         "ajax": {
             "url": basePath+"/rest/boom/role/assignList?roleId="+roleId,
             "dataSrc": "data",
             "data": function ( d ) {
             	//查询条件
             	d.loginName = $("#loginName").val();
             }
         },
         //本地搜索
         "searching": false,
         //每页显示多少条数据
         "lengthChange":false,
         //每页显示数量：5条记录
         "iDisplayLength": 5,
         "columns": [
             {"data": "companyName"},
             {"data": "officeName"},
             {"data": "loginName"},
             {"data": "name"},
             {"data": "mobile"},
  /*            {"data": "state"}, */
             {"data": "id"}
         ],
         "columnDefs": [
		/* 		{
				    "targets": 0,
				    "render": function ( data, type, full, meta ) {
				        return '<i class="fa fa-plus-square-o row-details"></i>';
				    }
				}, */
             {
                 "targets": 5,
                 "render": function ( data, type, full, meta ) {
                 	var operation = '<a href="#" class="btn btn-danger btn-sm" onclick="deleteUser(\''+full.id+'\')"><i class="fa fa-trash-o"></i>删除</a>';
                 	return operation;
                 }
             }
         ],
         //排序
         "sort":false,
         "aaSorting": [],
       });
	 }
	 
	 function proDept(ztreeSelect){
		 var  ztreeSelect = 'ztreeSelect';
		 
				var setting = {
						view: {
							dblClickExpand: false,
							showLine: true,
							selectedMulti: false
						},
						callback: {
							beforeClick: beforeClickOffice,
							onDblClick: zTreeOnDblClickOffice,
						},
						data:{
							simpleData:{
								enable:true,
								idKey:"id",
								pIdKey:"parentId",
								rootPId:'0',
								}
				             },
				};		
				
			$.ajax({
				type:"post",
				url:basePath+"rest/boom/organization/treeData",
			    success:function(resultData){
				 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
				  	var zTreeNodes = eval(zTreeNodess);
					$.fn.zTree.init($("#"+ztreeSelect), setting, zTreeNodes).expandAll(false);
					zTree = $.fn.zTree.getZTreeObj(ztreeSelect);
					},
				}); 
		 
	 }
	 
	 function beforeClickOffice(treeId, treeNode){
	   var id = treeNode.id == '0' ? '' :treeNode.id;
	   var name = treeNode.name;
	   var setting = {
				view: {
					dblClickExpand: false,
					showLine: true,
					selectedMulti: false
					
					
				},
				callback: {
					beforeClick: beforeOnClick,
					beforeDrag: beforeDrag,
					beforeDrop: beforeDrop
				},
				edit: {
					enable: true,
					showRemoveBtn: false,
					showRenameBtn: false
				},
				data:{
					simpleData:{
						enable:true,
						idKey:"id",
						pIdKey:"parentId",
						rootPId:'0',
						}
		             },
		};		
		
	$.ajax({
		type:"post",
		url: basePath+"/rest/boom/user/list?office.id="+id+"&office.name="+name,
	    success:function(resultData){
 		 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
		  	var zTreeNodes = eval(zTreeNodess);
			$.fn.zTree.init($("#ztreeWait"), setting, zTreeNodes).expandAll(false);
			zTree = $.fn.zTree.getZTreeObj(ztreeWait); 
			},
		}); 
	   
	 }

	 function beforeOnClick(treeId, treeNodes){
		 var orgId = treeNodes.id;
		 var parentOrgId = "0";
		 var name = treeNodes.name;
		 var treeObj = $.fn.zTree.getZTreeObj("ztreePeople");//获取ztree对象  
		 var childZNode = new ZtreeNode(orgId, parentOrgId, name); //构造子节点
		 treeObj.addNodes(null, childZNode, true); 
		
	 }
	 
	 function ZtreeNode(id, parentId, name){
		    this.id = id;  
		    this.parentId = parentId;  
		    this.name = name;
	 }
	 
	 function beforeDrag(treeId, treeNodes) {
				for (var i=0,l=treeNodes.length; i<l; i++) {
					if (treeNodes[i].drag === false) {
						return false;
					}
				}
				return true;
	 }
	 
	 function beforeDrop(treeId, treeNodes, targetNode, moveType) {
				return targetNode ? targetNode.drop !== false : true;
	 }
	 
	 function zTreeOnDblClickOffice(){
		 
	 }
	 
	 function beforeClickPeople(treeId, treeNode){
		var id = treeNode.id == '0' ? '' :treeNode.id;
		var name = treeNode.name;
		alert(id +" --people-  "+name);
		
	 }
		 
	 function proPeople(ztreePeople){
	   var roleParamId = $("#roleParam").val();
	   var ztreePeople = 'ztreePeople';
	   var setting = {
			   view: {
				   selectedMulti: false,
				   fontCss: { 'color': 'red', 'font-family': '微软雅黑' }
				   //fontCss : {"font-family": "微软雅黑", "font-size": "14px"}
				},
				edit: {
					enable: true,
					showRenameBtn : false
				},
				data: {
					simpleData: {
						enable: true
					}
				},	
				callback: {
					beforeClick: beforeClickPeople,
					beforeDrag: beforeDrag
				}
			};
		
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/role/assignList?roleId="+roleParamId,
		    success:function(resultData){
			 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
			  	var zTreeNodes = eval(zTreeNodess);
				$.fn.zTree.init($("#ztreePeople"), setting, zTreeNodes);
				setEdit();
				$("#remove").bind("change", setEdit);
				$("#rename").bind("change", setEdit);
				$("#removeTitle").bind("propertychange", setEdit)
				.bind("input", setEdit);
				$("#renameTitle").bind("propertychange", setEdit)
				.bind("input", setEdit);
				},
			}); 

			function beforeDrag(treeId, treeNodes) {
				return false;
			}
			
			function setEdit() {
				var zTree = $.fn.zTree.getZTreeObj("ztreePeople"),
				remove = $("#remove").attr("checked"),
				rename = $("#rename").attr("checked"),
				removeTitle = $.trim($("#removeTitle").get(0).value),
				renameTitle = $.trim($("#renameTitle").get(0).value);
				zTree.setting.edit.showRemoveBtn = remove;
				zTree.setting.edit.showRenameBtn = rename;
				zTree.setting.edit.removeTitle = removeTitle;
				zTree.setting.edit.renameTitle = renameTitle;
				showCode(['setting.edit.showRemoveBtn = ' + remove, 'setting.edit.showRenameBtn = ' + rename,
					'setting.edit.removeTitle = "' + removeTitle +'"', 'setting.edit.renameTitle = "' + renameTitle + '"']);
			}
			
			function showCode(str) {
				var code = $("#code");
				code.empty();
				for (var i=0, l=str.length; i<l; i++) {
					code.append("<li>"+str[i]+"</li>");
				}
			}
	 }
	 
	 function saveDark(){
		 var roleId = $("#roleParam").val();
		 var treeObj = $.fn.zTree.getZTreeObj("ztreePeople");
		 var nodes = treeObj.getNodes();
		 var tmpNode;
		 var ids = "";
			for(var i=0; i<nodes.length; i++){
				tmpNode = nodes[i];
				if(i!=nodes.length-1){
					ids += tmpNode.id+",";
				}else{
					ids += tmpNode.id;
				}
			}
			 $.ajax({
				  type:"post",
				  url: basePath+"rest/boom/role/saveTree?timestamp="+Date.parse(new Date()),
				  data: {"roleId":roleId,"ids":ids},
			      success:function(resultData){
			        if(resultData.result){
			        	alert(resultData.msg);
			        	alert(resultData.result);
			        	findUserList(roleId);
			        	$('#myTab a:first').tab('show');
			        	}
					}
				});
		 
	 }
	 
	 
</script>

</body>
<!--  /Body -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:22:34 GMT -->
</html>
