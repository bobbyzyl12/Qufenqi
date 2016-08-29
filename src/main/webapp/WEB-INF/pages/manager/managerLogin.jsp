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
<title>normal login page</title>
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
		overflow:hidden;
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
	
	div.login_form_box{
		float:left;
		height:450px;
		width:500px;
		background-image:url(${ctx}/img/loginBack.jpg);
		text-align:center;
		padding:20px 10px 20px 10px;
		margin:0;
	}
	
	div.login_img_box{
		position:relative;
		height:450px;
		width:500px;
		background-color:green;
		text-align:center;
		padding:20px 10px 20px 10px;
		margin:0;
		float:left;
		background-image:url(${ctx}/img/ad.jpg);
	}
	
	div.input_box{
		position:relative;
		top:65px;
		
	}
	
	input.login_input{
		width:380px;
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
	
	input.login_input：hover,input.login_input:focus{
		border: 1px solid #4f90fb;
	}
	
	.alert_msg{
		font-size:14px;
		color:#ff6384;
	}
	
	.login_title{
		font-size:28px;
		color:#666;
		position:relative;
		left:50px;
		text-align:left;
		margin:0px;
	}
	
	.title_name{
		font-size:24px;
		font-weight:blod;
		font-family:"Microsoft YaHei";
	}
	
	.btn_login{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:180px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:18px;
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
		
	.btn_login:hover{
		background-color:#9bc0fd;
	}
	
	.btn_signin{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:180px;
		  color:#000;
		  background-color:#fff;
		  font-size:18px;
		  font-weight:normal;
		  border:1px solid #dcdcdc;
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
		
	.btn_signin:hover{
		color:#ff6384;
	}
	
	.login_btn_box{
		margin-top:20px;
	}
	
	.other_role{
		color:#666;
		margin:5px;
	}
	
	.other_role:hover{
		color:#ff6384;
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
</style>

<script type="text/javascript">

$(function(){
	$("#userNameError").hide();
	$("#userPwdError").hide();
	$("#loginButton").click(function(){
		//获取输入的用户名和密码将其赋值给temp进行判断和传值
		var tempUserName = $("#userName").val();
		var tempUserPwd =  $("#userPwd").val();
		
		//最后提交时用于记录所有的输入是否合法的简单判断，如有一个不合法则不提交至后台
		var ok1=false;
		var ok2=false;
		$("#userNameError").hide();
		$("#userPwdError").hide();
		
		if(tempUserName=="" || tempUserName.length < 3 || tempUserName.length > 32){
			$("#userNameError").show();
		}
        else{ok1=true;}
		
		var regPwd=/[a-zA-Z0-9]*/;
        if(tempUserPwd=="" || tempUserPwd.length < 3 || tempUserPwd.length > 32||(!regPwd.test(tempUserPwd ))){
            $("#userPwdError").show();
        }
    	else{ok2=true;}
        
        if(ok1&&ok2){
        	$.ajax({                           	  
			url: '${ctx}/user/managerLogin',       //处理测试页面                 
			type: 'POST',                  
			data: {managerName: tempUserName, managerPwd:tempUserPwd },                
			success: function (msg){ 
                if (msg == "success"){
                	window.location.href='${ctx}/page/jumpToManaHome';
                  }
                else if(msg == "locked"){
                	var bh = $("body").height();
				    var bw = $("body").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
                	$("#lockDialog").show();
                  }
				else{
					var bh = $("body").height();
				    var bw = $("body").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
					$("#failDialog").show();
				}
				}              
			});    
        }         		  
	});
});

//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#coverbg").hide();
    $("#failDialog").hide();
    $("#lockDialog").hide();
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
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="main_container_box" style="background-color:#ccc;">
				<div class="login_img_box">
				</div>
				<div class="login_form_box">
					<div class="input_box">
						<p class="login_title">
							<span class="glyphicon glyphicon-user"></span>
							<span class="title_name">用户名</span>
							<span class="alert_msg" id="userNameError">*账号长度应在3-32字符之间</span>
						</p>
						<input type="text" id="userName" placeholder="请输入您的账号" class="login_input">
						
						<p class="login_title">
							<span class="glyphicon glyphicon-lock"></span>
							<span class="title_name">密码</span>
							<span class="alert_msg" id="userPwdError">*密码长度应在3-32字符之间</span>
						</p>
						<input type="password" id="userPwd" placeholder="请输入您的密码" class="login_input">
						<div class="login_btn_box">
							<button class="btn_login" id="loginButton">登陆</button>
							<div style="position:relative;left:-50px;top:10px;text-align:right;">
								<a href="${ctx}/page/jumpToLogin"><p class="other_role"> >一般用户登陆</p></a>
							</div>
						</div>
						
					</div>
				</div>
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
	<div id="failDialog" class="dialog">
		<p class="dialog_msg">用户名或密码错误</p>
  		<a href="#" onclick="closeBg();"><button class="btn_login" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="lockDialog" class="dialog">
  		<p class="dialog_msg">该用户已冻结</p>
  		<a href="#" onclick="closeBg();"><button class="btn_login" style="width:120px;">关闭</button></a>
	</div>
</body>
</html>