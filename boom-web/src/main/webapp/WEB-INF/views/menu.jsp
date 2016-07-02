<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜单管理页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<!--Basic Styles-->
    <link href="<%=request.getContextPath()%>/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resources/assets/css/font-awesome.min.css" rel="stylesheet" />

    <!--Beyond styles-->
    <link id="beyond-link" href="<%=request.getContextPath()%>/resources/assets/css/beyond.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/resources/assets/css/typicons.min.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resources/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="#" rel="stylesheet" type="text/css" />

    <link href="<%=request.getContextPath()%>/resources/assets/css/dataTables.bootstrap.css" rel="stylesheet" />

    <!--ztree用到的css-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/assets/css/zTreeStyle/zTreeStyle.css" type="text/css">

    <!--treeTable用到是js-->
    <link href="<%=request.getContextPath()%>/resources/assets/js/treeTable/themes/vsStyle/treeTable.min.css" rel="stylesheet" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="<%=request.getContextPath()%>/resources/assets/js/skins.min.js"></script>
	

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
                            <table id="menutreeTable" class="table table-striped table-bordered table-condensed">
                            <thead><tr><th>名称</th><th>链接</th><th style="text-align:center;">排序</th><th>可见</th><th>权限标识</th><th>操作</th></tr></thead>
                            <tbody>
                            <tr id="27" pid="0" class="0" haschild="true" previd="" depth="1">
                                <td nowrap=""><span class="prev_sp"></span>
                                    <a href="/jeesite/a/sys/menu/form?id=27">我的面板</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">
                                    <input type="hidden" name="ids" value="27">
                                    <input name="sorts" type="text" value="100" style="width:50px;margin:0;padding:0;text-align:center;">
                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#addChildMenu" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="28" pid="27" class="27" haschild="true" isfirstone="true" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=28">个人信息</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="28">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="29" pid="28" class="28" isfirstone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=29">个人信息</a></td>
                                <td title="/sys/user/info">/sys/user/info</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="29">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="30" pid="28" class="28" previd="29" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=30">修改密码</a></td>
                                <td title="/sys/user/modifyPwd">/sys/user/modifyPwd</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="30">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="71" pid="27" class="27" haschild="true" previd="28" islastone="true" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=71">文件管理</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="71">
                                    <input name="sorts" type="text" value="90" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="56" pid="71" class="71" haschild="true" isfirstone="true" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=56">文件管理</a></td>
                                <td title="/../static/ckfinder/ckfinder.html">/../static/ckfinder/ckfinde...</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="56">
                                    <input name="sorts" type="text" value="90" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="57" pid="56" class="56" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=57">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="57">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:ckfinder:view">cms:ckfinder:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="58" pid="56" class="56" previd="57" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=58">上传</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="58">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:ckfinder:upload">cms:ckfinder:upload</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="59" pid="56" class="56" previd="58" islastone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=59">修改</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="59">
                                    <input name="sorts" type="text" value="50" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:ckfinder:edit">cms:ckfinder:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="62" pid="0" class="0" haschild="true" previd="27" depth="1">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=62">在线办公</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="62">
                                    <input name="sorts" type="text" value="200" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="88" pid="62" class="62" haschild="true" isfirstone="true" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=88">通知通告</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="88">
                                    <input name="sorts" type="text" value="20" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="89" pid="88" class="88" isfirstone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=89">我的通告</a></td>
                                <td title="/oa/oaNotify/self">/oa/oaNotify/self</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="89">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="90" pid="88" class="88" previd="89" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=90">通告管理</a></td>
                                <td title="/oa/oaNotify">/oa/oaNotify</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="90">
                                    <input name="sorts" type="text" value="50" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title="oa:oaNotify:view,oa:oaNotify:edit">oa:oaNotify:view,oa:oaNotif...</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="63" pid="62" class="62" haschild="true" previd="88" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=63">个人办公</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="63">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="73" pid="63" class="63" isfirstone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=73">我的任务</a></td>
                                <td title="/act/task/todo/">/act/task/todo/</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="73">
                                    <input name="sorts" type="text" value="50" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="74" pid="63" class="63" previd="73" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=74">审批测试</a></td>
                                <td title="/oa/testAudit">/oa/testAudit</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="74">
                                    <input name="sorts" type="text" value="100" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title="oa:testAudit:view,oa:testAudit:edit">oa:testAudit:view,oa:testAu...</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="64" pid="63" class="63" haschild="true" previd="74" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=64">请假办理</a></td>
                                <td title="/oa/leave">/oa/leave</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="64">
                                    <input name="sorts" type="text" value="300" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="65" pid="64" class="64" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=65">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="65">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="oa:leave:view">oa:leave:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="66" pid="64" class="64" previd="65" islastone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=66">修改</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="66">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="oa:leave:edit">oa:leave:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="69" pid="62" class="62" haschild="true" previd="63" islastone="true" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=69">流程管理</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="69">
                                    <input name="sorts" type="text" value="300" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="70" pid="69" class="69" isfirstone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=70">流程管理</a></td>
                                <td title="/act/process">/act/process</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="70">
                                    <input name="sorts" type="text" value="50" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title="act:process:edit">act:process:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="72" pid="69" class="69" previd="70" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=72">模型管理</a></td>
                                <td title="/act/model">/act/model</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="72">
                                    <input name="sorts" type="text" value="100" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title="act:model:edit">act:model:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="31" pid="0" class="0" haschild="true" previd="62" depth="1">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=31">内容管理</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="31">
                                    <input name="sorts" type="text" value="500" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="40" pid="31" class="31" haschild="true" isfirstone="true" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=40">内容管理</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="40">
                                    <input name="sorts" type="text" value="500" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title="cms:view">cms:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="41" pid="40" class="40" haschild="true" isfirstone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=41">内容发布</a></td>
                                <td title="/cms/">/cms/</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="41">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="42" pid="41" class="41" haschild="true" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=42">文章模型</a></td>
                                <td title="/cms/article/">/cms/article/</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="42">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="43" pid="42" class="42" isfirstone="true" depth="5" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=43">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="43">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:article:view">cms:article:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="44" pid="42" class="42" previd="43" depth="5" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=44">修改</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="44">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:article:edit">cms:article:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="45" pid="42" class="42" previd="44" islastone="true" depth="5" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=45">审核</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="45">
                                    <input name="sorts" type="text" value="50" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:article:audit">cms:article:audit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="46" pid="41" class="41" haschild="true" previd="42" islastone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=46">链接模型</a></td>
                                <td title="/cms/link/">/cms/link/</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="46">
                                    <input name="sorts" type="text" value="60" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="47" pid="46" class="46" isfirstone="true" depth="5" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=47">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="47">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:link:view">cms:link:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="48" pid="46" class="46" previd="47" depth="5" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=48">修改</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="48">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:link:edit">cms:link:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="49" pid="46" class="46" previd="48" islastone="true" depth="5" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=49">审核</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="49">
                                    <input name="sorts" type="text" value="50" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:link:audit">cms:link:audit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="50" pid="40" class="40" haschild="true" previd="41" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=50">评论管理</a></td>
                                <td title="/cms/comment/?status=2">/cms/comment/?status=2</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="50">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="51" pid="50" class="50" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=51">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="51">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:comment:view">cms:comment:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="52" pid="50" class="50" previd="51" islastone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=52">审核</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="52">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:comment:edit">cms:comment:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="53" pid="40" class="40" haschild="true" previd="50" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=53">公共留言</a></td>
                                <td title="/cms/guestbook/?status=2">/cms/guestbook/?status=2</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="53">
                                    <input name="sorts" type="text" value="80" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="54" pid="53" class="53" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=54">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="54">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:guestbook:view">cms:guestbook:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="55" pid="53" class="53" previd="54" islastone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=55">审核</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="55">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:guestbook:edit">cms:guestbook:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="60" pid="31" class="31" haschild="true" previd="40" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=60">统计分析</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="60">
                                    <input name="sorts" type="text" value="600" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="61" pid="60" class="60" isfirstone="true" islastone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=61">信息量统计</a></td>
                                <td title="/cms/stats/article">/cms/stats/article</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="61">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title="cms:stats:article">cms:stats:article</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="32" pid="31" class="31" haschild="true" previd="60" islastone="true" depth="2">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=32">栏目设置</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="32">
                                    <input name="sorts" type="text" value="990" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="33" pid="32" class="32" haschild="true" isfirstone="true" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=33">栏目管理</a></td>
                                <td title="/cms/category/">/cms/category/</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="33">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="34" pid="33" class="33" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=34">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="34">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:category:view">cms:category:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="35" pid="33" class="33" previd="34" islastone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=35">修改</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="35">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:category:edit">cms:category:edit</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="36" pid="32" class="32" haschild="true" previd="33" depth="3">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=36">站点设置</a></td>
                                <td title="/cms/site/">/cms/site/</td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="36">
                                    <input name="sorts" type="text" value="40" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>显示</td>
                                <td title=""></td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" data-toggle="modal" data-target="#addChildMenu" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>

                            <tr id="37" pid="36" class="36" isfirstone="true" depth="4" style="display: none;">
                                <td nowrap=""><a href="/jeesite/a/sys/menu/form?id=37">查看</a></td>
                                <td title=""></td>
                                <td style="text-align:center;">

                                    <input type="hidden" name="ids" value="37">
                                    <input name="sorts" type="text" value="30" style="width:50px;margin:0;padding:0;text-align:center;">

                                </td>
                                <td>隐藏</td>
                                <td title="cms:site:view">cms:site:view</td>
                                <td nowrap="">
                                    <a href="#" class="btn btn-success btn-sm" onclick=""><i class="fa fa-edit"></i>修改</a>&nbsp;
                                    <a href="#" class="btn btn-danger btn-sm" onclick=""><i class="fa fa-trash-o"></i>删除</a>&nbsp;
                                    <a href="#" class="btn btn-warning btn-sm" onclick=""><i class="fa fa-plus-square"></i>添加下级菜单</a></td>
                                </td>
                            </tr>


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
    <script src="<%=request.getContextPath()%>/resources/assets/js/jquery-1.11.3/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
<!--Beyond Scripts-->
<script src="<%=request.getContextPath()%>/resources/assets/js/beyond.js"></script>

<!--Page Related Scripts-->
    <script src="<%=request.getContextPath()%>/resources/assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>

    <!--ztree用到的js-->
    <script src="<%=request.getContextPath()%>/resources/assets/js/ztree/jquery.ztree.core-3.5.min.js"></script>

    <!--treeTable用到的js-->
    <script src="<%=request.getContextPath()%>/resources/assets/js/treeTable/jquery.treeTable.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/common/boomjs/menu.js"></script>

<script>
    var zTreeObj;

    var setting = {
        callback: {
            onClick: zTreeOnClick
        }
    };
    var zNodes = [
        {name:"功能菜单", open:true, children:[
            {name:"我的面板","click":"return this.name"}, {name:"系统管理",open:false,children:[{name:"菜单管理"},{name:"用户管理"}]}]}
    ];
    $(function(){
        zTreeObj = $.fn.zTree.init($("#menuTree"), setting, zNodes);
    });

    function zTreeOnClick(event, treeId, treeNode) {
        $("#parentMenu").attr("placeholder",treeNode.name);
    };

</script>
  </body>
</html>
