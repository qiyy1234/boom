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

    <!--treeTable用到是css-->
    <link href="<%=basePath %>resources/assets/js/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet" />

	<!--fileInput用到是css-->
    <link href="<%=basePath %>resources/assets/css/fileInput/fileinput.min.css" rel="stylesheet" />
    
    <!-- datatimepicker用到的css -->
    <link href="<%=basePath %>resources/assets/css/datatimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">

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
	                <span class="widget-caption">用户管理</span>
	                <div class="widget-buttons">
	                </div>
                </div>
            	<div class="widget-body">
                	<table width="100%">
                    	<tr>
                        	<td>登录名：<input type="text" name="loginName" id="loginName"></td>
                            <td align="right">
                            	<a href="#" class="btn btn-blue btn-sm" onclick="findUserList()">查询</a>&nbsp;
                                <a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target="#addUserDiv">添加</a>
                                
                            </td>
                        </tr>
					</table>
                    <br>
                    <table class="table table-striped table-bordered table-hover" id="userdatatable">
                    	<thead>
                        	<tr>
                            	<th></th>
                            	<th width="15%">登录名</th>
                                <th width="10%">姓名</th>
                                <th width="10%">性别</th>
                                <th width="15%">电话</th>
                                <th width="15%">出生年月</th>
                                <th width="15%">状态</th>
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
    
    <!--用户添加-->
    <div class="modal fade" id="addUserDiv" tabindex="-1" role="dialog" aria-labelledby="userAddDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">用户添加</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="addUserForm" method="post" enctype="multipart/form-data">
                            	<div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">登录用户名：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_user_loginname" name="loginName" data-bv-field="loginName" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">密码：</label>
		                            <div class="col-sm-9">
		                            	<input type="password" class="form-control" id="add_user_password" name="password" />
		                            </div>
		                        </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">确认密码：</label>
		                            <div class="col-sm-9">
		                            	<input type="password" class="form-control" id="add_user_confirm_password" name="confirmpassword" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">姓名：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_user_name" name="name" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">性别：</label>
		                            <div class="col-sm-9" id="add_user_sex">
		                            </div>
                                </div>
                                <div class="form-group">
					                <label class="col-sm-2 control-label no-padding-right">出生日期：</label>
					                <div class="col-sm-9">
					                <div class="input-group date form_date col-sm-5" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
					                    <input class="form-control" size="16" type="text" value="" readonly>
					                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
										<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
					                </div>
									<input type="hidden" id="dtp_input2" value="" name="birthday" /><br/>
									</div>
					            </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">邮箱：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_user_email" name="email" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">电话：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="add_user_mobile" name="mobile" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">备注：</label>
		                            <div class="col-sm-9">
		                            	<textarea id="add_user_remark" cols="80" rows="5" name="remark"></textarea>
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">上传照片：</label>
		                            <div class="col-sm-9">
		                            	<input id="filePath" name="photoUrl" style="display:none" />
		                            	<input id="photoName" name="photoName" style="display:none" />
		                            	<input id="pdFile" name="file" type="file">
								        <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
								
								        <div id="fileError" class="help-block"></div>
		                            </div>
						
						    	</div>

                               <table class="table" >
                               		<tr>
                                    	<td align="center">
                                        	<a href="#" id="userAddBtn" onclick="addUser()" class="btn btn-azure">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                       		<a href="#" onclick="closeUpdateDiv()" data-dismiss="modal" aria-hidden="true"  class="btn btn-azure">取消</a>
                                        </td>
                                    </tr>
                               </table>

                            </form>
                           <!-- <form enctype="multipart/form-data" id="uploadForm">

						    <div id="uploadFileDiv"  style="width: 60%;">
						
						        <input id="pdFile" name="file" type="file">
						        <p class="help-block">支持jpg、jpeg、png、gif格式，大小不超过2.0M</p>
						
						        <div id="fileError" class="help-block"></div>
						
						        <br />
						
						    </div>
						
							</form> -->
							
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    
    <!--角色修改-->
    <div class="modal fade" id="userUpdateDiv" tabindex="-1" role="dialog" aria-labelledby="userUpdateDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">用户修改</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="updateUserForm">
                                <div class="form-group">
                                    <label  class="col-sm-2 control-label no-padding-right">用户名称：</label>
                                    <div class="col-sm-9">
                                    	<input type="text" class="form-control" id="update_user_id" name="id" style="display: none"/>
                                        <input type="text" class="form-control" id="update_user_name" name="name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">登录账号：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="update_user_loginName" name="loginName" />
                                    </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">移动-电话：</label>
		                            <div class="col-sm-9">
                                    <input type="text" class="form-control" id="update_user_mobile" name="mobile" />
		                            </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">EMAIL：</label>
		                            <div class="col-sm-9">
                                     <input type="text" class="form-control" id="update_user_email" name="email" />
		                            </div>
                                </div>

                                <table class="table">
                                	<tr>
                                    	<td align="center">
                                        	<a href="#" id="userUpdateBtn" onclick="updateUser()"  class="btn btn-azure">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
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
    
    <!--用户详情-->
    <div class="modal fade" id="userDetailDiv" tabindex="-1" role="dialog" aria-labelledby="userDetailDiv" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="widget-header bg-themeprimary">
                    <span class="widget-caption">用户详情</span>
                    <div class="widget-buttons">
                        <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <form class="form-horizontal" role="form" id="roleForm">
                                <div class="form-group">
		                        	<label  class="col-sm-2 control-label no-padding-right">用户名称：</label>
		                        	<div class="col-sm-9">
                                        <input type="text" class="form-control" id="detail_user_name" name="name" disabled="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
		                        	<label class="col-sm-2 control-label no-padding-right">登录账号：</label>
		                            <div class="col-sm-9">
		                            	<input type="text" class="form-control" id="detail_user_loginName" name="name" disabled="disabled" />
		                            </div>
		                        </div>
		                        <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">性别：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_user_sex" name="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">生日：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_user_birthday" name="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">移动-电话：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_user_mobile" name="disabled" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label no-padding-right">EMAIL：</label>
                                    <div class="col-sm-9">
                                       <input type="text" class="form-control" id="detail_user_email" name="disabled" />
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

    <!--Basic Scripts-->
    <script src="<%=basePath %>resources/assets/js/jquery-1.11.3/jquery.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="<%=basePath %>resources/assets/js/beyond.js"></script>

    <!--Page Related Scripts-->
    <script src="<%=basePath %>resources/assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>

	<!--fileInput用到的js-->
	<script src="<%=basePath %>resources/assets/js/fileInput/fileinput.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/assets/js/fileInput/locales/zh.js"></script>

	<!--datatimepicker用到的js-->
	<script src="<%=basePath %>resources/assets/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>resources/assets/js/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>

	<!--validation用到的js-->
	<script src="<%=basePath %>resources/assets/js/validation/bootstrapValidator.js"></script>


	<script src="<%=basePath %>resources/common/boomjs/user.js"></script>
	
	<script src="<%=basePath %>resources/common/boomjs/dictUtil.js"></script>

<script>
InitiateUserDataTable.init();


getDictionaryListByType('add_user_sex','sex','select','sex',null);


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
                        url: basePath+'boom/user/isExistLoginName',//验证地址
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
				url:basePath+"boom/user/add",
				data:formData,
				contentType:"application/json; charset=utf-8",
		        dataType:"json",
		        success:function(resultData){
		        	alert(resultData.msg);
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

         url : basePath+"boom/user/upload",

         type : 'POST',

         data : formData,

         contentType : false, //这两个参数需要被定义，否则报错

         processData : false,

         success : function(data) {

             if (data.result) {
                 alert(data.msg);
                 $("#filePath").val(data.filePath);
                 
                 $("#photoName").val(data.photoName);

             } else {
            	 alert(data.msg);
             }

         },

         error : function() {
        	 alert("errot");

            /*  grid.message({

                 type : 'error',

                 content : '上传失败'

             });
 */
         }

     });

 });

</script>

</body>
<!--  /Body -->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:22:34 GMT -->
</html>
