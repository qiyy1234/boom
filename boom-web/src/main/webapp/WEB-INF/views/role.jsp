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
    <link rel="stylesheet" href="<%=basePath %>resources/assets/css/zTreeStyle/zTreeStyle.css" type="text/css">

    <!--treeTable用到是js-->
    <link href="<%=basePath %>resources/assets/js/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet" />

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
                        	<td>名称：<input></td>
                            <td align="right">
                            	<a href="#" class="btn btn-blue btn-sm" onclick="">查询</a>&nbsp;
                                <a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target="#roleAddDiv">添加</a>
                                
                            </td>
                        </tr>
					</table>
                    <br>
                    <table class="table table-striped table-bordered table-hover" id="roledatatable">
                    	<thead>
                        	<tr>
                            	<th width="15%">角色名称</th>
                                <th width="10%">英文名称</th>
                                <th width="15%">所属机构</th>
                                <th width="10%">数据范围</th>
                                <th width="10%">创建人</th>
                                <th width="10%">创建时间</th>
                                <th width="35%">操作</th>
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
                            <form class="form-horizontal form-bordered" role="form" id="roleForm">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label no-padding-right">角色名称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="role_name" name="name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">英文名称</label>
                                    <div class="col-sm-10">
                                       <input type="text" class="form-control" id="role_enname" name="enname" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="role_office_id" name="officeName" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">数据范围 </label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="role_data_scope" name="dataScope"/>
                                    </div>
                                </div>

                                
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <a href="#" onclick="addRole()"  class="btn btn-azure">保存</a>
                                        <a href="#" onclick="closeUpdateDiv()"  class="btn btn-azure">取消</a>
                                    </div>
                                </div>

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
                            <form class="form-horizontal form-bordered" role="form" id="roleForm">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label no-padding-right">角色名称</label>
                                    <div class="col-sm-10">
                                        <span id="roleName"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">英文名称</label>
                                    <div class="col-sm-10">
                                       <span id="roleEnName"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">所属机构</label>
                                    <div class="col-sm-10">
                                        <span id="roleOfficeId"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">数据范围 </label>
                                    <div class="col-sm-10">
                                        <span id="roleDataScope"></span>
                                    </div>
                                </div>

                                
                                <div class="form-group">
                                    <div class="col-sm-9">
                                        <a href="#" data-dismiss="modal" aria-hidden="true" onclick="closeDetailDiv()"  class="btn btn-azure">取消</a>
                                    </div>
                                </div>

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

    <!--Page Related Scripts-->
    <script src="<%=basePath %>resources/assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>


	<script src="<%=basePath %>resources/common/boomjs/role.js"></script>

<script>

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
		alert("保存角色");
		var formData=JSON.stringify($('#roleForm').serializeObject());
		$.ajax({
			type:"post",
			url:basePath+"boom/role/add",
			data:formData,
			contentType:"application/json; charset=utf-8",
	        dataType:"json",
	        success:function(resultData){
	        	alert(resultData.msg);
	        	if(resultData.result){
	            	cleanForm();
	            	oTableInitiateRole.fnDraw();
	        	}
			}
		});
		
	}	

</script>

</body>
<!--  /Body -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:22:34 GMT -->
</html>
