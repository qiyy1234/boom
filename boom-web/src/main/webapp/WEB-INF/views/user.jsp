<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <meta charset="utf-8" />
    <title>用户管理页面</title>

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
                            <span class="widget-caption">用户列表</span>
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
                            <table class="table table-striped table-bordered table-hover" id="userdatatable">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th width="10%">姓名</th>
                                    <th width="10%">性别</th>
                                    <th width="15%">出生年月</th>
                                    <th width="15%">登录名</th>
                                    <th width="15%">电话</th>
                                    <th width="15%">所属部门</th>
                                    <th width="30%">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td></td>
                                        <td>孙俪</td>
                                        <td>女</td>
                                        <td>1990-07-03</td>
                                        <td>sunli</td>
                                        <td>13100000000</td>
                                        <td>人力资源</td>
                                        <td>
                                            <a href="#" class="btn btn-blue btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                            <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>李宇春</td>
                                        <td>女</td>
                                        <td>1990-07-03</td>
                                        <td>liyuchun</td>
                                        <td>13100000000</td>
                                        <td>人力资源</td>
                                        <td>
                                            <a href="#" class="btn btn-blue btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                            <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>李晨</td>
                                        <td>女</td>
                                        <td>1990-07-03</td>
                                        <td>lichen</td>
                                        <td>13100000000</td>
                                        <td>人力资源</td>
                                        <td>
                                            <a href="#" class="btn btn-blue btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                            <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>范冰冰</td>
                                        <td>女</td>
                                        <td>1990-07-03</td>
                                        <td>fanbingbing</td>
                                        <td>13100000000</td>
                                        <td>人力资源</td>
                                        <td>
                                            <a href="#" class="btn btn-blue btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                            <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>赵丽颖</td>
                                        <td>女</td>
                                        <td>1990-07-03</td>
                                        <td>zhaoliying</td>
                                        <td>13100000000</td>
                                        <td>人力资源</td>
                                        <td>
                                            <a href="#" class="btn btn-blue btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                            <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>张三</td>
                                        <td>女</td>
                                        <td>1990-07-03</td>
                                        <td>zhangsan</td>
                                        <td>13100000000</td>
                                        <td>人力资源</td>
                                        <td>
                                            <a href="#" class="btn btn-blue btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                            <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>
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
<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">用户信息</span>
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
                                    <label for="loginName" class="col-sm-3 control-label no-padding-right">登录名：</label>
                                    <div class="col-sm-9">
                                        <span class="input-icon icon-right">
                                        <input type="email" class="form-control" id="loginName" placeholder="只能为英文">
                                        <i class="fa fa-user"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="userName" class="col-sm-3 control-label no-padding-right">姓名：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <input type="email" class="form-control" id="userName" placeholder="必填">
                                    <i class="fa fa-user"></i>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="password" class="col-sm-3 control-label no-padding-right">密码：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <input type="email" class="form-control" id="password" placeholder="6位数字">
                                    <i class="fa fa-lock circular"></i>
                                    </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="passwordconfirm" class="col-sm-3 control-label no-padding-right">确认密码：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <input type="email" class="form-control" id="passwordconfirm" placeholder="6位数字">
                                    <i class="fa fa-lock circular"></i>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">手机：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <input type="email" class="form-control" id="telephone" placeholder="11位数字">
                                    <i class="glyphicon glyphicon-earphone"></i>
                                    </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="email" class="col-sm-3 control-label no-padding-right">邮箱：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <input type="email" class="form-control" id="email" placeholder="xxxxxx@xxx.com">
                                    <i class="fa fa-envelope-o circular"></i>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">是否允许登录：</label>
                                    <div class="col-sm-9">
                                        <label>
                                            <input class="checkbox-slider toggle colored-blue" type="checkbox">
                                            <span class="text"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">用户角色：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <select class="form-control">
                                        <option>--请选择--</option>
                                        <option>普通用户</option>
                                        <option>管理员</option>
                                    </select>
                                    </span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">头像：</label>
                                    <div class="col-sm-9">
                                        <span class="input-icon icon-right">
                                            <img width="120px" height="160px" src="assets/img/avatars/sunli.jpg"/>
                                            <hr class="wide" />
                                            <input type="file">
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="role" class="col-sm-3 control-label no-padding-right">备注：</label>
                                    <div class="col-sm-9">
                                    <span class="input-icon icon-right">
                                    <textarea class="form-control" rows="10"></textarea>
                                    <i class="glyphicon glyphicon-briefcase"></i>
                                    </span>
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


<!--Beyond Scripts-->
<script src="assets/js/beyond.js"></script>
<script src="public/boomjs/user.js"></script>

<script>
    var zTreeObj;
    var setting = {

    };
    var zNodes = [
        {name:"黑龙江省总公司", open:true, children:[
            {name:"研发部"}, {name:"市场部"},{name:"技术部"},{name:"综合部"},{name:"哈尔滨市分公司",open:false,children:[{name:"研发部"},{name:"技术部"}]}]}
    ];
    $(function(){
        zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

</script>
</body>
<!--  /Body -->

</html>
