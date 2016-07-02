/**
 * Created by yankun on 2016/3/4 0004.
 */
//翻页
function submitForm(formId){
    var form = $('#' + formId);
    var actionUrl = form.attr("action");
    //表单提交
    $.ajax({
        url: contextPath +actionUrl+"?dt=" + new Date().getTime()  +"&" +form.serialize() ,
        type: 'GET',
        success: function(result) {
            var success = result.success;
            if (success) {
                alert(result.message)
                history.go(-1);
                return false;

            }
        }
    });
}
