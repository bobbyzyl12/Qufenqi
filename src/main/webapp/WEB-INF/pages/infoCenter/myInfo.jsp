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
<title>qfenqi home page</title>
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
	
	a:hover,a:link,a:visited,a:active{
		color:#000;
		text-decoration:none;
	}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:auto !important;
		width:100%;
	}
	
	div.header_container
	{
		width:auto;
		height:50px;
		background-image:url(${ctx}/img/headerBack.jpg);
	}
	
	div.main_container{
		margin-top:30px;
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
		position:relative;
	}
	
	
	
	.dialog{
		display: none;
		z-index: 5;
		
		background-color: #FFF;
		border: 1px solid #888;
		
		position: fixed !important; /* 浮动对话框 */
		top: 50%;
		left: 50%;
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
	
	ul{
		height:100%;
		list-style-type:none;
	}
	
	ul,li{
		list-style:none;
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
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	a.header_btn2:link,a.header_btn2:visited
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
	
	a.header_btn2:hover,a.header_btn2:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	.header_under_center{
		height:100%;
		width:1200px;
		margin-left:auto;
    	margin-right:auto;
    	vertical-align:middle;
	}
	
	.header_logo_box{
		width:auto;
		padding:10px 0px 0px 0px;
		float:left;
	}
		
	img.header_logo{
		height:80px;
	}
	
	.search_box{
		float:left;
	}
	
	.header_search_box{
		float:left;
		position:relative;
		left:50px;
		padding:25px 50px 0px 0px;
	}
	
	.header_search{
		width:700px;
		height:50px;
		padding:0px 0px 0px 30px;
		margin:0;
		border-width:3px;
		border-style:solid;
		border-color:#3399ff #3399ff; 
		font-size:20px;
		outline:medium;
		background-color:#f2f2f2;
	}
	
	.header_search:hover,.header_search:focus{
		background-color:#ffffff;
	}
	
	.main_info_area{
		overflow: hidden;
    	height: 100%;
    	margin: 10px auto 30px;
    	border: 1px solid #e1e2e5;
    	box-shadow: 0 2px 4px rgba(0,0,0,.14);
    	background: #FAFAFA;
    	border-radius: 4px;
    	position:relative;
	}
	
	.info_left{
		position:absolute;
		left:0px;
		top:0px;
    	width: 180px;
    	height: 100%;
	}
	
	.info_right {
		position: relative;
		left:180px;
		top:0px;
	    width: 820px;
	    box-sizing: border-box;
	    border-left: 1px solid #ddd;
	    background: #fff;
	  	padding:0px;
	    min-height: 736px;
	}

	.text_area{}
	
	.f_list{
		border-bottom: 1px solid #e1e2e5;
		color:#717171;
		padding:0px;
	}
	
	.f_list_title{
		font-size: 16px;
	    padding-left: 45px;
	    padding-bottom: 7px;
	    display: block;
	    height: 50px;
	    line-height: 50px;
	    color: #99a2aa;
    	border-bottom: 1px solid #e1e2e5;
    	margin:0px;
	}
	
	.f_list_content{
		font-size: 14px;
	    padding-left: 38px;
	    padding-bottom: 7px;
	    display: block;
	    height: 40px;
	    line-height: 40px;
    	width:180px;
    	border-bottom: 1px solid #e1e2e5;
	}
	
	.f_list_content_current{
		font-size: 14px;
	    padding-left: 38px;
	    padding-bottom: 7px;
	    display: block;
	    height: 40px;
	    line-height: 40px;
    	width:180px;
    	border-bottom: 1px solid #e1e2e5;
    	color:#fff;
    	background-color:#4f90fb;
	}
	
	.f_list_content:hover{
		background-color:#ddd;
	}
	
	.list_icon{
		font-size: 14px;
		color: #99a2aa;
	}
	
	.list_icon_current{
		font-size: 14px;
		color: #fff;
	}
	
	.right_title{
		padding-left: 30px;
		font-size: 16px;
	    padding-left: 25px;
	    padding-bottom: 7px;
	    display: block;
	    height: 50px;
	    line-height: 50px;
	    color: #99a2aa;
    	border-bottom: 1px solid #e1e2e5;
    	margin:0px;
	}
	
	.tit_b{
		width:4px;
	    height:16px;
	    margin-top:16px;
	    background-color:#00a1d6;
	    border-radius:4px;
		float: left;
	}
	
	.tit_text{
		color:#00a1d6;
		margin:30px 0 0 5px;
	    font-size:14px;
	    cursor:default;
	}
	
	.right_content{
		width:700px;
		margin-left:20px;
		margin-top:30px;
		font-size:14px;
		overflow:hidden;
		padding-bottom:50px;
	}
	
	.info{
		position: relative;
    	height:32px;
    	line-height: 32px;
    	color: #666;
    	clear: both;
    	width:700px;	
	}
	
	.info_l{
		width:95px;
    	text-align:right;
    	margin-right:23px;
    	float:left;
	}
	
	div.edit_box{
		position:relative;
		left:110px;
		margin:10px;
		width:500px;
		padding:10px 0px 10px 20px;
		border:1px solid #ccc;
	}
	
	input.input_box{
		width:300px;
		height:40px;
		font-size:18px;
		margin-top:5px;
		padding-left:20px;
		border: 1px solid #ddd;
    	border-radius: 2px;
    	color: #aaa;
    	font-size: 14px;
		outline:none;
	}
	
	input.input_box:focus{
		border: 1px solid #4f90fb;
	}
	
	.btn{
		  padding:0;
		  margin-left:30px;
		  margin-right:10px;
		  height:35px;
		  width:100px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:16px;
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
		color:#fff;
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
	
	.logout_btn{
		font-size:14px;
		border:1px solid #ccc;
		border-radius:5px;
		padding:0px;
		height:30px;
		width:70px;
		margin-top:10px;
		background-color:#fff;
		position:absolute;
		right:30px;
	}
	
	.logout_btn:hover{
		color:#4f90fb;
		border:1px solid #4f90fb;
	}
</style>

<script type="text/javascript">

$(function(){
	$("#nameEditBox").hide();
	$("#pwdEditBox").hide();
	$("#identifyEditBox").hide();
	$("#phoneEditBox").hide();
	$("#emailEditBox").hide();
	$("#submittedMsg").hide();
	
	var identifyNum = $("#userIdentify").text();
	if(identifyNum!="none"){
		$("#submittedMsg").show();
		$("#editIdentifyBtn").hide();
	}
	//点击链接后显示div用
	$("#editNameBtn").click(function(){
		$("#nameEditBox").show();
	});
	
	$("#editPwdBtn").click(function(){
		$("#pwdEditBox").show();
	});
	
	$("#editIdentifyBtn").click(function(){
		$("#identifyEditBox").show();
	});
	
	$("#editEmailBtn").click(function(){
		$("#emailEditBox").show();
	});	
	
	$("#editPhoneBtn").click(function(){
		$("#phoneEditBox").show();
	});	
	
	//提交修改用
	$("#editNameSaveBtn").click(function(){
		var tempUserName = $("#editNameInput").val();
		var ok1=false;
		if(tempUserName=="" || tempUserName.length < 3 || tempUserName.length > 32){	
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
        	$("#userNameErrorDialog").show();
		}
       	else{ok1=true;}
		
		if(ok1==true){
			$.ajax({                           	  
				url: '${ctx}/user/updateName',       //处理测试页面                 
				type: 'POST',                  
				data: {userName:tempUserName},                
				success: function (msg){
	                if (msg == "success"){
	                	window.location.href='${ctx}/page/jumpToMyInfo';
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
					else{
						var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
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
	
	$("#editPwdSaveBtn").click(function(){
		var tempUserPwd =  $("#editNewInput").val();
		var tempUserCheckPwd =  $("#editConfirmNewInput").val();
		var tempUserOldPwd =$("#editOldPwdInput").val();
		
		var ok1=false;
		var ok2=false;
		var regPwd=/[a-zA-Z0-9]*/;
		
		 if(tempUserPwd=="" || tempUserPwd.length < 3 || tempUserPwd.length > 32||(!regPwd.test(tempUserPwd ))){
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
        	$("#userPwdErrorDialog").show();
		}
       	else{ok1=true;}
		
		 if(tempUserPwd!=tempUserCheckPwd||tempUserCheckPwd==""){
			 var bh = $(".wrapper").height();
			 var bw = $(".wrapper").width();
			 $("#coverbg").css({
			      height: bh,
			      width: bw,
			      display: "block"
			  });
	        $("#userCheckPwdErrorDialog").show();
	      }
	    	else{
	    		ok2=true;
	    	}
		 
		if(ok1&&ok2){
			$.ajax({                           	  
				url: '${ctx}/user/updatePwd',       //处理测试页面                 
				type: 'POST',                  
				data: {userPwd:tempUserPwd,oldPwd:tempUserOldPwd},                
				success: function (msg){
	                if (msg == "success"){
	                	window.location.href='${ctx}/page/jumpToMyInfo';
	                  }
	                else if(msg == "oldPwdWrong"){
	                	var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
					    $("#coverbg").css({
					        height: bh,
					        width: bw,
					        display: "block"
					    });
						$("#oldPwdErrorDialog").show();
	                }
					else{
						var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
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
	
	$("#editIdentifySaveBtn").click(function(){
		var tempUserIdentify =  $("#editIdentifyInput").val();
		
		var ok1=false;
		var regIdentify=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
		
		if(tempUserIdentify=="" || (!regIdentify.test(tempUserIdentify))){	
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
        	$("#userIdentifyErrorDialog").show();
		}
       	else{ok1=true;}
		
		if(ok1==true){
			$.ajax({                           	  
				url: '${ctx}/user/updateIdentify',       //处理测试页面                 
				type: 'POST',                  
				data: {userIdentify:tempUserIdentify},                
				success: function (msg){
	                if (msg == "success"){
	                	window.location.href='${ctx}/page/jumpToMyInfo';
	                  }
	                else if(msg == "repeat"){
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
						var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
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
	
	$("#editEmailSaveBtn").click(function(){
		var tempUserEmail =  $("#editEmailInput").val();
		
		var ok1=false;
		var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		
		if(tempUserEmail=="" || (!regEmail.test(tempUserEmail))){	
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
        	$("#userEmailErrorDialog").show();
		}
		else{ok1=true;}
		
		if(ok1==true){
			$.ajax({                           	  
				url: '${ctx}/user/updateEmail',       //处理测试页面                 
				type: 'POST',                  
				data: {userEmail:tempUserEmail},                
				success: function (msg){
	                if (msg == "success"){
	                	window.location.href='${ctx}/page/jumpToMyInfo';
	                  }
					else{
						var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
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
	
	$("#editPhoneSaveBtn").click(function(){
		var tempUserPhone =  $("#editPhoneInput").val();
		
		var ok1=false;
		var regPhone=/^1[3|4|5|7|8]\d{9}$/;
		
		if(tempUserPhone=="" || (!regPhone.test(tempUserPhone))){	
			var bh = $(".wrapper").height();
		    var bw = $(".wrapper").width();
		    $("#coverbg").css({
		        height: bh,
		        width: bw,
		        display: "block"
		    });
        	$("#userPhoneErrorDialog").show();
		}
		else{ok1=true;}
		
		if(ok1==true){
			$.ajax({                           	  
				url: '${ctx}/user/updatePhone',       //处理测试页面                 
				type: 'POST',                  
				data: {userPhone:tempUserPhone},                
				success: function (msg){
	                if (msg == "success"){
	                	window.location.href='${ctx}/page/jumpToMyInfo';
	                  }
					else{
						var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
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
    $("#coverbg,#dialog").hide();
    $("#failDialog").hide();
    $("#repeatDialog").hide();
    $("#userNameErrorDialog").hide();
    $("#userPwdErrorDialog").hide();
    $("#oldPwdErrorDialog").hide();
    $("#userCheckPwdErrorDialog").hide();
    $("#userIdentifyErrorDialog").hide();
    $("#repeatIdentifyDialog").hide();
    $("#userEmailErrorDialog").hide();
    $("#userPhoneErrorDialog").hide();
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
						<ul style="padding:0px;">
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
			<div class="center_area main_info_area">
				<div class="info_left">
					<div class="text_area">
						<p href="#" class="f_list_title">个人中心</p>
						<ul class="f_list">
							<a href="${ctx}/page/jumpToMyInfo">
								<li class="f_list_content_current">
									<span class="glyphicon glyphicon-user list_icon_current"></span>&nbsp;&nbsp;&nbsp;
									<span style="color:white;">个人信息</span>	
								</li>
							</a>
							<a href="${ctx}/page/jumpToMsgInfo">
								<li class="f_list_content">
									<span class="glyphicon glyphicon-envelope list_icon"></span>&nbsp;&nbsp;&nbsp;
									<span class="">消息中心</span>	
								</li>
							</a>
							<a href="${ctx}/page/jumpToMyChart">
								<li class="f_list_content">
									<span class="glyphicon glyphicon-shopping-cart list_icon"></span>&nbsp;&nbsp;&nbsp;
									<span class="">购物车</span>
								</li>
							</a>
							<a href="${ctx}/page/jumpToMyOrder">
								<li class="f_list_content">
									<span class="glyphicon glyphicon-list-alt list_icon"></span>&nbsp;&nbsp;&nbsp;
									<span class="">订单中心</span>	
								</li>
							</a>
						</ul>
					</div>
				</div>
				<div class="info_right">
					<div class="right_title">
						<span class="tit_b"></span>&nbsp;
						<span class="tit_text">个人信息</span>
						<a href="${ctx}/user/logout"><button class="logout_btn"><span style="position:relative;top: -10px;">退出登陆</span></button></a>
					</div>
					<div class="right_content">
						<ul>
							<li>
								<div class="info">
									<p class="info_l">用户名：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;">${userInfo.userName}</span>
									</div>
									<p style="float:left" id="editNameBtn"><span style="color:#00A0D8;cursor: pointer;">修改用户名</p>
								</div>
								<div id="nameEditBox" class="edit_box" style="height:70px">
									<input id="editNameInput" class="input_box" placeholder="请输入您的新用户名">
									<button id="editNameSaveBtn" class="btn">保存</button>
								</div>
							</li>
							<li>
								<div class="info">
									<p class="info_l">密码：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;">${userInfo.userPwd}</span>
									</div>
									<p style="float:left" id="editPwdBtn"><span style="color: #00A0D8;cursor: pointer;">修改密码</p>
								</div>
								<div id="pwdEditBox" class="edit_box" style="height:225px;width:350px;">
									<input id="editOldPwdInput" class="input_box" placeholder="请输入您的原始密码" style="margin:5px 0px 5px 0px;" type="password">
									<input id="editNewInput" class="input_box" placeholder="请输入您的新密码" style="margin:5px 0px 5px 0px;" type="password">
									<input id="editConfirmNewInput" class="input_box" placeholder="请再次输入您的新密码" style="margin:5px 0px 5px 0px;" type="password">
									<p></p>
									<button id="editPwdSaveBtn" class="btn" style="position:relative;left:170px;">保存</button>
								</div>
							</li>
							<li>
								<div class="info">
									<p class="info_l">邮箱：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;">${userInfo.userEmail}</span>
									</div>
									<p style="float:left" id="editEmailBtn"><span style="color: #00A0D8;cursor: pointer;">修改邮箱</p>
								</div>
								<div id="emailEditBox" class="edit_box" style="height:70px">
									<input id="editEmailInput" class="input_box" placeholder="请输入您的新邮箱">
									<button id="editEmailSaveBtn" class="btn">保存</button>
								</div>
							</li>
							<li>
								<div class="info">
									<p class="info_l">手机号码：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;">${userInfo.userPhone}</span>
									</div>
									<p style="float:left" id="editPhoneBtn"><span style="color: #00A0D8;cursor: pointer;">修改手机号</p>
								</div>
								<div id="phoneEditBox" class="edit_box" style="height:70px">
									<input id="editPhoneInput" class="input_box" placeholder="请输入您的新手机号码">
									<button id="editPhoneSaveBtn" class="btn">保存</button>
								</div>
							</li>
							<li>
								<div class="info">
									<p class="info_l">身份证号码：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;" id="userIdentify">${userInfo.userIdentify}</span>
									</div>
									<p  id="submittedMsg" style="float:left;"><span style="color:#aaa;" >如需修改请联系管理员</p>
									<p style="float:left" id="editIdentifyBtn"><span style="color: #00A0D8;cursor: pointer;">提交身份证号（注意：一经提交无法修改）</p>
								</div>
								<div id="identifyEditBox" class="edit_box" style="height:70px">
									<input id="editIdentifyInput" class="input_box" placeholder="请输入您的身份证号码">
									<button id="editIdentifySaveBtn" class="btn">保存</button>
								</div>
							</li>
							<li>
								<div class="info">
									<p class="info_l">信用等级：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;">${userCreditName}</span>
									</div>
									<a href="${ctx}/user/applyUp"><p style="float:left"><span style="color: #00A0D8;cursor: pointer;">申请提高信用等级</p></a>
								</div>
							</li>
							<li>
								<div class="info">
									<p class="info_l">不良记录：</p>
									<div style="float:left;">
										<span style="padding: 0 30px 0 5px;">${userInfo.userBadHistory}</span>条
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer_container" id="aaa">
			<div class="center_area">
				copyright(c) 2016
			</div>
		</div>
	</div>
	
	<!-- jQuery 遮罩层 -->
	<div id="coverbg" class="coverbg"></div>
	
	<!-- 这里存放dialogs -->
	<div id="failDialog" class="dialog">
		<p class="dialog_msg">修改失败请重新尝试</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="repeatDialog" class="dialog">
  		<p class="dialog_msg">用户名重复</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="userNameErrorDialog" class="dialog">
  		<p class="dialog_msg">用户名应在3-32字符之间</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="userPwdErrorDialog" class="dialog">
  		<p class="dialog_msg">密码应在3-32字符之间</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="userCheckPwdErrorDialog" class="dialog">
  		<p class="dialog_msg">确认密码应与新密码一致</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="oldPwdErrorDialog" class="dialog">
  		<p class="dialog_msg">旧密码错误</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<div id="userIdentifyErrorDialog" class="dialog">
  		<p class="dialog_msg">请再次确认身份证填写正确！</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	<div id="repeatIdentifyDialog" class="dialog">
  		<p class="dialog_msg">身份证已被使用</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	<div id="userEmailErrorDialog" class="dialog">
  		<p class="dialog_msg">请确认您的邮箱填写正确</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	<div id="userPhoneErrorDialog" class="dialog">
  		<p class="dialog_msg">请确认您的手机号填写正确</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	
	<!-- 暂存数据用 -->
	
</body>
</html>