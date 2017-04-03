var local = window.location;  
var contextPath = local.pathname.split("/")[1];  
var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/"; 
var oTableInitiateRole = null;

var InitiateRoleDataTable = function () {
    return {
        init: function () {
            //Datatable Initiating
        	oTableInitiateRole = $('#roledatatable').dataTable({
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
                    "url": basePath+"rest/boom/role/list",
                    "dataSrc": "data",
                    "data": function ( d ) {
                    	//查询条件
                    	d.name = $("#find_name").val();
                    }
                },
                //本地搜索
                "searching": false,
                //每页显示多少条数据
                "lengthChange":false,
                //每页显示数量：5条记录
                "iDisplayLength": 5,
                "columns": [
                    {"data": "name"},
                    {"data": "enname"},
                    {"data": "office.name"},
                    {"data": "dataScope"},
                    {"data": "create_user"},
                    {"data": "create_date"},
                    {"data":"id"}
                ],
                "columnDefs": [
                    {
                        "targets": 6,
                        "render": function ( data, type, full, meta ) {
                        	var operation = '<a href="#" class="btn btn-blue btn-sm" onclick="detailRole(\''+full.id+'\')"><i class="fa fa-search-plus"></i>查看</a>&nbsp;'+
                            '<a href="#" class="btn btn-success btn-sm" onclick="goUpdateRole(\''+full.id+'\');"><i class="fa fa-edit"></i>修改</a>&nbsp;'+
                            '<a href="#" class="btn btn-danger btn-sm"  onclick="deleteRole(\''+full.id+'\')"><i class="fa fa-trash-o"></i>删除</a>&nbsp;'+
                            '<a href="#" class="btn btn-primary btn-sm" onclick="powerRoleDG(\''+full.id+'\')"><i class="fa fa-gift"></i>菜单赋权</a>&nbsp;';
                        	return operation;
                        }
                    }
                ],
                //排序
                "sort":false,
                "aaSorting": []
            });
        }
    };
}();

function findRoleList(){
	oTableInitiateRole.fnDraw();
}

function goUpdateRole(roleId){
	$.ajax({
		  url: basePath+"rest/boom/role/detail?timestamp="+Date.parse(new Date()),
		  data: {"roleId":roleId},
		  success: function(resultData){
			  $("#update_role_id").val(resultData.id);
			  $("#update_role_name").val(resultData.name);
			  $("#update_role_enname").val(resultData.enname);
			  $("#update_role_remark").val(resultData.remark);
			  $("#update_role_create_user").val(resultData.createUser);
			  $("#update_role_create_date").val(resultData.createDateStr);
			  
		  },
		  dataType: "json"
		});
	$('#roleUpdateDiv').modal();
}

function updateRole(){
	var formData=JSON.stringify($('#updateRoleForm').serializeObject());
	$.ajax({
		type:"post",
		url:basePath+"rest/boom/role/update",
		data:formData,
		contentType:"application/json; charset=utf-8",
        dataType:"json",
        success:function(resultData){
        	alert(resultData.msg);
        	if(resultData.result){
        		cleanUpdateForm();
            	$('#roleUpdateDiv').modal('hide');
            	oTableInitiateRole.fnDraw();
        	}
		}
	});
}

function detailRole(id){
	$.ajax({
		  url: basePath+"rest/boom/role/detail?timestamp="+Date.parse(new Date()),
		  data: {"roleId":id},
		  success: function(resultData){
			  $("#detail_role_name").val(resultData.name);
			  $("#detail_role_enname").val(resultData.enname);
			  $("#detail_role_remark").val(resultData.remark);
			  $("#detail_role_create_user").val(resultData.createUser);
			  $("#detail_role_create_date").val(resultData.createDateStr);
			  $("#detail_role_update_user").val(resultData.updateUser);
			  $("#detail_role_update_date").val(resultData.updateDateStr);
		  },
		  dataType: "json"
		});
	$('#roleDetailDiv').modal();
}

function deleteRole(id){
	$.ajax({
		  url: basePath+"rest/boom/role/delete",
		  data: {"roleId":id},
		  success: function(resultData){
			  alert(resultData.msg);
	          if(resultData.result){
	              oTableInitiateRole.fnDraw();
	          }
		  },
		  dataType: "json"
	});
}

function cleanAddForm(){
	$('#add_role_name').val('');
	$('#add_role_enname').val('');
	$('#add_role_remark').val('');
}

function cleanUpdateForm(){
	$("#update_role_id").val('');
	  $("#update_role_name").val('');
	  $("#update_role_enname").val('');
	  $("#update_role_remark").val('');
}

function closeDetailDiv(){
	$("#roleName").text('');
	$("#roleEnName").text('');
	$("#roleRemark").text('');
}



