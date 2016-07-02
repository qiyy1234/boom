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
                    "url": basePath+"boom/role/list",
                    "dataSrc": "data",
                    "data": function ( d ) {
                    	//查询条件
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
                    {"data": "officeName"},
                    {"data": "dataScope"},
                    {"data": "createBy"},
                    {"data": "createDate"},
                    {"data":"id"}
                ],
                "columnDefs": [
                    {
                        "targets": 6,
                        "render": function ( data, type, full, meta ) {
                        	//alert("id--"+full.id);
                        	var operation = '<a href="#" class="btn btn-blue btn-sm" onclick="detailRole(\''+full.id+'\')"><i class="fa fa-search-plus"></i>查看</a>&nbsp;'+
                            '<a href="#" class="btn btn-success btn-sm" onclick="updateRole();"><i class="fa fa-edit"></i>修改</a>&nbsp;'+
                            '<a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>';
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


function updateRole(){
	alert("修改role");
	$('#roleAddDiv').modal();
}

function detailRole(id){
	$.ajax({
		  url: basePath+"boom/role/detail?timestamp="+Date.parse(new Date()),
		  data: {"roleId":id},
		  success: function(resultData){
			  $("#roleName").text(resultData.name);
			  $("#roleEnName").text(resultData.enname);
			  $("#roleOfficeId").text(resultData.officeName);
			  $("#roleDataScope").text(resultData.dataScope);
		  },
		  dataType: "json"
		});
	$('#roleDetailDiv').modal();
}


function cleanForm(){
	$('#role_name').val('');
	$('#role_enname').val('');
	$('#role_office_id').val('');
	$('#role_data_scope').val('');
}

function closeDetailDiv(){
	$("#roleName").text('');
	$("#roleEnName").text('');
	$("#roleOfficeId").text('');
	$("#roleDataScope").text('');
}