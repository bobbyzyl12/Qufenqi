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
		width:750px;
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
	
	.msg_box{
		margin-left:30px;
		margin-right:auto;
		margin-bottom:30px;
		min-height:50px;
		width:700px;
		border: 1px solid #e1e2e5;
    	box-shadow: 0 1px 3px rgba(0,0,0,.14);
    	border-radius:5px;
	}
	
	.msg_title{
		height:50px;
		width:100%;
		border-bottom:1px solid #e1e2e5;
		padding-left:30px;
		padding-right:30px;
		line-height:50px;
		font-size:16px;
		position:relative;
	}
	
	.msg_content{
		padding:15px 30px 15px 30px;
		min-height:100px;
		display:none;
	}
	
	
</style>

<script type="text/javascript">

$(function(){
	$(".msg_icon").click(function(){
		var msgID = $(this).attr('title');
		$(this).closest('.msg_title').next('.msg_content').slideToggle("slow");
		$.ajax({ 
			url: '${ctx}/user/readMsg',       //处理测试页面                 
			type: 'POST',                  
			data: {msgID:msgID},                
			success: function (msg){
            if (msg == "success"){}
            else{alert("error");}
			}
		});
		
	})
});

//关闭灰色 jQuery 遮罩
function closeBg() {
    $("#coverbg,#dialog").hide();
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
								<li class="f_list_content">
									<span class="glyphicon glyphicon-user list_icon"></span>&nbsp;&nbsp;&nbsp;
									<span>个人信息</span>	
								</li>
							</a>
							<a href="${ctx}/page/jumpToMsgInfo">
								<li class="f_list_content_current">
									<span class="glyphicon glyphicon-envelope list_icon_current"></span>&nbsp;&nbsp;&nbsp;
									<span style="color:white;">消息中心</span>
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
						<span class="tit_text">消息中心</span>
					</div>
					<div class="right_content">
						 <c:forEach items="${msgList}" var="msg">
						<div class="msg_box">
								<div class="msg_title">
									<c:choose>
    									<c:when test="${msg.msgState == '1'}">
       										<span style="color:#4f90fb;">[未读]</span>
   										</c:when>
   										<c:when test="${msg.msgState == '2'}">
       										<span style="color:#aaa;">[已读]</span>
   										</c:when>
   									</c:choose>
									<span style="font-weight:bold;">${msg.msgTitle}</span>
									<a href="#" class="msg_icon" title="${msg.msgID}"><span class="glyphicon glyphicon-chevron-down" style="position:absolute;right:40px;top:20px;font-size:14px;color:#999"></span></a>
								</div>
								<div class="msg_content">
									${msg.msgContent}
								</div>
							</div>
						</c:forEach>
						
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
	<div id="dialog" class="dialog">
	</div>
	
	<!-- 暂存数据用 -->
	
</body>
</html>