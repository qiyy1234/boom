<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %> 
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

    <!--ztree用到的css-->
    <link href="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>

    <!--treeTable用到是css-->
	<link href="<%=basePath %>resources/assets/js/treeTable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />


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
    <!--  /Loading Container -->
    
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">

            <!-- Page Content -->
            <div class="page-body">
            	<div class="row">
            		<div class="col-lg-3 col-sm-3 col-xs-3">
                    	<div class="widget">
                        	<div class="widget-header bg-blue">
                            	<i class="widget-icon fa fa-arrow-down"></i>
                                <span class="widget-caption">Colored Header</span>
                                <div class="widget-buttons">
                                	<a href="#" data-toggle="config">
                                    	<i class="fa fa-cog"></i>
                                    </a>
                                    <a href="#" data-toggle="maximize">
                                        <i class="fa fa-expand"></i>
                                    </a>
                                    <a href="#" data-toggle="collapse">
                                        <i class="fa fa-minus"></i>
                                    </a>
                                    <a href="#" data-toggle="dispose">
                                        <i class="fa fa-times"></i>
                                    </a>
                                 </div><!--Widget Buttons-->
                              </div><!--Widget Header-->
                          <div class="widget-body">

                          	<div id="ztree" class="ztree"></div>

                       </div><!--Widget Body-->
                    </div><!--Widget-->
                    
                </div>
                
                <div class="col-lg-9 col-sm-9 col-xs-9">
                	<div class="widget">
                    	<div class="widget-header bg-blue">
                        	<i class="widget-icon fa fa-arrow-down"></i>
                            <span class="widget-caption">Colored Header</span>
                            <div class="widget-buttons">
                            	<a href="#" data-toggle="config">
                                	<i class="fa fa-cog"></i>
                                </a>
                                <a href="#" data-toggle="maximize">
                                    <i class="fa fa-expand"></i>
                                </a>
                                <a href="#" data-toggle="collapse">
                                    <i class="fa fa-minus"></i>
                                </a>
                                <a href="#" data-toggle="dispose">
                                    <i class="fa fa-times"></i>
                                </a>
                             </div><!--Widget Buttons-->
                          </div><!--Widget Header-->
                      <div class="widget-body">
                      		<table width="100%">
                                <tr>
                                    <td>名称：<input></td>
                                    <td align="right">
                                        <a href="#" class="btn btn-blue btn-sm" onclick="">查询</a>&nbsp;
                                        <a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target="#addOrgDiv" onclick="">添加</a>
                                    </td>
                                </tr>

                            </table>
                            <br>
                      	<table id="orgtreeTable" class=" treetable table table-striped table-bordered table-condensed">
                            <thead><tr><th width="10%">名称</th><th width="15%">机构编码</th><th width="10%" style="text-align:center;">机构类型</th><th width="20%">操作</th></tr></thead>
                            <tbody id="orgTableBody">
        
                            </tbody>
                        </table>
                      </div><!--Widget Body-->
                </div><!--Widget-->
                    
             </div>
          </div>
       </div>
   </div><!-- /Page Content -->
</div>
        <!-- /Page Container -->
        <!-- Main Container -->

    
    <!--机构添加-->
    <div class="modal fade" id="addOrgDiv" tabindex="-1" role="dialog" aria-labelledby="orgAddDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">机构添加</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                     <form class="form-horizontal" role="form" id="addOrgForm" method="post" enctype="multipart/form-data">
                        <div class="col-xs-12 col-md-12">
                            	<div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">上级机构：</label>
		                            <div class="col-sm-4">
				                    	<div class="input-group">
		                                	<input type="text" class="form-control" readonly="readonly" id="orgName" name="orgName" placeholder="请选择" />
		                                    <span class="input-group-btn">
		                                    	<a href="javascript:void(0);" id="parentTreeSelc" class="btn btn-default popover1"
				                                   data-container="body" data-titleclass="bordered-blue"
				                                   data-toggle="popover" data-placement="bottom" data-title="选择上级机构"
				                                   data-content="<div class='popover1 widget-body' >
				                                   <ul id='parentTree' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTree('parentTree','parentTreeSelc','parent_id','orgName')>确定</a>&nbsp;
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=clearZtree('orgName','parent_id','parentTreeSelc')>清除</a></p></div>" data-original-title="" title="">
				                                            GoTo
				                                </a>
				                                <input type="hidden" id="parent_id" name="parentId"/>
		                                    </span>
		                                </div>
		                            </div>
                                
                                    <label  class="col-sm-2 control-label no-padding-right">机构名称：</label>
                                      <div class="col-sm-4">
                                      		<input type="text" class="form-control" id="add_name" name="name" data-bv-field="name" />
                                      </div>
                                </div>
                                       
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">机构编码：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="add_code" name="code" />
		                            </div>
		                        
		                        	<label class="col-sm-2 control-label no-padding-right">机构级别：</label>
		                            <div class="col-sm-4">
		                            	<select class="form-control" id="add_grade" name="grade">
		                            		<option value="">--请选择--</option>
		                            		<option value="1">一级</option>
		                            		<option value="2">二级</option>
		                            		<option value="3">三级</option>
		                            		<option value="4">四级</option>
                                     	</select>
		                            </div>
                                </div>
                                
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">联系地址：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="add_address" name="address" />
		                            </div>
		                        	<label class="col-sm-2 control-label no-padding-right">邮政编码：</label>
		                            <div class="col-sm-4" id="add_user_sex">
		                            	<input type="text" class="form-control" id="add_zip_code" name="zip_code" />
		                            </div>
                                </div>
                                <div class="form-group">
					                <label class="col-sm-2 control-label no-padding-right">负责人：</label>
					                <div class="col-sm-4">
					                	<input type="text" class="form-control" id="add_master" name="master" />
									</div>
					            
		                        	<label class="col-sm-2 control-label no-padding-right">电话：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="add_phone" name="phone" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">传真：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="add_fax" name="fax" />
		                            </div>
                               
		                        	<label class="col-sm-2 control-label no-padding-right">邮箱：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="add_email" name="email" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea id="add_remarks" cols="80" rows="5" name="remarks"></textarea>
		                            </div>
						
						    	</div>

                               <table class="table" >
                               		<tr>
                                    	<td align="center">
                                        	<a href="#" id="userAddBtn" onclick="addOrg()" class="btn btn-azure">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                       		<a href="#" onclick="closeUpdateDiv()" data-dismiss="modal" aria-hidden="true"  class="btn btn-azure">取消</a>
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
    
    <!--机构修改-->
    <div class="modal fade" id="updateOrgDiv" tabindex="-1" role="dialog" aria-labelledby="orgUpdateDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">机构修改</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="updateOrgForm" method="post">
                            	<div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">上级机构：</label>
		                            <div class="col-sm-4">
				                    	<div class="input-group">
		                                	<input type="text" class="form-control" readonly="readonly" id="update_parent_orgName" name="orgName" placeholder="请选择" />
		                                    <span class="input-group-btn">
		                                    	<a href="javascript:void(0);" id="updateParentTreeSelc" class="btn btn-default popover1"
				                                   data-container="body" data-titleclass="bordered-blue"
				                                   data-toggle="popover" data-placement="bottom" data-title="选择上级机构"
				                                   data-content="<div class='popover1 widget-body' >
				                                   <ul id='updateParentTree' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTree('updateParentTree','updateParentTreeSelc','update_parent_id','update_parent_orgName')>确定</a>&nbsp;
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=clearZtree('update_parent_orgName','update_parent_id','updateParentTreeSelc')>清除</a></p></div>" data-original-title="" title="">
				                                            GoTo
				                                </a>
				                                <input type="hidden" id="update_parent_id" name="parentId"/>
				                                <input type="hidden" id="update_id" name="id" />
		                                    </span>
		                                </div>
		                            </div>
                                
                                    <label  class="col-sm-2 control-label no-padding-right">机构名称：</label>
                                      <div class="col-sm-4">
                                      		<input type="text" class="form-control" id="update_name" name="name" data-bv-field="name" />
                                      </div>
                                </div>
                                       
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">机构编码：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="update_code" name="code" />
		                            </div>
		                        
		                        	<label class="col-sm-2 control-label no-padding-right">机构级别：</label>
		                            <div class="col-sm-4">
		                            	<select class="form-control" id="update_grade" name="grade">
		                            		<option value="">--请选择--</option>
		                            		<option value="1">一级</option>
		                            		<option value="2">二级</option>
		                            		<option value="3">三级</option>
		                            		<option value="4">四级</option>
                                     	</select>
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">联系地址：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="update_address" name="address" />
		                            </div>
		                        	<label class="col-sm-2 control-label no-padding-right">邮政编码：</label>
		                            <div class="col-sm-4" id="add_user_sex">
		                            	<input type="text" class="form-control" id="update_zip_code" name="zipCode" />
		                            </div>
                                </div>
                                <div class="form-group">
					                <label class="col-sm-2 control-label no-padding-right">负责人：</label>
					                <div class="col-sm-4">
					                	<input type="text" class="form-control" id="update_master" name="master" />
									</div>
					            
		                        	<label class="col-sm-2 control-label no-padding-right">电话：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="update_phone" name="phone" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">传真：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="update_fax" name="fax" />
		                            </div>
                               
		                        	<label class="col-sm-2 control-label no-padding-right">邮箱：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="update_email" name="email" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea id="update_remarks" cols="80" rows="5" name="remarks"></textarea>
		                            </div>
						
						    	</div>

                               <table class="table" >
                               		<tr>
                                    	<td align="center">
                                    		<a href="#" id="orgUpdateBtn" onclick="updateOrg()" class="btn btn-azure">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                       		<a href="#" onclick="closeDetailDiv()" data-dismiss="modal" aria-hidden="true"  class="btn btn-azure">取消</a>
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
    
    <!--机构详情-->
    <div class="modal fade" id="detailOrgDiv" tabindex="-1" role="dialog" aria-labelledby="orgDetailDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">机构详情</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="detailOrgForm" method="post">
                            	<div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">上级机构：</label>
		                            <div class="col-sm-4">
				                    	<div class="input-group">
		                                	<input type="text" class="form-control" readonly="readonly" id="detail_parent_orgName" name="orgName" placeholder="请选择" />
		                                    <span class="input-group-btn">
		                                    	<a href="javascript:void(0);" id="parentTreeSelc" class="btn btn-default popover1"
				                                   data-container="body" data-titleclass="bordered-blue"
				                                   data-toggle="popover" data-placement="bottom" data-title="选择上级机构"
				                                   data-content="<div class='popover1 widget-body' >
				                                   <ul id='parentTree' class='popover1 ztree'></ul>
				                                   <p class='text-right' style='margin-top:5px;margin-bottom:-3px;'>
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=seleteParentTree()>确定</a>&nbsp;
				                                   <a align='right' class='btn btn-blue btn-xs' onclick=clearZtree('parentTreeSelc','parent_id')>清除</a></p></div>" data-original-title="" title="">
				                                            GoTo
				                                </a>
				                                <input type="hidden" id="parent_id" name="parentId"/>
		                                    </span>
		                                </div>
		                            </div>
                                
                                    <label  class="col-sm-2 control-label no-padding-right">机构名称：</label>
                                      <div class="col-sm-4">
                                      		<input type="text" class="form-control" id="detail_name" name="name" data-bv-field="name" />
                                      </div>
                                </div>
                                       
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">机构编码：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="detail_code" name="code" />
		                            </div>
		                        
		                        	<label class="col-sm-2 control-label no-padding-right">机构级别：</label>
		                            <div class="col-sm-4">
		                            	<select class="form-control" id="detail_grade" name="grade">
		                            		<option value="">--请选择--</option>
		                            		<option value="1">一级</option>
		                            		<option value="2">二级</option>
		                            		<option value="3">三级</option>
		                            		<option value="4">四级</option>
                                     	</select>
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">联系地址：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="detail_address" name="address" />
		                            </div>
		                        	<label class="col-sm-2 control-label no-padding-right">邮政编码：</label>
		                            <div class="col-sm-4" id="add_user_sex">
		                            	<input type="text" class="form-control" id="detail_zip_code" name="zip_code" />
		                            </div>
                                </div>
                                <div class="form-group">
					                <label class="col-sm-2 control-label no-padding-right">负责人：</label>
					                <div class="col-sm-4">
					                	<input type="text" class="form-control" id="detail_master" name="master" />
									</div>
					            
		                        	<label class="col-sm-2 control-label no-padding-right">电话：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="detail_phone" name="phone" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">传真：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="detail_fax" name="fax" />
		                            </div>
                               
		                        	<label class="col-sm-2 control-label no-padding-right">邮箱：</label>
		                            <div class="col-sm-4">
		                            	<input type="text" class="form-control" id="detail_email" name="email" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea id="detail_remarks" cols="80" rows="5" name="remarks"></textarea>
		                            </div>
						
						    	</div>

                               <table class="table" >
                               		<tr>
                                    	<td align="center">
                                       		<a href="#" onclick="closeDetailDiv()" data-dismiss="modal" aria-hidden="true"  class="btn btn-azure">取消</a>
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

    <!--Basic Scripts-->
    <script src="<%=basePath %>resources/assets/js/jquery-1.11.3/jquery.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="<%=basePath %>resources/assets/js/beyond.js"></script>

	<!--fileInput用到的js-->
	<script src="<%=basePath %>resources/assets/js/fileInput/fileinput.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/assets/js/fileInput/locales/zh.js"></script>

	<!--datatimepicker用到的js-->
	<script src="<%=basePath %>resources/assets/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/assets/js/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<!--validation用到的js-->
	<script src="<%=basePath %>resources/assets/js/validation/bootstrapValidator.js"></script>
	
	<!-- ztree用到的js -->
	<script type="text/javascript" src="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js"></script>
	
	<!--treeTable用到的js-->
    <script src="<%=basePath %>resources/assets/js/treeTable/jquery.treetable.js" type="text/javascript"></script>

	<script src="<%=basePath %>resources/common/boomjs/organizationTree.js"></script>
	<script src="<%=basePath %>resources/common/boomjs/organization.js"></script>
	
<script>

$("#parentTreeSelc").click(function(){
	getAllOrgList('parentTree');
});

$("#updateParentTreeSelc").click(function(){
	getAllOrgList('updateParentTree');
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
		
		
		var bootstrapValidator = $('#addOrgForm').bootstrapValidator({
	        message: 'This value is not valid',
	        feedbackIcons: {
	            valid: 'glyphicon glyphicon-ok',
	            invalid: 'glyphicon glyphicon-remove',
	            validating: 'glyphicon glyphicon-refresh'
	        },
	        fields: {
	        	orgName: {
	                validators: {
	                    notEmpty: {
	                        message: '请选择上级机构'
	                    }
	                }
	            },name: {
	                validators: {
	                    notEmpty: {
	                        message: '请输入机构名称'
	                    }
	                }
	            },code: {
	                validators: {
	                    notEmpty: {
	                        message: '请输入机构编码'
	                    }
	                }
	            },grade: {
	                validators: {
	                    notEmpty: {
	                        message: '请选择机构等级'
	                    }
	                }
	            }
	        }
	    });
		
		getAllOrgList('ztree');
		
		findOrganizationList();
		
 });
 
   function addOrg(){
	  $('#addOrgForm').bootstrapValidator('validate');
	  var isValid = $('#addOrgForm').data('bootstrapValidator').isValid();
	  if(isValid){
		  var formData=JSON.stringify($('#addOrgForm').serializeObject());
			$.ajax({
				type:"post",
				url:basePath+"rest/boom/organization/add",
				data:formData,
				contentType:"application/json; charset=utf-8",
		        dataType:"json",
		        success:function(resultData){
		        	alert(resultData.msg);
		        	if(resultData.result){
		        		//cleanAddForm();
		            	$('#addOrgDiv').modal('hide');
		            	findOrganizationList();
		            	//var treeObj = $.fn.zTree.getZTreeObj('ztree');
		            	//treeObj.refresh();
		        	}
				}
			});
	  }
		
	}	 
   
   function updateOrg(){
		  $('#updateOrgForm').bootstrapValidator('validate');
		  var isValid = $('#updateOrgForm').data('bootstrapValidator').isValid();
		  if(isValid){
			  var formData=JSON.stringify($('#updateOrgForm').serializeObject());
				$.ajax({
					type:"post",
					url:basePath+"rest/boom/organization/update",
					data:formData,
					contentType:"application/json; charset=utf-8",
			        dataType:"json",
			        success:function(resultData){
			        	alert(resultData.msg);
			        	if(resultData.result){
			        		//cleanAddForm();
			            	$('#updateOrgDiv').modal('hide');
			            	findOrganizationList();
			            	//var treeObj = $.fn.zTree.getZTreeObj('ztree');
			            	//treeObj.refresh();
			        	}
					}
				});
		  }
			
		}	 
  
 
 
 
 var local = window.location;  
 var contextPath = local.pathname.split("/")[1];  
 var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/"; 



 function findOrganizationList(){
	 $("#orgTableBody").html("");
     $.ajax({
         url: basePath+"rest/boom/organization/list?timestamp="+new Date(),
         data: {},
         success: function(data){
         	
         	var result=data.data;
         	var d_html = "";
         	for(var i=0;i<result.length;i++){
         		var d=result[i];
         		d_html = d_html + "<tr data-tt-id='"+d.id+"' data-tt-parent-id='"+d.parentId+"'>";
         		d_html = d_html + "<td>"+d.name+"</td>";
         		d_html = d_html + "<td>"+d.code+"</td>";
         		d_html = d_html + "<td>"+d.grade+"</td>";
         		
         		
         		d_html = d_html + '<td><a href="#" class="btn btn-blue btn-sm" onclick="detailOrg(\''+d.id+'\')"><i class="fa fa-search-plus"></i>查看</a>&nbsp;'+
                '<a href="#" class="btn btn-success btn-sm" onclick="goUpdateOrg(\''+d.id+'\');"><i class="fa fa-edit"></i>修改</a>&nbsp;'+
                '<a href="#" class="btn btn-danger btn-sm" onclick="deleteOrg(\''+d.id+'\')"><i class="fa fa-trash-o"></i>删除</a></tr>';
         		
         		d_html = d_html + "</tr>";
         		
         	};
         	
         	$("#orgTableBody").append(d_html);
         	$("#orgtreeTable").treetable('destroy');//清除原有treetable
         	$("#orgtreeTable").treetable({ expandable: true });
         	
         },
         dataType: "json"
     });
 }

 function deleteOrg(id){
	 $.ajax({
		  url: basePath+"rest/boom/organization/delete",
		  data: {"orgId":id},
		  success: function(resultData){
			  alert(resultData.msg);
	          if(resultData.result){
	        	  findOrganizationList();
	        	  //var treeObj = $.fn.zTree.getZTreeObj('ztree');
	              //treeObj.refresh();
	          }
		  },
		  dataType: "json"
	});
 }
 
 function goUpdateOrg(orgId){
	 $.ajax({
		  url: basePath+"rest/boom/organization/detail?timestamp="+Date.parse(new Date()),
		  data: {"orgId":orgId},
		  success: function(resultData){
			  $("#update_id").val(resultData.id);
			  $("#update_parent_id").val(resultData.parentId);
			  $("#update_parent_orgName").val(resultData.parentOrgName);
			  $("#update_name").val(resultData.name);
			  $("#update_code").val(resultData.code);
			  $("#update_grade").val(resultData.grade);
			  $("#update_address").val(resultData.address);
			  $("#update_zip_code").val(resultData.zipCode);
			  $("#update_master").val(resultData.master);
			  $("#update_phone").val(resultData.phone);
			  $("#update_fax").val(resultData.fax);
			  $("#update_email").val(resultData.email);
			  $("#update_remarks").val(resultData.remarks);
			  
		  },
		  dataType: "json"
		});
	$('#updateOrgDiv').modal();
	 
 }
 
 
 function detailOrg(orgId){
		$.ajax({
			  url: basePath+"rest/boom/organization/detail?timestamp="+Date.parse(new Date()),
			  data: {"orgId":orgId},
			  success: function(resultData){
				  $("#detail_parent_orgName").val(resultData.parentOrgName);
				  $("#detail_name").val(resultData.name);
				  $("#detail_code").val(resultData.code);
				  $("#detail_grade").val(resultData.grade);
				  $("#detail_address").val(resultData.address);
				  $("#detail_zip_code").val(resultData.zipCode);
				  $("#detail_master").val(resultData.master);
				  $("#detail_phone").val(resultData.phone);
				  $("#detail_fax").val(resultData.fax);
				  $("#detail_email").val(resultData.email);
				  $("#detail_remarks").val(resultData.remarks);
				  
			  },
			  dataType: "json"
			});
		$('#detailOrgDiv').modal();
	}





</script>

</body>
<!--  /Body -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:22:34 GMT -->
</html>
