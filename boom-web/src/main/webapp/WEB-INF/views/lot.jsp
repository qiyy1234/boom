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
<html>
  <head>
    <head>
    <meta charset="utf-8">
    <title>boom</title>

    <meta name="description" content="data tables">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="shortcut icon" href="<%=basePath %>resources/<%=basePath %>resources/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="<%=basePath %>resources/assets/css/bootstrap.min.css" rel="stylesheet">
    <link id="bootstrap-rtl-link" href="" rel="stylesheet">
    <link href="<%=basePath %>resources/assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=basePath %>resources/assets/css/weather-icons.min.css" rel="stylesheet">

    <!--Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">
    <link id="beyond-link" href="<%=basePath %>resources/assets/css/beyond.min.css" rel="stylesheet">
    <link href="<%=basePath %>resources/assets/css/demo.min.css" rel="stylesheet">
    <link href="<%=basePath %>resources/assets/css/typicons.min.css" rel="stylesheet">
    <link href="<%=basePath %>resources/assets/css/animate.min.css" rel="stylesheet">
    <link id="skin-link" href="#" rel="stylesheet" type="text/css">

    <!--Page Related styles-->
    <link href="<%=basePath %>resources/assets/css/dataTables.bootstrap.css" rel="stylesheet">

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script async="" src="../www.google-analytics.com/analytics.js"></script><script src="<%=basePath %>resources/assets/js/skins.min.js"></script>
    <!--Beyond styles-->
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<div class="page-body">
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">Simple DataTable</span>
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
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div id="simpledatatable_wrapper" class="dataTables_wrapper form-inline no-footer"><div class="DTTT btn-group"><a class="btn btn-default DTTT_button_copy" id="ToolTables_simpledatatable_0" tabindex="0" aria-controls="simpledatatable"><span>Copy</span><div style="position: absolute; left: 0px; top: 0px; width: 54px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_1" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="54" height="31" name="ZeroClipboard_TableToolsMovie_1" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=1&amp;width=54&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_csv" id="ToolTables_simpledatatable_1" tabindex="0" aria-controls="simpledatatable"><span>CSV</span><div style="position: absolute; left: 0px; top: 0px; width: 47px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_2" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="47" height="31" name="ZeroClipboard_TableToolsMovie_2" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=2&amp;width=47&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_xls" id="ToolTables_simpledatatable_2" tabindex="0" aria-controls="simpledatatable"><span>Excel</span><div style="position: absolute; left: 0px; top: 0px; width: 54px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_3" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="54" height="31" name="ZeroClipboard_TableToolsMovie_3" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=3&amp;width=54&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_pdf" id="ToolTables_simpledatatable_3" tabindex="0" aria-controls="simpledatatable"><span>PDF</span><div style="position: absolute; left: 0px; top: 0px; width: 47px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_4" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="47" height="31" name="ZeroClipboard_TableToolsMovie_4" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=4&amp;width=47&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_print" id="ToolTables_simpledatatable_4" title="View print view" tabindex="0" aria-controls="simpledatatable"><span>Print</span></a></div><div id="simpledatatable_filter" class="dataTables_filter"><label><input type="search" class="form-control input-sm" placeholder="" aria-controls="simpledatatable"></label></div><div class="dataTables_length" id="simpledatatable_length"><label><select name="simpledatatable_length" aria-controls="simpledatatable" class="form-control input-sm"><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select></label></div><table class="table table-striped table-bordered table-hover dataTable no-footer" id="simpledatatable" role="grid" aria-describedby="simpledatatable_info">
                                        <thead>
                                            <tr role="row"><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="
                                                    
                                                " style="width: 28px;">
                                                    <div class="checker"><span class=""><input type="checkbox" class="group-checkable" data-set="#flip .checkboxes"></span></div>
                                                </th><th class="sorting" tabindex="0" aria-controls="simpledatatable" rowspan="1" colspan="1" aria-label="
                                                    Username
                                                : activate to sort column ascending" style="width: 203px;">
                                                    Username
                                                </th><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="
                                                    Email
                                                " style="width: 393px;">
                                                    Email
                                                </th><th class="sorting" tabindex="0" aria-controls="simpledatatable" rowspan="1" colspan="1" aria-label="
                                                    Points
                                                : activate to sort column ascending" style="width: 135px;">
                                                    Points
                                                </th><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="
                                                    Joined
                                                " style="width: 211px;">
                                                    Joined
                                                </th></tr>
                                        </thead>
                                        <tbody>
                                            
                                        <tr role="row" class="odd">
                                                <td>
                                                    <div class="checker"><span class=""><input type="checkbox" class="checkboxes" value="1"></span></div>
                                                </td>
                                                <td>
                                                    shuxer
                                                </td>
                                                <td>
                                                    <a href="mailto:shuxer@gmail.com">shuxer@gmail.com</a>
                                                </td>
                                                <td>
                                                    120
                                                </td>
                                                <td class="center ">
                                                    12 Jan 2012
                                                </td>
                                            </tr><tr role="row" class="even">
                                                <td>
                                                    <div class="checker"><span class=""><input type="checkbox" class="checkboxes" value="1"></span></div>
                                                </td>
                                                <td>
                                                    looper
                                                </td>
                                                <td>
                                                    <a href="mailto:looper90@gmail.com">looper90@gmail.com</a>
                                                </td>
                                                <td>
                                                    120
                                                </td>
                                                <td class="center ">
                                                    12.12.2011
                                                </td>
                                            </tr><tr role="row" class="odd">
                                                <td>
                                                    <div class="checker"><span class=""><input type="checkbox" class="checkboxes" value="1"></span></div>
                                                </td>
                                                <td>
                                                    userwow
                                                </td>
                                                <td>
                                                    <a href="mailto:userwow@yahoo.com">userwow@yahoo.com</a>
                                                </td>
                                                <td>
                                                    20
                                                </td>
                                                <td class="center ">
                                                    12.12.2012
                                                </td>
                                            </tr><tr role="row" class="even">
                                                <td>
                                                    <div class="checker"><span class=""><input type="checkbox" class="checkboxes" value="1"></span></div>
                                                </td>
                                                <td>
                                                    user1wow
                                                </td>
                                                <td>
                                                    <a href="mailto:userwow@gmail.com">userwow@gmail.com</a>
                                                </td>
                                                <td>
                                                    20
                                                </td>
                                                <td class="center ">
                                                    12.12.2012
                                                </td>
                                            </tr><tr class="odd gradeX" role="row">
                                                <td>
                                                    <div class="checker"><span class=""><input type="checkbox" class="checkboxes" value="1"></span></div>
                                                </td>
                                                <td>
                                                    restest
                                                </td>
                                                <td>
                                                    <a href="mailto:userwow@gmail.com">test@gmail.com</a>
                                                </td>
                                                <td>
                                                    20
                                                </td>
                                                <td class="center ">
                                                    12.12.2012
                                                </td>
                                            </tr></tbody>
                                    </table><div class="row DTTTFooter"><div class="col-sm-6"><div class="dataTables_info" id="simpledatatable_info" role="status" aria-live="polite">Showing 1 to 5 of 25 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap" id="simpledatatable_paginate"><ul class="pagination"><li class="prev disabled"><a href="#">Prev</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li class="next"><a href="#">Next</a></li></ul></div></div></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">Editable DataTable</span>
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
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div class="table-toolbar">
                                        <a id="editabledatatable_new" href="javascript:void(0);" class="btn btn-default">
                                            Add New User
                                        </a>
                                        <div class="btn-group pull-right">
                                            <a class="btn btn-default" href="javascript:void(0);">Tools</a>
                                            <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="javascript:void(0);"><i class="fa fa-angle-down"></i></a>
                                            <ul class="dropdown-menu dropdown-default">
                                                <li>
                                                    <a href="javascript:void(0);">Action</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Another action</a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);">Something else here</a>
                                                </li>
                                                <li class="divider"></li>
                                                <li>
                                                    <a href="javascript:void(0);">Separated link</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div id="editabledatatable_wrapper" class="dataTables_wrapper form-inline no-footer"><div class="DTTT btn-group"><a class="btn btn-default DTTT_button_copy" id="ToolTables_editabledatatable_0" tabindex="0" aria-controls="editabledatatable"><span>Copy</span><div style="position: absolute; left: 0px; top: 0px; width: 54px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_5" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="54" height="31" name="ZeroClipboard_TableToolsMovie_5" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=5&amp;width=54&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_print" id="ToolTables_editabledatatable_1" title="View print view" tabindex="0" aria-controls="editabledatatable"><span>Print</span></a><a class="btn btn-default DTTT_button_collection" id="ToolTables_editabledatatable_2" tabindex="0" aria-controls="editabledatatable"><span>Save <i class="fa fa-angle-down"></i></span></a></div><div id="editabledatatable_filter" class="dataTables_filter"><label><input type="search" class="form-control input-sm" placeholder="" aria-controls="editabledatatable"></label></div><div class="dataTables_length" id="editabledatatable_length"><label><select name="editabledatatable_length" aria-controls="editabledatatable" class="form-control input-sm"><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="100">100</option><option value="-1">All</option></select></label></div><table class="table table-striped table-hover table-bordered dataTable no-footer" id="editabledatatable" role="grid" aria-describedby="editabledatatable_info">
                                        <thead>
                                            <tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="editabledatatable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="
                                                    Username
                                                : activate to sort column descending" style="width: 162px;">
                                                    Username
                                                </th><th class="sorting" tabindex="0" aria-controls="editabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Full Name
                                                : activate to sort column ascending" style="width: 242px;">
                                                    Full Name
                                                </th><th class="sorting" tabindex="0" aria-controls="editabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Points
                                                : activate to sort column ascending" style="width: 106px;">
                                                    Points
                                                </th><th class="sorting" tabindex="0" aria-controls="editabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Notes
                                                : activate to sort column ascending" style="width: 169px;">
                                                    Notes
                                                </th><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="

                                                " style="width: 291px;">

                                                </th></tr>
                                        </thead>
                                        
                                        <tbody>
                                        <tr role="row" class="odd">
                                                <td class="sorting_1">alex</td>
                                                <td>Alex Nilson</td>
                                                <td>1234</td>
                                                <td class="center ">power user</td>
                                                <td>
                                                    <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a>
                                                    <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>
                                                </td>
                                            </tr><tr role="row" class="even">
                                                <td class="sorting_1">
                                                    gist124
                                                </td>
                                                <td>
                                                    Nick Roberts
                                                </td>
                                                <td>
                                                    62
                                                </td>
                                                <td class="center ">
                                                    new user
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a>
                                                    <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>
                                                </td>
                                            </tr><tr role="row" class="odd">
                                                <td class="sorting_1">
                                                    goldweb
                                                </td>
                                                <td>
                                                    Sergio Jackson
                                                </td>
                                                <td>
                                                    132
                                                </td>
                                                <td class="center ">
                                                    elite user
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a>
                                                    <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>
                                                </td>
                                            </tr><tr role="row" class="even">
                                                <td class="sorting_1">
                                                    lisa
                                                </td>
                                                <td>
                                                    Lisa Wong
                                                </td>
                                                <td>
                                                    434
                                                </td>
                                                <td class="center ">
                                                    new user
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a>
                                                    <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>
                                                </td>
                                            </tr><tr role="row" class="odd">
                                                <td class="sorting_1">
                                                    nick12
                                                </td>
                                                <td>
                                                    Nick Roberts
                                                </td>
                                                <td>
                                                    232
                                                </td>
                                                <td class="center ">
                                                    power user
                                                </td>
                                                <td>
                                                    <a href="#" class="btn btn-info btn-xs edit"><i class="fa fa-edit"></i> Edit</a>
                                                    <a href="#" class="btn btn-danger btn-xs delete"><i class="fa fa-trash-o"></i> Delete</a>
                                                </td>
                                            </tr></tbody>
                                    </table><div class="row DTTTFooter"><div class="col-sm-6"><div class="dataTables_info" id="editabledatatable_info" role="status" aria-live="polite">Showing 1 to 5 of 6 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap" id="editabledatatable_paginate"><ul class="pagination"><li class="prev disabled"><a href="#">Prev</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li class="next"><a href="#">Next</a></li></ul></div></div></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">Expandable DataTable</span>
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
                                    </div>
                                </div>
                                <div class="widget-body">
                                    <div id="expandabledatatable_wrapper" class="dataTables_wrapper form-inline no-footer"><div class="DTTT btn-group"><a class="btn btn-default DTTT_button_copy" id="ToolTables_expandabledatatable_0" tabindex="0" aria-controls="expandabledatatable"><span>Copy</span><div style="position: absolute; left: 0px; top: 0px; width: 54px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_9" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="54" height="31" name="ZeroClipboard_TableToolsMovie_9" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=9&amp;width=54&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_print" id="ToolTables_expandabledatatable_1" title="View print view" tabindex="0" aria-controls="expandabledatatable"><span>Print</span></a><a class="btn btn-default DTTT_button_collection" id="ToolTables_expandabledatatable_2" tabindex="0" aria-controls="expandabledatatable"><span>Save <i class="fa fa-angle-down"></i></span></a></div><div id="expandabledatatable_filter" class="dataTables_filter"><label><input type="search" class="form-control input-sm" placeholder="" aria-controls="expandabledatatable"></label></div><div class="dataTables_length" id="expandabledatatable_length"><label><select name="expandabledatatable_length" aria-controls="expandabledatatable" class="form-control input-sm"><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="-1">All</option></select></label></div><table class="table table-striped table-bordered table-hover dataTable no-footer" id="expandabledatatable" role="grid" aria-describedby="expandabledatatable_info" style="width: 1061px;">
                                        <thead>
                                            <tr role="row"><th class="sorting_disabled" rowspan="1" colspan="1" aria-label="" style="width: 42px;"></th><th class="sorting_asc" tabindex="0" aria-controls="expandabledatatable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="
                                                    Name
                                                : activate to sort column descending" style="width: 144px;">
                                                    Name
                                                </th><th class="sorting" tabindex="0" aria-controls="expandabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Family
                                                : activate to sort column ascending" style="width: 137px;">
                                                    Family
                                                </th><th class="sorting" tabindex="0" aria-controls="expandabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Age
                                                : activate to sort column ascending" style="width: 72px;">
                                                    Age
                                                </th><th class="sorting" tabindex="0" aria-controls="expandabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Position
                                                : activate to sort column ascending" style="width: 285px;">
                                                    Position
                                                </th><th class="sorting" tabindex="0" aria-controls="expandabledatatable" rowspan="1" colspan="1" aria-label="
                                                    Interests
                                                : activate to sort column ascending" style="width: 272px;">
                                                    Interests
                                                </th></tr>
                                        </thead>
                                        <tbody>
                                            
                                        <tr role="row" class="odd"><td><i class="fa row-details fa-plus-square-o"></i></td>
                                                <td class="sorting_1">
                                                    Divya
                                                </td>
                                                <td>
                                                    Johnson
                                                </td>
                                                <td>
                                                    22
                                                </td>
                                                <td>
                                                    Software Developer
                                                </td>
                                                <td>
                                                    Jugging
                                                </td>
                                                
                                            </tr><tr role="row" class="even"><td><i class="fa fa-plus-square-o row-details"></i></td>
                                                <td class="sorting_1">
                                                    Javi
                                                </td>
                                                <td>
                                                    Jimenez
                                                </td>
                                                <td>
                                                    32
                                                </td>
                                                <td>
                                                    Software Developer
                                                </td>
                                                <td>
                                                    Gaming
                                                </td>
                                                
                                            </tr><tr role="row" class="odd"><td><i class="fa fa-plus-square-o row-details"></i></td>
                                                <td class="sorting_1">
                                                    Lee
                                                </td>
                                                <td>
                                                    Munroe
                                                </td>
                                                <td>
                                                    21
                                                </td>
                                                <td>
                                                    Software Developer
                                                </td>
                                                <td>
                                                    Swimming,Gaming
                                                </td>
                                                
                                            </tr><tr role="row" class="even"><td><i class="fa fa-plus-square-o row-details"></i></td>
                                                <td class="sorting_1">
                                                    Nicolai
                                                </td>
                                                <td>
                                                    Larson
                                                </td>
                                                <td>
                                                    27
                                                </td>
                                                <td>
                                                    Software Manager
                                                </td>
                                                <td>
                                                    Swimming
                                                </td>
                                                
                                            </tr><tr role="row" class="odd"><td><i class="fa fa-plus-square-o row-details"></i></td>
                                                <td class="sorting_1">
                                                    Osvaldus
                                                </td>
                                                <td>
                                                    Valutis
                                                </td>
                                                <td>
                                                    29
                                                </td>
                                                <td>
                                                    Software Analyst
                                                </td>
                                                <td>
                                                    Swimming,Gaming
                                                </td>
                                                
                                            </tr></tbody>
                                    </table><div class="row DTTTFooter"><div class="col-sm-6"><div class="dataTables_info" id="expandabledatatable_info" role="status" aria-live="polite">Showing 1 to 5 of 6 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap" id="expandabledatatable_paginate"><ul class="pagination"><li class="prev disabled"><a href="#">Prev</a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li class="next"><a href="#">Next</a></li></ul></div></div></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header bordered-bottom bordered-yellow">
                                    <span class="widget-caption">Search on All Columns</span>
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
                                    </div>
                                </div>
                                <div class="widget-body no-padding">
                                    <div id="searchable_wrapper" class="dataTables_wrapper form-inline"><div class="DTTT btn-group"><a class="btn btn-default DTTT_button_copy" id="ToolTables_searchable_0" tabindex="0" aria-controls="searchable"><span>Copy</span><div style="position: absolute; left: 0px; top: 0px; width: 54px; height: 31px; z-index: 99;"><embed id="ZeroClipboard_TableToolsMovie_13" src="<%=basePath %>resources/assets/swf/copy_csv_xls_pdf.swf" loop="false" menu="false" quality="best" bgcolor="#ffffff" width="54" height="31" name="ZeroClipboard_TableToolsMovie_13" align="middle" allowscriptaccess="always" allowfullscreen="false" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" flashvars="id=13&amp;width=54&amp;height=31" wmode="transparent"></div></a><a class="btn btn-default DTTT_button_print" id="ToolTables_searchable_1" title="View print view" tabindex="0" aria-controls="searchable"><span>Print</span></a><a class="btn btn-default DTTT_button_collection" id="ToolTables_searchable_2" tabindex="0" aria-controls="searchable"><span>Save <i class="fa fa-angle-down"></i></span></a></div><div id="searchable_filter" class="dataTables_filter"><label><input type="search" class="form-control input-sm" placeholder="" aria-controls="searchable"></label></div><div class="dataTables_length" id="searchable_length"><label><select name="searchable_length" aria-controls="searchable" class="form-control input-sm"><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="-1">All</option></select></label></div><table class="table table-bordered table-hover table-striped dataTable" id="searchable" role="grid" aria-describedby="searchable_info">
                                        <thead class="bordered-darkorange">
                                            <tr role="row"><th class="sorting" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1" aria-label="Rendering engine: activate to sort column ascending" style="width: 198px;">Rendering engine</th><th class="sorting_asc" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1" aria-label="Browser: activate to sort column descending" aria-sort="ascending" style="width: 199px;">Browser</th><th class="sorting" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1" aria-label="Platform(s): activate to sort column ascending" style="width: 199px;">Platform(s)</th><th class="sorting" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1" aria-label="Engine version: activate to sort column ascending" style="width: 199px;">Engine version</th><th class="sorting" tabindex="0" aria-controls="searchable" rowspan="1" colspan="1" aria-label="CSS grade: activate to sort column ascending" style="width: 199px;">CSS grade</th></tr>
                                        </thead>

                                        <tfoot>
                                            <tr><th rowspan="1" colspan="1"><input type="text" name="search_engine" placeholder="Search engines" class="form-control input-sm"></th><th rowspan="1" colspan="1"><input type="text" name="search_browser" placeholder="Search browsers" class="form-control input-sm"></th><th rowspan="1" colspan="1"><input type="text" name="search_platform" placeholder="Search platforms" class="form-control input-sm"></th><th rowspan="1" colspan="1"><input type="text" name="search_version" placeholder="Search versions" class="form-control input-sm"></th><th rowspan="1" colspan="1"><input type="text" name="search_grade" placeholder="Search grades" class="form-control input-sm"></th></tr>
                                        </tfoot>
                                        <tbody>
                                        <tr role="row" class="odd">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Camino 1.0</td>
                                                <td class=" ">OSX.2+</td>
                                                <td class="center ">1.8</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="even">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Camino 1.5</td>
                                                <td class=" ">OSX.3+</td>
                                                <td class="center ">1.8</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="odd">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Firefox 1.0</td>
                                                <td class=" ">Win 98+ / OSX.2+</td>
                                                <td class="center ">1.7</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="even">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Firefox 1.5</td>
                                                <td class=" ">Win 98+ / OSX.2+</td>
                                                <td class="center ">1.8</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="odd">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Firefox 2.0</td>
                                                <td class=" ">Win 98+ / OSX.2+</td>
                                                <td class="center ">1.8</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="even">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Firefox 3.0</td>
                                                <td class=" ">Win 2k+ / OSX.3+</td>
                                                <td class="center ">1.9</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="odd">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Mozilla 1.0</td>
                                                <td class=" ">Win 95+ / OSX.1+</td>
                                                <td class="center ">1</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="even">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Netscape 7.2</td>
                                                <td class=" ">Win 95+ / Mac OS 8.6-9.2</td>
                                                <td class="center ">1.7</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="odd">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Netscape Browser 8</td>
                                                <td class=" ">Win 98SE+</td>
                                                <td class="center ">1.7</td>
                                                <td class="center ">A</td>
                                            </tr><tr role="row" class="even">
                                                <td class=" sorting_1">Gecko</td>
                                                <td class="sorting_1">Netscape Navigator 9</td>
                                                <td class=" ">Win 98+ / OSX.2+</td>
                                                <td class="center ">1.8</td>
                                                <td class="center ">A</td>
                                            </tr></tbody>
                                    </table><div class="row DTTTFooter"><div class="col-sm-6"><div class="dataTables_info" id="searchable_info" role="status" aria-live="polite">Showing 1 to 10 of 10 entries</div></div><div class="col-sm-6"><div class="dataTables_paginate paging_bootstrap" id="searchable_paginate"><ul class="pagination"><li class="prev disabled"><a href="#">Prev</a></li><li class="active"><a href="#">1</a></li><li class="next disabled"><a href="#">Next</a></li></ul></div></div></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
  </body>
</html>
