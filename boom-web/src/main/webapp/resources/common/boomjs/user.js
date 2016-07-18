var local = window.location;  
var contextPath = local.pathname.split("/")[1];  
var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/"; 

var oTableInitiateUser = null;
var InitiateUserDataTable = function () {
    return {
        init: function () {
            //Datatable Initiating
        	oTableInitiateUser = $('#userdatatable').dataTable({
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
                    "url": basePath+"boom/user/list?timestamp="+new Date(),
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
                    {"data": "id"},
                    {"data": "loginName"},
                    {"data": "name"},
                    {"data": "sex"},
                    {"data": "mobile"},
                    {"data": "birthday"},
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
                        	var operation = '<a href="#" class="btn btn-blue btn-sm" onclick="detailRole(\''+full.id+'\')"><i class="fa fa-search-plus"></i>查看</a>&nbsp;'+
                            '<a href="#" class="btn btn-success btn-sm" onclick="goUpdateRole(\''+full.id+'\');"><i class="fa fa-edit"></i>修改</a>&nbsp;'+
                            '<a href="#" class="btn btn-danger btn-sm" onclick="deleteRole(\''+full.id+'\')"><i class="fa fa-trash-o"></i>删除</a>';
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

$('#userdatatable').on('click', ' tbody td .row-details', function () {
    var nTr = $(this).parents('tr')[0];
    if (oTableInitiateUser.fnIsOpen(nTr)) {
        /* This row is already open - close it */
        $(this).addClass("fa-plus-square-o").removeClass("fa-minus-square-o");
        oTable.fnClose(nTr);
    }
    else {
        /* Open this row */
        $(this).addClass("fa-minus-square-o").removeClass("fa-plus-square-o");;
        oTableInitiateUser.fnOpen(nTr, fnFormatDetails(oTableInitiateUser, nTr), 'details');
    }
});

function fnFormatDetails(oTable, nTr) {
    var aData = oTable.fnGetData(nTr);
    var sOut = '<table>';
    sOut += '<tr><td rowspan="5" style="padding:0 10px 0 0;"><img width="120px" height="160px" src="'+basePath+'resources/fileupload/' + aData.photoName + '"/></td><td>登录名:</td><td>' + aData.loginName + '</td><td>姓名:</td><td>' + aData.name + '</td></tr>';
    sOut += '<tr><td>性别:</td><td>' + aData.sex + '</td><td>出生日期:</td><td>'+ aData.birthday +'</td></tr>';
    sOut += '<tr><td>邮箱:</td><td>'+ aData.email +'</td><td>状态:</td><td>'+ aData.state +'</td></tr>';
    sOut += '<tr><td>手机:</td><td>'+ aData.mobile +'</td><td>备注:</td><td>'+ aData.remark +'</td></tr>';
    sOut += '<tr><td>登录ip:</td><td>'+ aData.loginIp +'</td><td>最近登录时间:</td><td>'+ aData.lastDate +'</td></tr>';
    sOut += '</table>';
    return sOut;
}


