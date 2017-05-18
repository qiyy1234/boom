var zTree = null;
var setting = {
		view: {
			dblClickExpand: false,
			showLine: true,
			selectedMulti: false
		},
		data:{
			simpleData:{
				enable:true,
				idKey:"id",
				pIdKey:"parentId",
				rootPId:'0'
				}
             }
};


function seleteParentTree(treeId,ahrefId,parentId,orgNameId){
	
	var treeObj = $.fn.zTree.getZTreeObj(treeId);
    var nodes = treeObj.getSelectedNodes();
    var ab =JSON.stringify(nodes);
    json = eval(ab);
    var id = json[0].id;
    var name = json[0].name;
	 $("#"+parentId).val(id);
	 $("#"+orgNameId).val(name);
	 $("#"+ahrefId).click();
}

function clearZtree(aid,valueid,ahrefId){
    $("#"+aid).val("");
    $("#"+valueid).val("");
    $("#"+ahrefId).click();
}

function getAllOrgList(treeId){
	$.ajax({
		type:"post",
		url:basePath+"rest/boom/organization/allList",
	    success:function(resultData){
		 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
		  	var zTreeNodes = eval(zTreeNodess);
			$.fn.zTree.init($("#"+treeId), setting, zTreeNodes).expandAll(true);
			zTree = $.fn.zTree.getZTreeObj(treeId);
			},
		}); 
	} 