<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
  
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
	<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<title>sign in page</title>
<style type="text/css">
	html,body,div
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	
	body{
		overflow:auto;
	}
	
	a:link,a:hover,a:visited,a:active{text-decoration:none;}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:auto !important;
		width:100%;
	}
	
	div.header_container
	{
		width:auto;
		height:130px;
		background-image:url(${ctx}/img/oheader.png);
	}
	
	div.main_container_box{
		position:relative;
		width:1000px;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
		margin-bottom:10px;
		overflow:hidden;
	}
	
	div.main_container{
		padding-bottom:50px;
		overflow:hidden;
	}
	
	div.footer_container{
		height:30px;
		position:absolute;
		bottom:0px;
		left:0px;		/**IE*/
		width:100%;
		display:block;
		background-color:#fff;
		
		border-top-width:1px;
		border-style:solid;
		border-color:#ccc;
		border-bottom-width:0px;
		border-left-width:0px;
		border-right-width:0px;
		
		text-align:center;
	}
	
	.center_area{
		width:1000px;
		margin-left:auto;
		margin-right:auto;
	}
	
	.header_basic{
		background-color:white;
		height:40px;
		overflow: hidden;
		
		position:relative;
		filter:alpha(opacity=95); /*支持 IE 浏览器*/
		-moz-opacity:0.95; /*支持 FireFox 浏览器*/
		opacity:0.95; /*支持 Chrome, Opera, Safari 等浏览器*/
		
		box-shadow: rgba(0,0,0,0.1) 0 1px 2px;
	}
	
	.header_box{
		height:100%;
		width:1000px;
			
		margin-left:auto;
    	margin-right:auto;
    	
	}
	
	.header_selection_box{
		float:left;
	}
	
	
	.header_botton_box{
		float:right;
	}

	ul{
		height:100%;
		list-style-type:none;
	}
	li{
		line-height:40px;
		float:left;
	}
	
	a.header_btn:link,a.header_btn:visited
	{
		display:block;
		width:110px;
		height:100%;
		color:rgb(102, 102, 102);
		font-weight:bold;
		text-align:center;
		padding:4px;
		border:2px solid #ccc; 
		border-width:0 2px 0 0;
		text-decoration:none;
		text-transform:none;
		padding:0px;
		margin:0px;
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	div.signin_form_box{
		margin-top:20px;
		height:700px;
		width:800px;
		background-image:url(${ctx}/img/signinBack.jpg);
		padding:20px 10px 20px 10px;
		margin-left:auto;
		margin-right:auto;
	}
	
	div.input_box{
		position:relative;
		top:50px;
		width:500px;
		height:575px;
		margin-left:auto;
		margin-right:auto;
	}
	
	input.signin_input{
		width:500px;
		height:40px;
		font-size:18px;
		margin-top:5px;
		margin-bottom:15px;
		padding-left:20px;
		border: 1px solid #ddd;
    	border-radius: 2px;
    	color: #aaa;
    	font-size: 14px;
		outline:none;
	}
	
	input.signin_input：hover,input.signin_input:focus{
		border: 1px solid #4f90fb;
	}
	
	.alert_msg{
		font-size:14px;
		color:#ff6384;
	}
	
	.signin_title{
		font-size:28px;
		color:#666;
		position:relative;
		left:50px;
		text-align:left;
		margin:0px;
	}
	
	.title_name{
		font-size:20px;
		font-weight:blod;
		font-family:"Microsoft YaHei";
	}
	
	.btn{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:50px;
		  width:250px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:22px;
		  font-weight:normal;
		  border:1px solid #1647e9;
		  -webkit-border-top-left-radius:2px;
		  -moz-border-radius-topleft:2px;
		  border-top-left-radius:2px;
		  -webkit-border-top-right-radius:2px;
		  -moz-border-radius-topright:2px;
		  border-top-right-radius:2px;
		  -webkit-border-bottom-left-radius:2px;
		  -moz-border-radius-bottomleft:2px;
		  border-bottom-left-radius:2px;
		  -webkit-border-bottom-right-radius:2px;
		  -moz-border-radius-bottomright:2px;
		  border-bottom-right-radius:2px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn:hover{
		background-color:#9bc0fd;
	}
	
	.signin_btn_box{
		margin-left:auto;
		margin-right:auto;
		position:relative;
		top:-10px;
		text-align:center;
		height:40px;
	}
	
	.dialog{
		display: none;
		z-index: 5;
		
		height:150px;
		width:400px;
		background-color: #FFF;
		border: 1px solid #888;
		
		position: fixed !important; /* 浮动对话框 */
		top: 40%;
		left:35%;
		text-align:center;
		margin-left:auto; 
		margin-right:auto;
		
		-moz-border-radius: 10px;
		-webkit-border-radius: 10px;
		border-radius: 10px;
		
		border:2px solid #4f90fb;
	}
	
	.dialog_msg{
		font-size:20px;
		margin-top:30px;
	}
	
	.coverbg{
    	background-color:#333;
    	left: 0px;
    	opacity: 0.5;
		position: absolute;
    	top: 0px;
    	z-index: 3;
    	filter: alpha(opacity=50); /* IE6 */
    	-moz-opacity: 0.5; /* Mozilla */
    	-khtml-opacity: 0.5; /* Safari */
	}
	
	span.already_have{
		color:#333;
		position:relative;
		left:180px;
		top:-25px;
	}
	
	span.already_have:hover{
		color:#ff6384;
	}
</style>

<script type="text/javascript">

$(function(){
	
	$("#userNameError").hide();
	$("#userPwdError").hide();
	$("#userCheckPwdError").hide();
	$("#userIdentifyError").hide();
	$("#userPhoneError").hide();
	$("#userEmailError").hide();
	
	$("#signinButton").click(function(){
		//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
		var tempUserName = $("#userName").val();
		var tempUserPwd =  $("#userPwd").val();
		var tempUserCheckPwd =  $("#userCheckPwd").val();
		var tempUserPhone =  $("#userPhone").val();
		var tempUserEmail =  $("#userEmail").val();
		var tempUserIdentify =  $("#userIdentify").val();
		
		var tempDefalut = Number(1);
		
		$("#userNameError").hide();
		$("#userPwdError").hide();
		$("#userCheckPwdError").hide();
		$("#userIdentifyError").hide();
		$("#userPhoneError").hide();
		$("#userEmailError").hide();
		
		//用于记录所有的输入是否合法
		var ok1=false;
		var ok2=false;
		var ok3=false;
		var ok4=false;
		var ok5=false;
		var ok6=false;
		
		//验证邮箱和电话正确的正则表达式
		var regPwd=/[a-zA-Z0-9]*/;
		var regPhone=/^1[3|4|5|7|8]\d{9}$/;
		var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		var regIdentify=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		
		//较为简单的判断逻辑
        if(tempUserName=="" || tempUserName.length < 3 || tempUserName.length > 32){
        	 $("#userNameError").show();
            }
        else{ok1=true;}
     
        if(tempUserPwd=="" || tempUserPwd.length < 3 || tempUserPwd.length > 32||(!regPwd.test(tempUserPwd ))){
        	 $("#userPwdError").show();
        }
    	else{ok2=true;}
        
        if(regPhone.test(tempUserPhone)){
        	 ok3=true;
        }
        else if(tempUserPhone==""){
        	tempUserPhone="none";
        	ok3=true;
        }
    	else if(tempUserPhone!=""&&!regPhone.test(tempUserPhone))
    	{
    		 $("#userPhoneError").show();
    	}
        
        if(regEmail.test(tempUserEmail)){
        	ok4=true;
        }
        else if(tempUserEmail==""){
        	tempUserEmail="none";
        	ok4=true;
        }
    	else if(tempUserEmail!=""&&!regEmail.test(tempUserEmail)){
    		$("#userEmailError").show();
    	}
        
        if(tempUserPwd!=tempUserCheckPwd||tempUserCheckPwd==""){
        	$("#userCheckPwdError").show();
        }
    	else{
    		ok5=true;
    	}
        
        if(regIdentify.test(tempUserIdentify)){
        	ok6=true;
        }
        else if(tempUserIdentify==""){
        	tempUserIdentify="none";
        	ok6=true;
        }
    	else{
    		$("#userIdentifyError").show();
    	}
        
       	//创建一个临时的user变量用于传参,用户信用等级默认设置为1，用户的状态默认设置为正常状态
        var tempUser={'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userIdentify':tempUserIdentify,'userCredit':tempDefalut,'userState':tempDefalut,'userBadHistory':tempDefalut,'userOwe':tempDefalut};

        if(ok1&&ok2&&ok3&&ok4&&ok5&&ok6){			//如有一个不合法(即为false)则不提交至后台
        	$.ajax({ 							//提交                          	  
			url: ' ${ctx}/user/signin',       //处理注册的页面                 
			type: 'POST',
			data: tempUser,                
			success: function (msg) { 
                if (msg == "success"){
                	window.location.href='${ctx}/page/jumpToLogin';
                  }
                else if(msg == "repeat"){
                	var bh = $(".wrapper").height();
				    var bw = $(".wrapper").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
                	$("#repeatDialog").show();
                }
                else if(msg == "repeatIdentify"){
                	var bh = $(".wrapper").height();
				    var bw = $(".wrapper").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
                	$("#repeatIdentifyDialog").show();
                }
				else{
					
				}
				}              
			});    
        }         		  
	});
});



//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#coverbg").hide();
    $("#repeatDialog").hide();
    $("#repeatIdentifyDialog").hide();
}
</script>
</head>
<body>
	<!-- 这里是主页面哟！ -->
	<div class="wrapper">
		<div class="header_container">
			<div class="header_basic">
				<div class="header_box">
					<div class="header_selection_box">
						<ul>
							<li>
								<a href="${ctx}/page/jumpToHomePage" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:18px;">返回主页</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="header_botton_box">
						<ul>
							<li>
								<a href="${ctx}/page/jumpToLogin" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:18px;">登陆</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="signin_form_box">
				<div class="input_box">
						<p class="login_title">
							<span class="title_name">用户名</span><span class="title_name" style="font-size:10px">（必填）</span>
							<span class="alert_msg" id="userNameError">*账号长度应在3-32字符之间</span>
						</p>
						<input type="text" id="userName" placeholder="请输入您的账号" class="signin_input">
						
						<p class="login_title">
							<span class="title_name">密码</span><span class="title_name" style="font-size:10px">（必填）</span>
							<span class="alert_msg" id="userPwdError">*密码长度应在3-32字符之间</span>
						</p>
						<input type="password" id="userPwd" placeholder="请输入您的密码" class="signin_input">
						
						<p class="login_title">
							<span class="title_name">确认密码</span><span class="title_name" style="font-size:10px">（必填）</span>
							<span class="alert_msg" id="userCheckPwdError">*确认密码应与密码一样</span>
						</p>
						<input type="password" id="userCheckPwd" placeholder="请再次输入您的密码" class="signin_input">
						
						<p class="login_title">
							<span class="title_name">身份证号码</span>
							<span class="alert_msg" id="userIdentifyError">*请确认身份证格式</span>
						</p>
						<input type="text" id="userIdentify" placeholder="一旦经过实名验证，您将享受分期付款功能" class="signin_input">
						
						<p class="login_title">
							<span class="title_name">邮箱</span>
							<span class="alert_msg" id="userEmailError">*请确认邮箱填写正确</span>
						</p>
						<input type="text" id="userEmail" placeholder="请您填写常用的邮箱以便及时受到我们的通知" class="signin_input">
						
						<p class="login_title">
							<span class="title_name">电话号码</span>
							<span class="alert_msg" id="userPhoneError">*请确认电话号码填写正确</span>
						</p>
						<input type="text" id="userPhone" placeholder="请您手机以便及时受到我们的通知" class="signin_input">
					</div>
			</div>
			<div class="signin_btn_box">
				<button class="btn" id="signinButton">注册</button>
				<a href="${ctx}/page/jumpToLogin"><p><span class="already_have">已有账号？</span></p></a>
			</div>
		</div>
		<div class="footer_container">
			<div class="center_area">
				copyright(c) 2016
			</div>
		</div>
	</div>
	
	<!-- jQuery 遮罩层 -->
	<div id="coverbg" class="coverbg"></div>
	
	<!-- 这里存放dialogs -->
	<div id="repeatDialog" class="dialog">
		<p class="dialog_msg">用户名重复</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">关闭</button></a>
	</div>
	<div id="repeatIdentifyDialog" class="dialog">
		<p class="dialog_msg">身份证号已使用</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">关闭</button></a>
	</div>
</body>
</html>