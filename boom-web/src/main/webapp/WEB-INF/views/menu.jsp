<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
  <head>
    <meta charset="utf-8" />
    <title>boom</title>
    
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

    <!--treeTable用到是css-->
	<link href="<%=basePath %>resources/assets/js/treeTable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="<%=basePath %>resources/assets/js/skins.min.js"></script>
	

  </head>
  
  <body>
    <!-- Main Container -->
	<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container" id="tablecontainer">
        <!-- Page Body -->
        <div class="page-body">
            <div class="row">
                <div class="col-xs-12 col-md-12">
                    <div class="widget">
                        <div class="widget-header bg-blue">
                            <span class="widget-caption">菜单列表</span>
                            <div class="widget-buttons">

                            </div>
                        </div>
                        <div class="widget-body">
                            <table width="100%">
                                <tr>
                                    <td>名称：<input></td>
                                    <td align="right">
                                        <a href="#" class="btn btn-blue btn-sm" onclick="">查询</a>&nbsp;
                                        <a href="#" class="btn btn-blue btn-sm" onclick="">添加</a>
                                    </td>
                                </tr>

                            </table>
                            <br>
                            <table id="menutreeTable" class=" treetable table table-striped table-bordered table-condensed">
                            <thead><tr><th width="10%">名称</th><th width="15%">链接</th><th width="10%" style="text-align:center;">排序</th><th width="10%">可见</th><th width="10%">权限标识</th><th width="20%">操作</th></tr></thead>
                            <tbody id="menuTableBody">
        
                           		
                            </tbody>
                            </table>
                            
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Page Body -->
    </div>
    <!-- /Page Container -->
    <!-- Main Container -->
</div>

<!--添加下级菜单-->
<div id="addChildMenu" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">菜单添加</span>
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
                                    <label for="" class="col-sm-3 control-label no-padding-right">上级菜单：</label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="parentMenu" placeholder="功能菜单">
                                            <span class="input-group-btn">
                                                <a href="#" class="btn btn-default shiny" data-toggle="modal" data-target="#menuTreeDiv" onclick="">GO</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="password" class="col-sm-3 control-label no-padding-right">名称：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="menuName" placeholder="">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">链接：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="telephone" placeholder="点击链接跳转页面">
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">目标：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="" placeholder="默认：mainFrame">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">图标：</label>
                                    <div class="col-sm-9">
                                        <!--<img width="120px" height="160px" src="assets/img/avatars/sunli.jpg"/>-->
                                        <input type="file">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="num" class="col-sm-3 control-label no-padding-right">顺序：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="num" placeholder="排列顺序，数字">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">可见：</label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input name="" type="radio" class="colored-blue" value="1" checked="checked">
                                                        <span class="text">可见</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input name="" type="radio" class="colored-blue" value="2">
                                                        <span class="text">隐藏</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">权限标识：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="" placeholder="如：@RequiresPermissions(权限标识)">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="remark" class="col-sm-3 control-label no-padding-right">备注：</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" rows="5"></textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="remark" class="col-sm-3 control-label no-padding-right"></label>
                                    <div class="col-sm-9">
                                    </div>
                                </div>
                            </div>

                        </div>


                        <table class="table">
                            <tr>
                                <td align="right">
                                    <a href="javascript:void(0);" class="btn btn-blue">保存</a>
                                    <a href="javascript:void(0);" class="btn btn-blue" data-dismiss="modal">关闭</a>
                                </td>
                            </tr>
                        </table>


                    </form>
                </div>



            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--菜单树-->
<div id="menuTreeDiv" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">菜单选择</span>
                <div class="widget-buttons">
                    <a data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></a>
                </div>
            </div>
            <div class="modal-body">
                <ul id="menuTree" class="ztree"></ul>

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


	<!--Basic Scripts-->
    <script src="<%=basePath %>resources/assets/js/jquery-1.11.3/jquery.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="<%=basePath %>resources/assets/js/beyond.js"></script>

    <!--Page Related Scripts-->
    <script src="<%=basePath %>resources/assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>

    <!--treeTable用到的js-->
    <script src="<%=basePath %>resources/assets/js/treeTable/jquery.treetable.js" type="text/javascript"></script>

	<script src="<%=basePath%>resources/common/boomjs/menu.js"></script>
	<script>

	
	</script>

  </body>
  
</html>
