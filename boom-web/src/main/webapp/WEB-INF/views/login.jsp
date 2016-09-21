<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath()+"/";
	
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<!--Head-->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:27:13 GMT -->
<head>
    <meta charset="utf-8" />
    <title>Boom Login Page</title>

    <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="<%=basePath %>resources/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="<%=basePath %>resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="#" rel="stylesheet" />
    <link href="<%=basePath %>resources/assets/css/font-awesome.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link id="beyond-link" href="<%=basePath %>resources/assets/css/beyond.min.css" rel="stylesheet" />
    <link href="<%=basePath %>resources/assets/css/demo.min.css" rel="stylesheet" />
    <link href="<%=basePath %>resources/assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="#" rel="stylesheet" type="text/css" />

</head>
<!--Head Ends-->
<!--Body-->
<body>
  <form action="" method="post" name="loginForm" id="loginForm">
    <div class="login-container animated fadeInDown">
        <div class="loginbox bg-white">
            <div class="loginbox-title">BOOM SIGN IN</div>
            <div class="loginbox-social">
                <div class="social-title ">Connect with Your Social Accounts</div>
                <div class="social-buttons">
                    <a href="#" class="button-facebook">
                        <i class="social-icon fa fa-facebook"></i>
                    </a>
                    <a href="#" class="button-twitter">
                        <i class="social-icon fa fa-twitter"></i>
                    </a>
                    <a href="#" class="button-google">
                        <i class="social-icon fa fa-google-plus"></i>
                    </a>
                </div>
            </div>
            <div class="loginbox-or">
                <div class="or-line"></div>
                <div class="or">OR</div>
            </div>
            <div class="loginbox-textbox">
                <input type="text" name="loginName" id="loginName" value="admin"  class="form-control" placeholder="LoginName" />
            </div>
            <div class="loginbox-textbox">
                <input type="text" name="password" id="password" value="123456"  class="form-control" placeholder="Password" />
            </div>
            <div class="loginbox-textbox">
                <input type="text" name="randomcode" id="randomcode"  class="form-control" placeholder="Randomcode" />
            </div>
            <div class="loginbox-forgot">
              <i><img  id="codeImg" alt="点击更换" title="点击更换" src="" style="opacity:0.4" /></i>
            </div>
            
            <div class="loginbox-forgot">
                <a href="#">Forgot Password?</a>
            </div>
            <div class="loginbox-submit">
                <input type="button" class="btn btn-primary btn-block" value="Login" onclick="severCheck()" >
            </div>
            <div class="loginbox-signup">
                <a href="register.html">Sign Up With Email</a>
            </div>
       </div>
    </div>
    
	</form>
    <!--Basic Scripts-->
    <script src="<%=basePath %>resources/assets/js/jquery.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

    <!--Beyond Scripts-->
    <script src="<%=basePath %>resources/assets/js/beyond.js"></script>
    
    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="<%=basePath %>resources/assets/js/skins.min.js"></script>
    <script src="<%=basePath %>resources/assets/js/jquery.tips.js"></script>

    <!--Google Analytics::Demo Only-->
    <script>
    function severCheck(){
			var loginName = $("#loginName").val();
			var password = $("#password").val();
			if(loginName == ''){
				$("#loginName").tips({
					side : 1,
					msg : "用户名密码不能为空",
					bg : '#FF5080',
					time : 3
				});
				$("#loginName").focus();
				return  false;
			}
			$.ajax({
				type: "POST",
				url: '<%=basePath %>rest/page/validateLogin',
		    	data: {loginName:loginName,password:password,randomcode:$("#randomcode").val(),tm:new Date().getTime()},
				dataType:'json',
				cache: false,
				success: function(data){
					if("success" == data.success){
						window.location.href="<%=basePath %>rest/page/index";
					}else if("usererror" == data.usererror){
						$("#loginName").tips({
							side : 1,
							msg : "用户名或密码有误",
							bg : '#FF5080',
							time : 3
						});
						$("#loginName").focus();
					}else if("codeerror" == data.codeerror){
 						$("#randomcode").tips({
							side : 1,
							msg : "验证码输入有误",
							bg : '#FF5080',
							time : 3
						}); 
						$("#randomcode").focus();
					}else{
						$("#loginName").tips({
							side : 1,
							msg : "缺少参数",
							bg : '#FF5080',
							time : 3
						});
						$("#loginName").focus();
					}
					
					
					
				
				}
			});
	}
    
	$(function() {
		changeCode();
		$("#codeImg").bind("click", changeCode);
	});
	

	function changeCode() {
		$("#codeImg").attr("src", "<%=basePath %>rest/page/code?t=" + genTimestamp());
	}

	function genTimestamp() {
		var time = new Date();
		return time.getTime();
	}
    
    
    
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '../www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-60412744-1', 'auto');
        ga('send', 'pageview');

    </script>
</body>
<!--Body Ends-->

<!-- Mirrored from beyondadmin-v1.4.s3-website-us-east-1.amazonaws.com/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 07 May 2015 08:27:13 GMT -->
</html>
