<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %> 
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

    <link href="<%=basePath %>resources/assets/css/demo.min.css" rel="stylesheet" />

    <!--treeTable用到是css-->
	<link href="<%=basePath %>resources/assets/js/treeTable/css/jquery.treetable.css" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="<%=basePath %>resources/assets/js/skins.min.js"></script>
    
    <!--ztree用到的css-->
    <link href="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css" rel="stylesheet" type="text/css"/>
	

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
                                                                                    编号:${user.id} --- ${user.name}
                            </div>
                        </div>
                        <div class="widget-body">
                            <table width="100%">
                                <tr>
                                    <td>名称：<input></td>
                                    <td align="right">
                                        <a href="#" class="btn btn-blue btn-sm" onclick="">查询</a>&nbsp;
                                        <a href="#" class="btn btn-blue btn-sm" data-toggle="modal" data-target="#menuAddDiv">添加</a>
                                    </td>
                                </tr>

                            </table>
                            <br>
                            <table id="menutreeTable" class=" treetable table table-striped table-bordered table-condensed">
                            <thead><tr><th width="15%">名称</th><th width="15%">链接</th><th width="10%" style="text-align:center;">排序</th><th width="10%">状态</th><th width="10%">权限标识</th><th width="20%">操作</th></tr></thead>
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



<!--菜单添加  - 下级菜单-->
<div id="menuAddDiv" class="modal fade bs-example-modal-lg" tabindex="-1" menu="dialog" aria-labelledby="menuAddDiv" aria-hidden="true">    
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">菜单添加</span>
                <div class="widget-buttons">
                    <a data-dismiss="modal" ><i class="fa fa-times"></i></a>
                </div>
            </div>
                
            <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                
                    <form class="form-horizontal" menu="form" id="menuForm"  method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">上级菜单：</label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="menuName" name="upName" placeholder="功能菜单" />
                                            <input type="hidden" class="form-control" id="menuId" name="parentId" value="1" />
                                            <input type="hidden" class="form-control" id="menuParentIds" name="parentIds" />
                                            <span class="input-group-btn">
                                                <a href="#" class="btn btn-default shiny" data-toggle="modal" onclick="powerRoleDG();">GOgo</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="password" class="col-sm-3 control-label no-padding-right">名称：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="功能菜单名称" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">链接：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="href" name="href"  placeholder="点击左侧菜单链接跳转的页面" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">目标：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="target" name="target" placeholder="默认:mainFrame rest/*/*" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label for="telephone" class="col-sm-3 control-label no-padding-right">图标：</label>
                                    <div class="col-sm-9" id="iconss">
                                        <a href="#" class="btn btn-default shiny" data-toggle="modal" data-target="#menuIconsDiv" onclick="select();" >选择</a>
                                    </div>
                               
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="num" class="col-sm-3 control-label no-padding-right">顺序：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="sort" name="sort" placeholder="排列顺序,数字" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">状态：</label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" id="male" name="isShow" value="1" class="colored-blue" checked="checked" />
                                                        <span class="text">可见</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" id="female" name="isShow" value="0" class="colored-blue" />
                                                        <span class="text">隐藏</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">权限：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="permission" name="permission" placeholder="如:menu:Permissions(权限标识)">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="remark" class="col-sm-3 control-label no-padding-right">备注：</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" id="remarks" name="remarks" rows="5"></textarea>
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
                                    <a href="#" class="btn btn-blue"  id="menuAddBtn" class="btn btn-blue" onclick="addMenu();" >保存</a>
                                    <a href="#" class="btn btn-blue" data-dismiss="modal" aria-hidden="true"  onClick="closeAddDiv();" >关闭</a>
                                </td>
                            </tr>
                        </table>


                    </form>
                </div>

               </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--菜单修改 - 下级菜单修改-->
<div id="menuUpDiv" class="modal fade bs-example-modal-lg" tabindex="-1" menu="dialog" aria-labelledby="menuAddDiv" aria-hidden="true">    
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="widget-header bg-blue">
                <span class="widget-caption">菜单修改</span>
                <div class="widget-buttons">
                    <a data-dismiss="modal" ><i class="fa fa-times"></i></a>
                </div>
            </div>
                
            <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                
                    <form class="form-horizontal" menu="form" id="updateMenuForm"  method="post">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">上级菜单：</label>
                                    <div class="col-sm-9">
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="update_menuName" name="parent.name" placeholder="功能菜单" />
                                            <input type="hidden" class="form-control" id="update_menuId" name="pId" />
                                            <input type="hidden" class="form-control" id="update_menuParentIds" name="parent.parentIds" />
                                            <span class="input-group-btn">
                                                <a href="#" class="btn btn-default shiny" data-toggle="modal" onclick="upPowerRoleDG();">GOgo</a>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-5">
                                <div class="form-group">
                                        <input type="hidden" class="form-control" id="update_id" name="id" placeholder="功能菜单名称" />
                                        <input type="hidden" class="form-control" id="update_parentIds" name="parentIds" placeholder="功能菜单名称" />
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">名称：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="update_name" name="name" placeholder="功能菜单名称" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">链接：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="update_href" name="href"  placeholder="点击左侧菜单链接跳转的页面" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">目标：</label>
                                    <div class="col-sm-9">
                                        <input type="email" class="form-control" id="update_target" name="target" placeholder="默认:mainFrame rest/*/*" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                     <label for="telephone" class="col-sm-3 control-label no-padding-right">图标：</label>
                                    <div class="col-sm-9" id="iconsss">
                                        <a href="#" class="btn btn-default shiny" data-toggle="modal" data-target="#menuIconsDiv" onclick="selectUp();">选择</a>
                                        <span id ="showIconUp"></span>
                                    </div>
                               
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="num" class="col-sm-3 control-label no-padding-right">顺序：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="update_sort" name="sort" placeholder="排列顺序,数字" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="telephone" class="col-sm-3 control-label no-padding-right">状态：</label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" id="update_male" name="isShow" value="1" class="colored-blue" checked="checked" />
                                                        <span class="text">可见</span>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-sm-4 col-xs-4">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" id="update_female" name="isShow" value="0" class="colored-blue" />
                                                        <span class="text">隐藏</span>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group">
                                    <label for="" class="col-sm-3 control-label no-padding-right">权限：</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="update_permission" name="permission" placeholder="如:menu:Permissions(权限标识)">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="remark" class="col-sm-3 control-label no-padding-right">备注：</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" id="update_remarks" name="remarks" rows="5"></textarea>
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
                                    <a href="#" class="btn btn-blue"  id="menuUpBtn" class="btn btn-blue" onclick="upMenu();" >保存</a>
                                    <a href="#" class="btn btn-blue" data-dismiss="modal" aria-hidden="true"  onClick="closeUpDiv();" >关闭</a>
                                </td>
                            </tr>
                        </table>


                    </form>
                </div>

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
                <ul id="ztree" class="ztree"></ul>
            </div>
                <table class="table">
                    <tr>
                        <td align="right">
                            <a href="#" class="btn btn-blue" data-dismiss="modal" onclick="savePower();return false;">确定</a>
                            <a href="#" class="btn btn-blue" data-dismiss="modal" onclick="closeDetailDiv();return false;">关闭</a>
                        </td>
                    </tr>
                </table>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>

<!--icons-->

<div id="menuIconsDiv" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                    <div class="row">
                        <div class="col-xs-12 col-md-12 col-lg-12">
                            <div class="widget">
                                <div class="widget-header bordered-top bordered-lightyellow">
                                    <span class="widget-caption">Typicons</span>
                                    <div class="widget-buttons">
                                        <a href="#"  data-dismiss="modal"  aria-hidden="true">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="widget-body" style="display: block;">
                                    <div id="typicon-preview" class="clearfix">
                                        <div class="icon">
                                            <span class="typcn typcn-adjust-brightness"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-adjust-contrast"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-anchor-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-anchor"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-archive"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-back-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-back"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-down-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-down-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-down"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-forward-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-forward"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-left-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-left-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-left"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-loop-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-loop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-maximise-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-maximise"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-minimise-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-minimise"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-move-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-move"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-repeat-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-repeat"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-right-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-right-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-right"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-shuffle"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sorted-down"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sorted-up"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sync-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-sync"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-unsorted"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-up-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-up-thick"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-arrow-up"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-at"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-attachment-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-attachment"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-backspace-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-backspace"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-charge"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-full"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-high"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-low"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-battery-mid"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-beaker"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-beer"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-bell"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-book"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-bookmark"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-briefcase"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-brush"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-business-card"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-calculator"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-calender-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-calender"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-camera-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-camera"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cancel-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cancel"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-area-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-area"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-bar-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-bar"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-line-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-line"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-pie-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chart-pie"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-left-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-left"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-right-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-chevron-right"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-clipboard"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cloud-storage"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-code-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-code"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-coffee"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cog-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cog"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-compass"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-contacts"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-credit-card"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-cross"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-css3"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-database"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-delete-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-desktop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-laptop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-phone"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-device-tablet"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-directions"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-divide-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-divide"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document-add"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document-text"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-document"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-download-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-download"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-dropbox"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-edit"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eject-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eject"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-equals-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-equals"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-export-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-export"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eye-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-eye"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-feather"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-film"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-filter"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flag-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flag"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flash-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flash"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-children"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-merge"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-parallel"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-flow-switch"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder-add"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder-delete"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder-open"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-folder"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-gift"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-globe-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-globe"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-group-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-group"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-headphones"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart-full-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart-half-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-heart"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-home-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-home"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-html5"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-image-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-image"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-infinity-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-infinity"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info-large-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info-large"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-info"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-input-checked-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-input-checked"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-key-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-key"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-keyboard"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-leaf"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lightbulb"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-link-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-link"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location-arrow-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location-arrow"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-location"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-closed-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-closed"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-open-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-lock-open"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-mail"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-map"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-eject-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-eject"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-fast-forward-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-fast-forward"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-pause-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-pause"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play-reverse-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play-reverse"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-play"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-record-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-record"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-rewind-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-rewind"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-stop-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-media-stop"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-message-typing"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-message"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-messages"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-microphone-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-microphone"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-minus-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-minus"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-mortar-board"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-news"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-notes-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-notes"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pen"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pencil"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-phone-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-phone"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pi-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pi"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pin-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pin"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-pipette"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plane-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plane"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plug"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plus-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-plus"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-point-of-interest-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-point-of-interest"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-power-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-power"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-printer"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-puzzle-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-puzzle"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-radar-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-radar"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-refresh-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-refresh"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-rss-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-rss"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-scissors-outline"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-scissors"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-shopping-bag"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-shopping-cart"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-at-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-dribbble-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-dribbble"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-facebook-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-facebook"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-flickr-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-flickr"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-github-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-github"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-google-plus-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-google-plus"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-instagram-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-instagram"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-last-fm-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-last-fm"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-linkedin-circular"></span>
                                        </div>
                                        <div class="icon">
                                            <span class="typcn typcn-social-linkedin"></span>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
	
    <script src="<%=basePath %>resources/assets/js/beyond.min.js"></script>

    <script src="<%=basePath %>resources/assets/js/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js"  type="text/javascript"></script>

  </body>
  
  <script>
      /* InitiateRoleDataTable.init(); 加载 boomjs 的驱动程序  */     
      /* InitiateMenuDataTable.init();   */

     /**
      * 将from转换为json格式封装
      */
     
  //定义setTimeout执行方法
	
    function select(){
    	var oDiv = document.getElementsByClassName("icon");
        for (var i = 0; i < oDiv.length; i++) {
            (function(i) {
                oDiv[i].onclick = function() {
                	 $("#active").removeAttr("style");
                	 $("#active").removeAttr("id");
                	 $("#showIcon").remove();
                	 $("#icon").remove();
                    oDiv[i].style.background='red'; 
                    oDiv[i].id='active';
                    var aSpan = document.querySelector("#active span").className;
                    var showimg = "<span id = 'showIcon'>"+ aSpan +"</span> <input type='hidden' class='form-control' id='icon' name='icon' value='"+ aSpan +"' />";  
                    $("#iconss").append(showimg);
                    $("#showIcon").attr("class",aSpan);
                	$('#menuIconsDiv').modal('hide');
     	            };
            })(i);
       
        }
    }
    
    function selectUp(){
       	var oDiv = document.getElementsByClassName("icon");
        for (var i = 0; i < oDiv.length; i++) {
            (function(i) {
                oDiv[i].onclick = function() {
                	 $("#active").removeAttr("style");
                	 $("#active").removeAttr("id");
                	 $("#showIconUp").remove();
                	 $("#update_icon").remove();
                    oDiv[i].style.background='red'; 
                    oDiv[i].id='active';
                    var aSpan = document.querySelector("#active span").className;
                    var showimg = "<span id = 'showIconUp'>"+ aSpan +"</span> <input type='hidden' class='form-control' id='update_icon' name='icon' value='"+ aSpan +"' />";  
                    $("#iconsss").append(showimg);
                    $("#showIconUp").attr("class",aSpan);
                	$('#menuIconsDiv').modal('hide');
     	            };
            })(i);
       
        }
    }
    
	var zTree;
    var setting = {
			view: {
				dblClickExpand: false,
				showLine: true,
				selectedMulti: false
			},
			callback: {
				onDblClick: zTreeOnDblClick
			},
			data:{
				simpleData:{
					enable:true,
					idKey:"id",
					pIdKey:"pId",
					rootPId:'0'
					}
	             },
	};

    function zTreeOnDblClick(event, treeId, treeNode) {

    	var abc =  $("#update_id").val();
    	if(abc== '' || abc == null ){
   		 $("#menuId").val(treeNode.id);
		 $("#menuName").val(treeNode.name);
		 $("#menuParentIds").val(treeNode.parentIds);
    	}else{
      		 $("#update_menuId").val(treeNode.id);
    		 $("#update_menuName").val(treeNode.name);
    		 $("#update_menuParentIds").val(treeNode.parentIds);

    }
		 closeDetailDiv();
    }
    
    function powerRoleDG(){
		$.ajax({
			type:"post",
			url:basePath+"rest/boom/menu/powerMenuDG",
			data: '',
		    success:function(resultData){
			 	var zTreeNodess = JSON.stringify(resultData.zTreeNodes);
			    var zTs  = zTreeNodess.replace(/subsetPermission/gm,'nodes');  
			    var zT  = zTs.replace(/url/gm,'');  
			  	var zTreeNodes = eval(zT);
			 	 $.fn.zTree.init($("#ztree"), setting, zTreeNodes).expandAll(true);
				},
			}); 
			$('#menuTreeDiv').modal();
		}  
    
    function savePower(){
         var treeObj = $.fn.zTree.getZTreeObj("ztree");
         var nodes = treeObj.getSelectedNodes();
         var ab =JSON.stringify(nodes);
         json = eval(ab);
         var id = json[0].id;
         var name = json[0].name;
         var parentIds = json[0].parentIds;
		 $("#menuId").val(id);
		 $("#menuName").val(name);
		 $("#menuParentIds").val(parentIds);
    }
    
    
    function closeAddDiv(){
    	 $("#menuId").val('');
		 $("#menuName").val('');
		 $("#menuParentIds").val('');
    	 $("#active").removeAttr("style");
    	 $("#active").removeAttr("id");
    	 $("#showIcon").remove();
    	 $("#icon").remove();
		 
    }
    function closeUpDiv(){
   	     $("#menuId").val('');
	     $("#menuName").val('');
	     $("#menuParentIds").val('');
      	 $("#active").removeAttr("style");
    	 $("#active").removeAttr("id");
    	 $("#showIconUp").remove();
    	 $("#update_icon").remove();
		 
   }
    
/*     function addMenu(id,name){ */
    function addMenu(){
	  var formData=JSON.stringify($('#menuForm').serializeObject());
	  $.ajax({
		  	type:"post",
			     url:basePath+"rest/boom/menu/saveMenu",
				 data:formData,
				 contentType:"application/json; charset=utf-8",
				 dataType:"json",
           success:function(resultData){
    	   alert(resultData.msg);
    	   if(resultData.result){
    		cleanAddForm();
        	$('#menuAddDiv').modal('hide');
        	window.location.reload();
        	
    	}
	}
});
    	
    }
    
    function upMenu(){
  	  var formData=JSON.stringify($('#updateMenuForm').serializeObject());
	  $.ajax({
		  	type:"post",
			     url:basePath+"rest/boom/menu/updateMenu",
				 data:formData,
				 contentType:"application/json; charset=utf-8",
				 dataType:"json",
           success:function(resultData){
    	   alert(resultData.msg);
    	   if(resultData.result){
    		cleanAddForm();
        	$('#menuUpDiv').modal('hide');
        	window.location.reload();
        	
    	}
	}
});	
    	
    	
    }
    
    
    function cleanAddForm(){
    	$('#menuForm')[0].reset(); 
    }
    
    function cleanUpForm(){
    	$('#updateMenuForm')[0].reset(); 
    }
    
    
    
    function closeDetailDiv(){
     	$('#menuTreeDiv').modal('hide');
    }
    
    
    
    $(function(){
   	 $.fn.serializeObject = function() {  
   		    var o = {};  
   		    var a = this.serializeArray();  
   		    $.each(a, function() {  
   		        if (o[this.name]) {  
   		            if (!o[this.name].push) {  
   		                o[this.name] = [ o[this.name] ];  
   		            }  
   		            o[this.name].push(this.value || '');  
   		        } else {  
   		            o[this.name] = this.value || '';  
   		        }  
   		    });  
   		    return o;  
   		}; 
   		
    });
    
    function isShow(){
    	  if(document.getElementById("male").checked)  
    	    {  
    	        $("#male").val("1");
    	    } 
    	
    }
    	
    function show(){
  	  if(document.getElementById("famale").checked)  
  	    {  
	        $("#male").val("0");
  	    } 
  	
  }
    
    function addNextMenu(id,name,parentIds){
 	  $("#menuId").val(id);
	  $("#menuName").val(name);
	  $("#menuParentIds").val(parentIds);
      $('#menuAddDiv').modal();
    }
    
    function updateMenu(id){
    	$('#updateMenuForm')[0].reset(); 
		$("#showIconUp").empty();
    		$.ajax({
    			  url: basePath+"rest/boom/menu/detail?timestamp="+Date.parse(new Date()),
    			  data: {"id":id},
    			  success: function(resultData){
    				  var parent = resultData.parent;
    				  if(parent== '' || parent== null){
    	 				  $("#update_id").val(resultData.id);
        				  $("#update_name").val(resultData.name);
          				  $("#update_parentIds").val(resultData.parentIds);
        				  $("#update_href").val(resultData.href);
        				  $("#showIconUp").attr("class",resultData.icon);
        				  $("#update_target").val(resultData.target);
        				  $("#update_sort").val(resultData.sort);
        				  $("#update_male").val(resultData.isShow);
        				  $("#update_permission").val(resultData.permission);
        				  $("#update_remarks").val(resultData.remarks); 
    				    }
    				  $("#update_menuId").val(resultData.parent.id);
    				  $("#update_menuName").val(resultData.parent.name);
    				  $("#update_menuParentIds").val(resultData.parent.parentIds);
    				  $("#update_id").val(resultData.id);
    				  $("#update_name").val(resultData.name);
      				  $("#update_parentIds").val(resultData.parentIds);
    				  $("#update_href").val(resultData.href);
    				  $("#showIconUp").attr("class",resultData.icon);
    				  $("#update_target").val(resultData.target);
    				  $("#update_sort").val(resultData.sort);
    				  $("#update_male").val(resultData.isShow);
    				  $("#update_permission").val(resultData.permission);
    				  $("#update_remarks").val(resultData.remarks); 
    
    			  },
    			  dataType: "json"
    			});
    		cleanUpForm();
    		$('#menuUpDiv').modal();
    	}
    
    function upPowerRoleDG(){
    	var extId =  $("#update_id").val();
    	$.ajax({
			type:"post",
			url:basePath+"rest/boom/menu/upPowerMenuDG",
			data: {"extId":extId},
		    success:function(resultData){
		     	var zTreeNodess = JSON.stringify(resultData);
			    var zTs  = zTreeNodess.replace(/subsetPermission/gm,'nodes');  
			    var zT  = zTs.replace(/url/gm,'');  
			  	var zTreeNodes = eval(zT);
			 	 $.fn.zTree.init($("#ztree"), setting, zTreeNodes).expandAll(true);
				},
			}); 
			$('#menuTreeDiv').modal();
    	
    }
    
    function deleteMenu(id){
    		$.ajax({
    			  url: basePath+"rest/boom/menu/delete",
    			  data: {"menuId":id},
    			  success: function(resultData){
    				  alert(resultData.msg);
    		          if(resultData.result){
    		              oTableInitiateRole.fnDraw();
    		          }
    			  },
    			  dataType: "json"
    		});
        	window.location.reload();
    }
    
    
  </script>
  
  
</html>
