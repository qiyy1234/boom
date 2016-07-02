<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <meta charset="utf-8" />
    <title>机构管理页面</title>

    <meta name="description" content="data tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<!-- /Head -->
<!-- Body -->
<body>
<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container" id="tablecontainer">
        <!-- Page Body -->
        <div class="page-body">
            <div class="row">
                <!--组织机构树-->
                <div class="col-lg-3 col-sm-3 col-xs-12">
                    <div class="widget">
                        <div class="widget-header bg-blue">
                            <span class="widget-caption">组织机构</span>
                            <div class="widget-buttons">
                                <a href="#" data-toggle="maximize">
                                    <i class="fa fa-expand"></i>
                                </a>
                                <a href="#" data-toggle="collapse">
                                    <i class="fa fa-minus"></i>
                                </a>
                            </div><!--Widget Buttons-->
                        </div><!--Widget Header-->
                        <div class="widget-body">
                            <ul id="treeDemo" class="ztree"></ul>
                        </div><!--Widget Body-->
                    </div><!--Widget-->
                </div>
                <!--用户列表-->
                <div class="col-lg-9 col-sm-9 col-xs-12">
                    <div class="widget">
                        <div class="widget-header bg-blue">
                            <span class="widget-caption">机构列表</span>
                            <div class="widget-buttons">
                                <a href="#" data-toggle="maximize">
                                    <i class="fa fa-expand"></i>
                                </a>
                                <a href="#" data-toggle="collapse">
                                    <i class="fa fa-minus"></i>
                                </a>
                                <a href="#" data-toggle="dispose">
                                    <i class="fa fa-times"></i>
                                </a>
                            </div><!--Widget Buttons-->
                        </div><!--Widget Header-->
                        <div class="widget-body">
                            <table width="100%">
                                <tr>
                                    <td>姓名：<input >   登录名：<input ></td>
                                    <td align="right">
                                        <a href="#" class="btn btn-blue btn-sm" onclick="">查询</a>&nbsp;
                                        <a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="">添加</a>
                                    </td>
                                </tr>

                            </table>
                            <br>
                            <table class="table table-striped table-bordered table-hover" id="orgtreeTable">
                                <thead>
                                <tr>
                                    <th width="10%">机构名称</th>
                                    <th width="10%">归属区域</th>
                                    <th width="15%">机构编码</th>
                                    <th width="15%">机构类型</th>
                                    <th width="15%">备注</th>
                                    <th width="30%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr id="1" pid="0" class="0" haschild="true" previd="" depth="1">
                                    <td nowrap=""><span class="prev_sp"></span>
                                        <a href="/jeesite/a/sys/menu/form?id=27">总公司</a>
                                    </td>
                                    <td title="">区域一</td>
                                    <td>1000</td>
                                    <td title="">公司</td>
                                    <td title=""></td>
                                    <td nowrap="">
                                        <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                        <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                        <a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#addChildOrg" onclick=""><i class="fa fa-plus-square"></i>添加下级机构</a></td>
                                    </td>
                                </tr>

                                <tr id="3" pid="1" class="27" isfirstone="true" depth="2">
                                    <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=28">市场部</a></td>
                                    <td title="">区域一</td>
                                    <td>10001001</td>
                                    <td title="">部门</td>
                                    <td title=""></td>
                                    <td nowrap="">
                                        <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                        <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                        <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级机构</a></td>
                                    </td>
                                </tr>

                                <tr id="4" pid="1" class="27" isfirstone="true" depth="2">
                                    <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=28">财务部</a></td>
                                    <td title="">区域二</td>
                                    <td>10001002</td>
                                    <td title="">部门</td>
                                    <td title=""></td>
                                    <td nowrap="">
                                        <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                        <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                        <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级机构</a></td>
                                    </td>
                                </tr>
                                <tr id="2" pid="1" class="27" isfirstone="true" depth="2">
                                    <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=28">技术部</a></td>
                                    <td title=""></td>
                                    <td title="">部门</td>
                                    <td title=""></td>
                                    <td title=""></td>
                                    <td nowrap="">
                                        <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                        <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                        <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级机构</a></td>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!--Widget Body-->
                    </div><!--Widget-->
                </div>
            </div>
        </div>
        <!-- /Page Body -->
    </div>
    <!-- /Page Container -->
    <!-- Main Container -->
</div>

<!--LArge Modal Templates-->
<div id="addChildOrg" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">机构信息</span>
                <div class="widget-buttons">
                    <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                </div>
            </div>
            <div class="modal-body">
                <div id="registration-form">
                    <form class="form-horizontal" role="form">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="loginName" class="col-sm-3 control-label no-padding-right">上级机构：</label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="parentOrg" placeholder="">
                                            <span class="input-group-btn">
                                                <a href="#" class="btn btn-default shiny" data-toggle="modal" data-target="#orgTreeDiv" onclick="">GO</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="userName" class="col-sm-3 control-label no-padding-right">归属区域：</label>
                                    <div class="col-sm-9">
                                    <input type="email" class="form-control" id="userName" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="password" class="col-sm-3 control-label no-padding-right">机构名称：</label>
                                    <div class="col-sm-9">
                                    <input type="email" class="form-control" id="password" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="passwordconfirm" class="col-sm-3 control-label no-padding-right">机构编码：</label>
                                    <div class="col-sm-9">
                                    <input type="email" class="form-control" id="passwordconfirm" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">机构类型：</label>
                                    <div class="col-sm-9">
                                    <input type="email" class="form-control" id="telephone" placeholder="11位数字">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email" class="col-sm-3 control-label no-padding-right">机构级别：</label>
                                    <div class="col-sm-9">
                                    <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">是否可用：</label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input name="" type="radio" class="colored-blue" value="1" checked="checked">
                                                        <span class="text">可用</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input name="" type="radio" class="colored-blue" value="2">
                                                        <span class="text">不可用</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">主负责人：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">副负责人：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">联系地址：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">邮政编码：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">负责人：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">电话：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">传真：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">邮箱：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">备注：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="email" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table">
                            <tr>
                                <td align="right">
                                    <a href="javascript:void(0);" class="btn btn-blue">保存</a>
                                    <a href="javascript:void(0);" class="btn btn-blue">关闭</a>
                                </td>
                            </tr>
                        </table>


                    </form>
                </div>



            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--机构树-->
<div id="orgTreeDiv" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">机构选择</span>
                <div class="widget-buttons">
                    <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                </div>
            </div>
            <div class="modal-body">
                <ul id="orgTree" class="ztree"></ul>

                <table class="table">
                    <tr>
                        <td align="right">
                            <a href="javascript:void(0);" class="btn btn-blue" data-dismiss="modal">确定</a>
                            <a href="javascript:void(0);" class="btn btn-blue" data-dismiss="modal">关闭</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>


<!--Beyond Scripts-->
<script src="assets/js/beyond.js"></script>
<script src="public/boomjs/organization.js"></script>

<script>
    var zTreeObj;
    //var orgTreezTreeObj;
    var setting = {
        onClick: zTreeOnClick
    };

    var zNodes = [
        {name:"黑龙江省总公司", open:true, children:[
            {name:"研发部"}, {name:"市场部"},{name:"技术部"},{name:"综合部"},{name:"哈尔滨市分公司",open:false,children:[{name:"研发部"},{name:"技术部"}]}]}
    ];
    $(function(){
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        //orgTreezTreeObj = $.fn.zTree.init($("#orgTree"), setting, zNodes);
    });

    function zTreeOnClick(event, treeId, treeNode) {
        alert("aaa");
    };

</script>
</body>
<!--  /Body -->

</html>
