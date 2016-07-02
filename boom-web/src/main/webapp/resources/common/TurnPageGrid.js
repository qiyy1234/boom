/**
 * Created by yankun on 2016/3/4 0004.
 */
//翻页
function goPage(tableId, pageNo) {
    //获取表
    var table = $('#' + tableId);
    var actionUrl = table.attr("action");
    var deleteAction = table.attr("deleteAction");
    var editAction = table.attr("editAction");
    var pageSize = table.attr("pageSize");
    var start = (pageNo - 1) * pageSize;

    //表单搜索
    $.ajax({
        url: contextPath + actionUrl + "?start=" + start + "&limit=" + pageSize + "&" + $('#' + tableId + "Form").serialize() + "&dt=" + new Date().getTime(),
        type: 'GET',
        success: function (result) {
            var success = result.success;
            if (success) {
                $("#" + tableId + " tbody").html("");
                //表格信息
                $.each(result.list, function (index, value) {
                    var row = $("<tr></tr>");
                    var tbHead = table.children('thead'); //获取table对象下的thead
                    var tbHeadTh = tbHead.find('tr th'); //获取thead下的tr下的th
                    tbHeadTh.each(function () {//遍历thead的tr下的th
                        if ($(this).attr("checkbox")) {
                            row.append($("<td><input type=\"checkbox\" data-md-icheck class=\"ts_checkbox\"></td>"));
                        } else if ($(this).attr("action")) {
                            row.append($("<td class=\"uk-text-center\"><a href=\""+ contextPath + editAction+"?id="+ value['id'] +"\"><i class=\"md-icon material-icons\">&#xE254;</i></a>  <a href=\"javascript:deleteRow('"+contextPath+ deleteAction+"?id="+ value['id']+"','"+ tableId+"',"+ pageNo+")\" class=\"ts_remove_row\"><i class=\"md-icon material-icons\">&#xE872;</i></a></td>"))
                            //row.append($("<td class=\"uk-text-center\"><a href=\"javascript:editRow('"+contextPath+ editAction+"?id="+ value['id']+"','"+ tableId+"',"+ pageNo+")\" class=\"ts_remove_row\"><i class=\"md-icon material-icons\">&#xE254;</i></a>  <a href=\"javascript:deleteRow('"+contextPath+ deleteAction+"?id="+ value['id']+"','"+ tableId+"',"+ pageNo+")\" class=\"ts_remove_row\"><i class=\"md-icon material-icons\">&#xE872;</i></a></td>"))
                        } else {
                            var valueName = $(this).attr("column");
                            if (valueName) {
                                row.append($("<td>" + value[valueName] + "</td>"));
                            }
                        }
                    });
                    table.append(row);
                });
                //总页数
                var totalPageCount = Math.ceil(result.rowCount / pageSize);
                //生成翻页按钮
                var turnPage = $('#turnPage');
                turnPage.empty();
                //上一页
                if (pageNo > 1) {
                    turnPage.append($("<li><a href=\"javascript:goPage('" + tableId + "'," + (pageNo - 1) + ")\"><li><span><i class=\"uk-icon-angle-double-left\"></i></span></li></a></li>"));
                } else {
                    turnPage.append($("<li><a href=\"#\"><li class=\"uk-disabled\"><span><i class=\"uk-icon-angle-double-left\"></i></span></li></a></li>"));
                }

                var pageNoStep = 10;
                var startPageNo = pageNo > pageNoStep ? (pageNo % pageNoStep == 0 ? pageNo - pageNoStep + 1 : pageNo - pageNo % pageNoStep + 1) : 1;
                var maxPageNo = startPageNo + pageNoStep > totalPageCount ? totalPageCount : startPageNo + pageNoStep;

                //首页
                if (pageNo > pageNoStep) {
                    turnPage.append($("<li><a href=\"javascript:goPage('" + tableId + "'," + 1 + ")\">1</a></li>"));
                    turnPage.append($("<li><span>&hellip;</span></li>"));
                }

                //中间页码
                for (var i = startPageNo; i <= maxPageNo; i++) {
                    var classContent;
                    if (i == pageNo) {
                        classContent = "class=\"uk-active\"";
                    } else {
                        classContent = "";
                    }
                    turnPage.append($("<li " + classContent + "><a href=\"javascript:goPage('" + tableId + "'," + i + ")\">" + i + "</a></li>"));
                }

                if (totalPageCount - maxPageNo > 1) {
                    turnPage.append($("<li><span>&hellip;</span></li>"));
                }

                //尾页
                if (maxPageNo < totalPageCount) {
                    turnPage.append($("<li><a href=\"javascript:goPage('" + tableId + "'," + totalPageCount + ")\">" + totalPageCount + "</a></li>"));
                }
                //下一页
                if (totalPageCount <= pageNo) {
                    turnPage.append($("<li class=\"uk-disabled\"><a href=\"#\"><i class=\"uk-icon-angle-double-right\"></li></a></li>"));
                } else {
                    turnPage.append($("<li><a href=\"javascript:goPage('" + tableId + "'," + (pageNo + 1) + ")\"><i class=\"uk-icon-angle-double-right\"></li></a></li>"));
                }
            }
        }
    });
}

/**
 * 删除行数据
 * @param deleteAction
 * @param tableId
 * @param pageNo
 */
function deleteRow(deleteAction,tableId, pageNo){
    //表单搜索
    $.ajax({
        url: deleteAction+ "&dt=" + new Date().getTime(),
        type: 'GET',
        success: function (result) {
            var success = result.success;
            if (success) {
                goPage(tableId,pageNo);
            }
        }
    });
}

/**
 *  编辑行数据
 * @param editAction
 * @param tableId
 * @param pageNo
 */
function editRow(editAction,tableId, pageNo){
    var obj = new Object();
    obj.tableId = tableId;
    obj.pageNo = pageNo;
    window.open(editAction,obj,'dialogWidth:500px;dialogHeight:280px;dialogLeft:200px;dialogTop:200px;center:yes;help:yes;resizable:yes;status:yes');
}