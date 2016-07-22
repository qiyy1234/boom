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
        url: basePath+"boom/menu/list?timestamp="+new Date(),
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
        		d_html = d_html + "<td>操作</td>";
        		d_html = d_html + "</tr>";
        		
        	}
        	//alert("d_html--"+d_html);
        	$("#menuTableBody").append(d_html);
        	$("#menutreeTable").treetable({ expandable: true });
        	
        },
        dataType: "json"
    });
}





