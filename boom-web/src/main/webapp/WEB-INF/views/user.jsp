<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.3.4
Version: 1.4
Purchase: http://wrapbootstrap.com
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<link rel="shortcut icon" href="assets/img/favicon.png"
	type="image/x-icon">

<!--Basic Styles-->
<link href="<%=basePath %>resources/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
<link href="<%=basePath %>resources/assets/css/font-awesome.min.css"
	rel="stylesheet" />

<!--Beyond styles-->
<link id="beyond-link"
	href="<%=basePath %>resources/assets/css/beyond.min.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath %>resources/assets/css/typicons.min.css"
	rel="stylesheet" />
<link href="<%=basePath %>resources/assets/css/animate.min.css"
	rel="stylesheet" />
<link id="skin-link" href="#" rel="stylesheet" type="text/css" />

<link href="<%=basePath %>resources/assets/css/dataTables.bootstrap.css"
	rel="stylesheet" />

<!--ztree用到的css-->
<link rel="stylesheet"
	href="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css"
	type="text/css" />

<!--treeTable用到是css-->
<link
	href="<%=basePath %>resources/assets/js/treeTable/css/jquery.treetable.css"
	rel="stylesheet" />

<!--fileInput用到是css-->
<link
	href="<%=basePath %>resources/assets/css/fileInput/fileinput.min.css"
	rel="stylesheet" />

<!-- datatimepicker用到的css -->
<link
	href="<%=basePath %>resources/assets/css/datatimepicker/bootstrap-datetimepicker.min.css"
	rel="stylesheet" media="screen">

<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<script src="<%=basePath %>resources/assets/js/skins.min.js"></script>

</head>
<!-- /Head -->
<!-- Body -->
<body>

	<!-- Loading Container -->
	<div class="loading-container">
		<div class="loader"></div>
	</div>

	<div class="main-container container-fluid">
		<!-- Page Container -->
		<div class="page-container">

			<!-- Page Content -->
			<div class="page-body">
				<div class="row">
					<div class="col-lg-3 col-sm-3 col-xs-3">
						<div class="widget">
							<div class="widget-header bg-blue">
								<i class="widget-icon fa fa-arrow-down"></i> <span
									class="widget-caption">Colored Header</span>
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
							<!--Widget Header-->
							<div class="widget-body">

								<div id="ztree" class="ztree"></div>

							</div>
							<!--Widget Body-->
							
	<!-- 						<div id="openClose" class="close">&nbsp;</div>
		<div id="right">
			<iframe id="iframeId" src="/boom-web/rest/boom/user/list" width="100%" height="91%" frameborder="0"></iframe>
		</div> -->
						</div>
						<!--Widget-->

					</div>

					<div class="col-lg-9 col-sm-9 col-xs-9">
						<div class="widget">
							<div class="widget-header bg-blue">
								<i class="widget-icon fa fa-arrow-down"></i> <span
									class="widget-caption">Colored Header</span>
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
							<!--Widget Header-->

							<div class="widget-body">
								<table width="100%">
									<tr>
										<td>登录名：<input type="text" name="loginName" id="loginName">
										</td>
										<td align="right"><a href="#" class="btn btn-blue btn-sm"
											onclick="findUserList()">查询</a>&nbsp; <a href="#"
											class="btn btn-blue btn-sm" data-toggle="modal"
											data-target="#addUserDiv" onClick="addRoleReady();addOfficeReady();">添加</a>
										</td>
									</tr>
								</table>
								<br>
								<table class="table table-striped table-bordered table-hover"
									id="userdatatable">
									<thead>
										<tr>
											<th></th>
											<th>归属公司</th>
											<th>归属部门</th>
											<th>姓名</th>
											<th>性别</th>
											<th>电话</th>
											<th>状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>

						</div>
						<!--Widget-->

					</div>
				</div>
			</div>
		</div>
		<!-- /Page Content -->
	</div>
	<!-- /Page Container -->
	<!-- Main Container -->

	<!--用户添加-->
	<div class="modal fade " id="addUserDiv" tabindex="-1" role="dialog"
		aria-labelledby="userAddDiv" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="widget-header bg-themeprimary">
					<span class="widget-caption">用户添加</span>
					<div class="widget-buttons">
						<a data-dismiss="modal" aria-hidden="true"><i
							class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" id="addUserForm"
						method="post" enctype="multipart/form-data">
						<div class="row">
							<div class="col-xs-12 col-md-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">归属公司：</label>
											<div class="col-sm-8">
												<div class="input-group date date col-sm-16">
													<input class="form-control" id="orgName" type="text"
														value="" readonly> <span class="input-group-btn">
														<a href="javascript:void(0);" id="parentTreeSelcCompany"
														class="btn btn-default popover1" data-container="body"
														data-titleclass="bordered-blue" data-toggle="popover"
														data-placement="bottom" data-title="选择所属公司"
														data-content="<div class='popover1 widget-body'>
				                                   <ul id='parentTree' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTree('parentTree','parentTreeSelcCompany','parent_id','orgName')>确定</a>&nbsp;
														<a align='right' class='btn btn-blue btn-xs'
														onclick=clearZtree('orgName','parent_id','parentTreeSelcCompany')>清除</a>
													</p>
												</div>
												" data-original-title="" title=""> GoTo </a> 
												<input type="text" id="parent_id" name="company_id" /> </span>
											</div>
										</div>
									</div>
								</div>


							    <div class="col-sm-6">
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right">归属部门：</label>
										<div class="col-sm-8">
											<div class="input-group date date col-sm-16">
												<input class="form-control" id="orgNameDept" type="text"
													value="" readonly> <span class="input-group-btn">
													<a href="javascript:void(0);" id="parentTreeSelcDept"
													class="btn btn-default popover1" data-container="body"
													data-titleclass="bordered-blue" data-toggle="popover"
													data-placement="bottom" data-title="选择所属部门"
													data-content="<div class='popover1 widget-body'>
				                                   <ul id='parentTreeDept' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTreeDept('parentTreeDept','parentTreeSelcDept','parentIdDept','orgNameDept')>确定</a>&nbsp;
													<a align='right' class='btn btn-blue btn-xs'
													onclick=clearZtree('orgNameDept','parentIdDept','parentTreeSelcDept')>清除</a>
												</p>
											</div>
											"data-original-title="" title=""> GoTo </a> <input type="text"
												id="parentIdDept" name="office_id" /> </span>
										</div>
									</div>
								</div>
								
								
							</div>

						</div>
							
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3	 control-label no-padding-right">登录用户：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control"
													id="add_user_loginname" name="loginName"
													data-bv-field="loginName" />
											</div>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">姓名：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="add_user_name"
													name="name" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">密码：</label>
											<div class="col-sm-8">
												<input type="password" class="form-control"
													id="add_user_password" name="password" />
											</div>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">确认密码：</label>
											<div class="col-sm-8">
												<input type="password" class="form-control"
													id="add_user_confirm_password" name="confirmpassword" />
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">性别：</label>
											<div class="col-sm-8" id="add_user_sex">

												<div class="radio">
													<label> <input type="radio" id="male" name="sex"
														value="1" class="form-control colored-blue"
														checked="checked" /> <span class="text">男</span>
													</label> <label> <input type="radio" id="female" name="sex"
														value="0" class="form-control colored-blue" /> <span
														class="text">女</span>
													</label>
												</div>

											</div>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">电话(mobile)：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="add_user_mobile"
													name="mobile" />
											</div>
										</div>
									</div>

								</div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">出生日期：</label>
											<div class="col-sm-8">
												<span class="date"> <input
													class="form-control date-picker" id="id-date-picker-1"
													type="Date" data-date-format="dd-mm-yyyy" />
												</span>
											</div>
										</div>
									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right">EMAIL：</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="add_user_email"
													name="email" />
											</div>
										</div>
									</div>
								</div>


						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">用户类型：</label>
									<div class="col-sm-8">
										<select class="form-control" id="roleId" name="user_type"></select>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">用户角色：</label>
									<div class="col-sm-16">
										<c:forEach var="role" items="${allRoles}" varStatus="status">
											<div class="col-lg-3 col-sm-3 col-xs-12">
												<div class="checkbox">
													<label> <input type="checkbox" class="colored-blue"
														id="roleIdList${role.id}" name="roleIdLists"
														value="${role.id}"> <span class="text">${role.name}
													</span>
													</label>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right">备注：</label>
									<div class="col-sm-8">
										<textarea id="add_user_remark" cols="80" rows="4"
											name="remark"></textarea>
									</div>
								</div>
							</div>
						</div>

						<table class="table">
							<tr>
								<td align="center"><a href="#" id="userAddBtn"
									onclick="addUser()" class="btn btn-azure">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
									<a href="#" onclick="closeUpdateDiv()" data-dismiss="modal"
									aria-hidden="true" class="btn btn-azure">取消</a></td>
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
	<div class="modal fade" id="userUpdateDiv" tabindex="-1" role="dialog"
		aria-labelledby="userUpdateDiv" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="widget-header bg-themeprimary">
					<span class="widget-caption">用户修改</span>
					<div class="widget-buttons">
						<a data-dismiss="modal" aria-hidden="true"><i
							class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<form class="form-horizontal" role="form" id="updateUserForm">
							
							<div class="row">
							<div class="col-xs-12 col-md-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label class="col-sm-4 control-label no-padding-right">归属公司：</label>
											<div class="col-sm-6">
												<div class="input-group date date col-sm-16">
													<input class="form-control" id="upDateOrgName" type="text"
														value="" readonly> <span class="input-group-btn">
														<a href="javascript:void(0);" id="updateParentTreeSelcCompany"
														class="btn btn-default popover1" data-container="body"
														data-titleclass="bordered-blue" data-toggle="popover"
														data-placement="bottom" data-title="选择所属公司"
														data-content="<div class='popover1 widget-body'>
				                                   <ul id='parentTree' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTree('parentTree','updateParentTreeSelcCompany','update_parent_id','upDateOrgName')>确定</a>&nbsp;
														<a align='right' class='btn btn-blue btn-xs'
														onclick=clearZtree('upDateOrgName','update_parent_id','updateParentTreeSelcCompany')>清除</a>
													</p>
												</div>
												" data-original-title="" title=""> GoTo </a> 
												<input type="text" id="update_parent_id" name="company_id" /> </span>
											</div>
										</div>
									</div>
								</div>


							    <div class="col-sm-6">
									<div class="form-group">
										<label class="col-sm-4 control-label no-padding-right">归属部门：</label>
										<div class="col-sm-6">
											<div class="input-group date date col-sm-16">
												<input class="form-control" id="upDateOrgNameDept" type="text"
													value="" readonly> <span class="input-group-btn">
													<a href="javascript:void(0);" id="updateParentTreeSelcDept"
													class="btn btn-default popover1" data-container="body"
													data-titleclass="bordered-blue" data-toggle="popover"
													data-placement="bottom" data-title="选择所属部门"
													data-content="<div class='popover1 widget-body'>
				                                   <ul id='parentTreeDept' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTreeDept('parentTreeDept','updateParentTreeSelcDept','update_parentIdDept','upDateOrgNameDept')>确定</a>&nbsp;
													<a align='right' class='btn btn-blue btn-xs'
													onclick=clearZtree('upDateOrgNameDept','update_parentIdDept','upDateOrgNameDept')>清除</a>
												</p>
											</div>
											"data-original-title="" title=""> GoTo </a> <input type="text"
												id="update_parentIdDept" name="office_id" /> </span>
										</div>
									</div>
								</div>
								
							</div>

						</div>
								
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">用户名称：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="update_user_id"
											name="id" style="display: none" /> <input type="text"
											class="form-control" id="update_user_name" name="name" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">登录账号：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
											id="update_user_loginName" name="loginName" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">电话(mobile)：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
											id="update_user_mobile" name="mobile" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">EMAIL：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="update_user_email"
											name="email" />
									</div>
								</div>

								<table class="table">
									<tr>
										<td align="center"><a href="#" id="userUpdateBtn"
											onclick="updateUser()" class="btn btn-azure">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="#" onclick="closeUpdateDiv()" data-dismiss="modal"
											aria-hidden="true" class="btn btn-azure">取消</a></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--用户详情-->
	<div class="modal fade" id="userDetailDiv" tabindex="-1" role="dialog"
		aria-labelledby="userDetailDiv" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="widget-header bg-themeprimary">
					<span class="widget-caption">用户详情</span>
					<div class="widget-buttons">
						<a data-dismiss="modal" aria-hidden="true"><i
							class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-md-12">
							<form class="form-horizontal" role="form" id="roleForm">
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">用户名称：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="detail_user_name"
											name="name" disabled="disabled" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">登录账号：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
											id="detail_user_loginName" name="name" disabled="disabled" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">性别：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="detail_user_sex"
											name="disabled" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">生日：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
											id="detail_user_birthday" name="disabled" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">移动-电话：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control"
											id="detail_user_mobile" name="disabled" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label no-padding-right">EMAIL：</label>
									<div class="col-sm-9">
										<input type="text" class="form-control" id="detail_user_email"
											name="disabled" />
									</div>
								</div>
								<table class="table">
									<tr>
										<td align="center"><a href="#" data-dismiss="modal"
											aria-hidden="true" onclick="closeDetailDiv()"
											class="btn btn-azure">取消</a></td>
									</tr>
								</table>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--菜单树-->
	<div id="userTreeDiv" class="modal fade bs-example-modal-sm"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="widget-header bg-blue">
					<span class="widget-caption">菜单选择</span>
					<div class="widget-buttons">
						<a data-dismiss="modal" aria-hidden="true"><i
							class="fa fa-times"></i></a>
					</div>
				</div>
				<div class="modal-body">
					<ul id="ztree" class="ztree"></ul>
				</div>
				<table class="table">
					<tr>
						<td align="right"><a href="#" class="btn btn-blue"
							data-dismiss="modal" onclick="savePower();return false;">确定</a> <a
							href="#" class="btn btn-blue" data-dismiss="modal"
							onclick="closeDetailDiv();return false;">关闭</a></td>
					</tr>
				</table>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<!--Basic Scripts-->
	<script
		src="<%=basePath %>resources/assets/js/jquery-1.11.3/jquery.min.js"></script>
	<script src="<%=basePath %>resources/assets/js/bootstrap.min.js"></script>
	<script
		src="<%=basePath %>resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

	<!--Beyond Scripts-->
	<script src="<%=basePath %>resources/assets/js/beyond.js"></script>

	<!--Page Related Scripts-->
	<script
		src="<%=basePath %>resources/assets/js/datatable/jquery.dataTables.min.js"></script>
	<script
		src="<%=basePath %>resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>

	<!--fileInput用到的js-->
	<script
		src="<%=basePath %>resources/assets/js/fileInput/fileinput.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>resources/assets/js/fileInput/locales/zh.js"></script>

	<!--datatimepicker用到的js-->
	<script
		src="<%=basePath %>resources/assets/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath %>resources/assets/js/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<!--validation用到的js-->
	<script
		src="<%=basePath %>resources/assets/js/validation/bootstrapValidator.js"></script>


	<script src="<%=basePath %>resources/common/boomjs/user.js"></script>

	<script src="<%=basePath %>resources/common/boomjs/dictUtil.js"></script>

	<script src="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>

    <script src="<%=basePath %>resources/assets/js/toastr/toastr.js"></script>    

	<script>
InitiateUserDataTable.init();

getDictionaryListByType('add_user_sex','sex','select','sex',null);

/* 11月24日  */
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
	var check = (treeNode && !treeNode.isParent);
	if (!check) 
	  Notify('父节点不可以选择....', 'top-right', '2000', 'danger', 'fa-tag', true);
	return check;
}

function addRoleReady(){
	$("#roleId").text('');
	 var html = "";  
	    $.ajax({  
	        type: "post",  
	        async: false,  
	        url: basePath+"rest/boom/role/selectRoleId",   // basePath+"boom/user/upload",
	        data: "",  
	        dataType: "json",  
	        success: function(data) {
	        	if (data != 0) {  
	         	var obj = eval(data);
	         	for(var key in obj){ //第一层循环取到各个list 
	         		var List = obj[key]; 
	         		for(var ob in List){ //第二层循环取list中的对象 
	         		  html += "<option value='" + List[ob ].id + "'>" + List[ob ].name + "</option>";
	         		  
	         		     } 
	         		   } 
	        	    }   
		            else { 
		                html = "<option>网络异常</option>";  
		            } 
	        }  
	    });  
	    $(html).appendTo("#roleId");
}

function addOfficeReady(){
	    $.ajax({  
	        type: "post",  
	        async: false,  
	        url: basePath+"rest/boom/user/selectOfficeId",   // basePath+"boom/user/selectOfficeId",
	        data: "",  
	        dataType: "json",  
	        success: function(data) {
	         	var obj = eval(data);
	         	$("#parent_id").val(obj.companyId);
	         	$("#orgName").val(obj.companyName);
	         	$("#parentIdDept").val(obj.officeId);
	         	$("#orgNameDept").val(obj.officeName);
	        }  
	    });  
}


$(function(){/* 文档加载，执行一个函数*/
	
	var bootstrapValidator = $('#addUserForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	loginName: {
                validators: {
                    notEmpty: {
                        message: '请输入用户名'
                    },
                    stringLength: {
                        min: 6,
                        max: 30,
                        message: '用户名长度必须在6到30之间'
                    },
                    threshold :  6 , //有6字符以上才发送ajax请求，（input中输入一个字符，插件会向服务器发送一次，设置限制，6字符以上才开始）
                    remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                        url: basePath+'rest/boom/user/isExistLoginName',//验证地址
                        message: '用户已存在',//提示消息
                        delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                        type: 'POST'//请求方式
                        /**自定义提交数据，默认值提交当前input value
                         *  data: function(validator) {
                              return {
                                  password: $('[name="passwordNameAttributeInYourForm"]').val(),
                                  whatever: $('[name="whateverNameAttributeInYourForm"]').val()
                              };
                           }
                         */
                    }, 
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: '用户名由数字字母下划线和.组成'
                    }
                }
            },
            password: {
                validators: {
                    notEmpty: {
                        message: '请输入密码'
                    },stringLength: {
                        min: 6,
                        max: 30,
                        message: '密码长度必须在6到30之间'
                    },different: {//不能和用户名相同
                        field: 'loginName',//需要进行比较的input name值
                        message: '不能和登录名相同'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            confirmpassword: {
                validators: {
                    notEmpty: {
                        message: '请输入确认密码'
                    }, stringLength: {
                        min: 6,
                        max: 30,
                        message: '确认密码长度必须在6到30之间'
                    },
                    identical: {//相同
                        field: 'password',
                        message: '两次密码不一致'
                    },
                    different: {//不能和用户名相同
                        field: 'loginName',
                        message: '不能和登录名相同'
                    },
                    regexp: {//匹配规则
                        regexp: /^[a-zA-Z0-9_\.]+$/,
                        message: 'The username can only consist of alphabetical, number, dot and underscore'
                    }
                }
            },
            name: {
                validators: {
                    notEmpty: {
                        message: '请输入姓名'
                    }
                }
            },
            birthday:{
            	 validators: {
                     notEmpty: {
                         message: '请输入出生年月'
                     }
                 }
            },
            email:{
           	 validators: {
                 notEmpty: {
                     message: '请输入电子邮箱'
                 },
                 emailAddress: {
                     message: '请输入正确的邮件地址如：123@qq.com'
                 }
             }
        	},
        	mobile:{
              	 validators: {
                     notEmpty: {
                         message: '请输入手机号码'
                     },
                     stringLength: {
                         min: 11,
                         max: 11,
                         message: '请输入11位手机号码'
                     },
                     regexp: {
                         regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                         message: '请输入正确的手机号码'
                     }
                 }
            },
            photoName:{
            	validators: {
                    notEmpty: {
                        message: '请上传照片'
                    }
                }
            }
        }
    });
    
	getAllOrgList('ztree');
	
});

$('.form_date').datetimepicker({
    language:  'zh-CN',
    weekStart: 1,
    todayBtn:  1,
	autoclose: 1,
	todayHighlight: 1,
	startView: 2,
	minView: 2,
	forceParse: 0
});

/**
 * 将from转换为json格式封装
 */
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
		
 });
 
   function addUser(){
	  $('#addUserForm').bootstrapValidator('validate');
	  var isValid = $('#addUserForm').data('bootstrapValidator').isValid();
	  if(isValid){
		  var formData=JSON.stringify($('#addUserForm').serializeObject());
			$.ajax({
				type:"post",
				url:basePath+"rest/boom/user/add",
				data:formData,
				contentType:"application/json; charset=utf-8",
		        dataType:"json",
		        success:function(resultData){
		        	if(resultData.result){
		        		//cleanAddForm();
		            	$('#addUserDiv').modal('hide');
		            	oTableInitiateUser.fnDraw();
		        	}
				}
			});
	  }
		
	}	 
 
 $("#pdFile").fileinput({

     showPreview : true,

     allowedFileExtensions : [ "png", "jpeg", "jpg" ], //限制文件类型

     elErrorContainer : "#fileError",

     browseClass : "btn btn-success",

     browseLabel : "选择文件",

     browseIcon : '<i ></i>',

     removeClass : "btn btn-danger",

     removeLabel : "删除",

     removeIcon : '<i ></i>',

     uploadClass : "btn btn-info",

     uploadLabel : "上传",

     uploadIcon : '<i ></i>',

 });



 $("#addUserForm").submit(function(event) {

     var formData = new FormData(this); //这里用的是this，如果是Form的话需要Form[0]

     event.preventDefault(); //阻止当前提交事件，自行实现，否则会跳转

     $.ajax({

         url : basePath+"rest/boom/user/upload",

         type : 'POST',

         data : formData,

         contentType : false, 

         processData : false,

         success : function(data) {

             if (data.result) {
                 $("#filePath").val(data.filePath);
                 
                 $("#photoName").val(data.photoName);

             } else {
            	 alert(data.msg);
             }

         },

         error : function() {
        	 alert("errot");

         }

     });

 });
 
 $("#parentTreeSelcCompany").click(function(){
	 var treeId = 'parentTree';
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/organization/treeData?type=1",
		    success:function(resultData){
			 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
		
			  	var zTreeNodes = eval(zTreeNodess);
		
				$.fn.zTree.init($("#"+treeId), setting, zTreeNodes).expandAll(true);
				zTree = $.fn.zTree.getZTreeObj(treeId);
				},
			}); 
	    });
 
 $("#updateParentTreeSelcCompany").click(function(){
	 var treeId = 'parentTree';
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/organization/treeData?type=1",
		    success:function(resultData){
			 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
		
			  	var zTreeNodes = eval(zTreeNodess);
		
				$.fn.zTree.init($("#"+treeId), setting, zTreeNodes).expandAll(true);
				zTree = $.fn.zTree.getZTreeObj(treeId);
				},
			}); 
	    });
 
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
 
 $("#updateParentTreeSelcDept").click(function(){
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
 
 $("#parentTreeSelc").click(function(){
	 	getAllOrgList('parentTree');
	});
 
  function getAllOrgList(treeId){
			var setting = {
					view: {
						dblClickExpand: false,
						showLine: true,
						selectedMulti: false
					},
					callback: {
						beforeClick: beforeClickSelect,
						onDblClick: zTreeOnDblClickSelect,
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
				$.fn.zTree.init($("#"+treeId), setting, zTreeNodes).expandAll(true);
				zTree = $.fn.zTree.getZTreeObj(treeId);
				},
			}); 
		}  
		
 function beforeClickSelect(treeId, treeNode){
			var id = treeNode.id == '0' ? '' :treeNode.id;
			 $('#userdatatable').dataTable({
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
	                    "url": basePath+"/rest/boom/user/list?office.id="+id+"&office.name="+treeNode.name,
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
	                    {"data": "id"},
	                    {"data": "companyName"},
	                    {"data": "officeName"},
	                    {"data": "name"},
	                    {"data": "sex"},
	                    {"data": "mobile"},
	                    {"data": "state"},
	                    {"data": "id"}
	                ],
	                "columnDefs": [
						{
						    "targets": 0,
						    "render": function ( data, type, full, meta ) {
						        return '<i class="fa fa-plus-square-o row-details"></i>';
						    }
						},
	                    {
	                        "targets": 7,
	                        "render": function ( data, type, full, meta ) {
	                        	var operation = '<a href="#" class="btn btn-success btn-sm" onclick="goUpdateRole(\''+full.id+'\');"><i class="fa fa-edit"></i>修改</a>&nbsp;'+
	                            '<a href="#" class="btn btn-danger btn-sm" onclick="deleteUser(\''+full.id+'\')"><i class="fa fa-trash-o"></i>删除</a>';
	                        	return operation;
	                        }
	                    }
	                ],
	                //排序
	                "sort":false,
	                "aaSorting": [],
	            });
 			
	}
 
 function zTreeOnDblClickSelect(event, treeId, treeNode) {
		
/* 	   alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked); */ 
	  
	}
 
 function seleteParentTree(treeId,ahrefId,parentId,orgNameId){
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
 
 function goUpdateRole(userId){
	 $.ajax({
		  url: basePath+"rest/boom/user/detail?timestamp="+Date.parse(new Date()),
		  data: {"userId":userId},
		  success: function(resultData){
			  $("#update_user_id").val(resultData.id);
			  $("#update_user_name").val(resultData.name);
			  $("#update_user_loginName").val(resultData.loginName);
			  $("#update_user_mobile").val(resultData.mobile);
			  $("#update_user_email").val(resultData.email);
			  $("#upDateOrgName").val(resultData.companyName);
			  $("#upDateOrgNameDept").val(resultData.officeName);
			  $("#update_parent_id").val(resultData.company.id);
			  $("#update_parentIdDept").val(resultData.office.id);
		  },
		  dataType: "json",
		});
	$('#userUpdateDiv').modal();
 }
 
 function detailUser(id){
		$.ajax({
			  url: basePath+"rest/boom/user/detail?timestamp="+Date.parse(new Date()),
			  data: {"userId":id},
			  success: function(resultData){
				  $("#detail_user_name").val(resultData.name);
				  $("#detail_user_loginName").val(resultData.loginName);
				  $("#detail_user_sex").val(resultData.sex);
				  $("#detail_user_birthday").val(resultData.birthday);
				  $("#detail_user_mobile").val(resultData.mobile);
				  $("#detail_user_email").val(resultData.email);
			  },
			  dataType: "json",
			});
		$('#userDetailDiv').modal();
	}

</script>

</body>
<!--  /Body -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:22:34 GMT -->
</html>
