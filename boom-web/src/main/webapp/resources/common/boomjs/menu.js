var local = window.location;  
var contextPath = local.pathname.split("/")[1];  
var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/"; 

$(function(){
	findMenuList();
});

function findMenuList(){
    var selectType = $("input[name='selectType']:checked").val();
    var startTime = $("#startTime").val();
    var endTime = $("#endTime").val();
    var resourceGroupId = $("#org_id").val();
    $.ajax({
        url: basePath+"rest/boom/menu/list?timestamp="+new Date(),
        data: {},
        success: function(data){
        	
        	var result=data.data;
        	var d_html = "";
        	for(var i=0;i<result.length;i++){
        		var d=result[i];
        		d_html = d_html + "<tr data-tt-id='"+d.id+"' data-tt-parent-id='"+d.parent.id+"'>";
        		d_html = d_html + "<td>"+d.name+"</td>";
        		d_html = d_html + "<td>"+d.href+"</td>";
        		d_html = d_html + "<td>"+d.sort+"</td>";
        		d_html = d_html + "<td>"+d.isShow+"</td>";
        		d_html = d_html + "<td>"+d.href+"</td>";
        		d_html = d_html + "<td><a href='#' class='btn btn-blue btn-sm' onclick='detailMenu(\'"+d.id+"\')'><i class='fa fa-search-plus'></i>查看</a>&nbsp;"+
        		"<a href='#' class='btn btn-success btn-sm' onclick='goUpdateMenu(\'"+d.id+"\');'><i class='fa fa-edit'></i>修改</a>&nbsp;"+
        		"<a href='#' class='btn btn-danger btn-sm' onclick='deleteMenu(\'"+d.id+"\')'><i class='fa fa-trash-o'></i>删除</a>"
        		+"</td>";
        		d_html = d_html + "</tr>";
        		
        	}
        	//alert("d_html--"+d_html);
        	$("#menuTableBody").append(d_html);
        	$("#menutreeTable").treetable({ expandable: true });
        	
        },
        dataType: "json"
    });
}





