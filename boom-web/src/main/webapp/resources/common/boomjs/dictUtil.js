var local = window.location;  
var contextPath = local.pathname.split("/")[1];  
var basePath = local.protocol+"//"+local.host+"/"+contextPath+"/"; 


/**
 * @param displaydivId div的id值
 * @param dictType 字典表中类别：如性别、状态等
 * @param viewType 要显示的类型：如select,radio等
 * @param viewName 要显示的select或radio中id和name的值
 * @param viewValue 默认显示的值
 * @returns {String}
 */
function getDictionaryListByType(displaydivId,dictType,viewType,viewName,viewValue) {
	$.ajax({url:basePath+"rest/boom/dictionary/typelist",data:{"viewName":viewName,"viewType":viewType,"dictType":dictType,"viewValue":viewValue},dataType: "json",async:false,success:function(resultData){
    	$("#"+displaydivId).html(resultData.msg);
	}});
    
}


