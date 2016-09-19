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

    <!--ztree用到的css-->
    <link type="text/css" rel="stylesheet" href="<%=basePath %>resources/assets/zTree/2.6/zTreeStyle.css"/>
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
            	<div class="widget-header bg-blue">
	                <span class="widget-caption">角色管理</span>
	                <div class="widget-buttons">
	                </div>
                </div>
            	<div class="widget-body">
                	<table width="100%">
                    	<tr>
                        	<td>名称：<input type="text" name="find_name" id="find_name"></td>
                            <td align="right">
                            	<a href="#" class="btn btn-blue btn-sm" onclick="findRoleList()">查询</a>&nbsp;
                                <shiro:hasPermission name="role:add"><a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target="#roleAddDiv">添加</a></shiro:hasPermission>
                                
                            </td>
                        </tr>
					</table>
                    <br>
                    <table class="table table-striped table-bordered table-hover" id="roledatatable">
                    	<thead>
                        	<tr>
                            	<th width="15%">角色职位</th>
                                <th width="10%">英文名称</th>
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
		                        	<label  class="col-sm-2 control-label no-padding-right">角色职位：</label>
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
                            <form class="form-horizontal" role="form" id="updateRoleForm">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label no-padding-right">角色职位：</label>
                                    <div class="col-sm-9">
                                    	<input type="text" class="form-control" id="update_role_id" name="id" style="display: none"/>
                                        <input type="text" class="form-control" id="update_role_name" name="name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">英文名称：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="update_role_enname" name="enname" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">创建人：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="update_role_create_user" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">创建时间：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="update_role_create_date" disabled="disabled"/>
                                    </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea class="form-control" id="update_role_remark" name="remark">
		                            	</textarea>
		                            </div>
                                </div>

                                <table class="table">
                                	<tr>
                                    	<td align="center">
                                        	<a href="#" id="roleUpdateBtn" onclick="updateRole()"  class="btn btn-azure">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                <div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right"></label>
		                        	<div class="col-sm-9" id="sload">
                                        <ul id="tree" class="tree" style="overflow:auto;"></ul>
                                    </div>
                                    <input type="hidden" class="form-control" id="roleId" name="roleId" />
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
    
    
    <!-- 测试页  -->
    <div class="col-lg-8 col-sm-8 col-xs-12">
                                    <div class="widget">
                                        <div class="widget-header bordered-bottom bordered-white bg-sky">
                                            <span class="widget-caption">Bordered and Colored Widget</span>
                                            <div class="widget-buttons">
                                                <a href="#" data-toggle="maximize">
                                                    <i class="fa fa-expand"></i>
                                                </a>
                                                <a href="#" data-toggle="collapse">
                                                    <i class="fa fa-minus"></i>
                                                </a>
                                            </div><!--Widget Buttons-->
                                        </div><!--Widget Header-->
                                        <div class="widget-body bg-sky bordered-bottom bordered-white">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                                        </div><!--Widget Body-->
                                    </div><!--Widget-->
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
    <script src="<%=request.getContextPath()%>/resources/assets/js/treeTable/jquery.treeTable.min.js"></script>
	
 	<!--ztree用到的js-->
<%--<script src="<%=basePath %>resources/assets/js/ztree/jquery.ztree.core-3.5.min.js"></script> --%>
<%--<script type="text/javascript" src="<%=basePath %>resources/assets/zTree/2.6/jquery.ztree-2.6.min.js"></script> --%>
    <script type="text/javascript" src="<%=basePath %>resources/assets/zTree/2.6/jquery.ztree-2.6.min.js"></script>
<%--<script type="text/javascript" src="<%=basePath %>resources/assets/zTree/2.6/jquery.ztree-2.6.min.js"></script> --%>
<script>
/* InitiateRoleDataTable.init(); 加载 boomjs 的驱动程序  */
 InitiateRoleDataTable.init(); 

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
 
 function addRole(){
		var formData=JSON.stringify($('#roleForm').serializeObject());
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
 
	var zTree;
 	var setting = {
		    showLine: true,
		    checkable: true
		    };
 	
  function powerRole(roleId){
	   $("#roleId").val(roleId);
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/role/powerRole",
			data: {"roleId":roleId},
		    success:function(resultData){
		    //var zTreeNodes = eval(resultData.zTreeNodes);
			var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
		    var zT  = zTreeNodess.replace(/subsetPermission/gm,'nodes');  
		  	var zTreeNodes = eval(zT);
		  	   $("#ZT").val(JSON.stringify(zTreeNodes));
		  	
		 	zTree = $("#tree").zTree(setting, zTreeNodes); 
		 	  
			},
		}); 
		$('#powerDetailDiv').modal();
	} 
 
  
  function savePower(){
		var nodes = zTree.getCheckedNodes();
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
	 
	  
  }

</script>

</body>
<!--  /Body -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:22:34 GMT -->
</html>
