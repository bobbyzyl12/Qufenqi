<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	html,body
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	div{
		margin: 0;
		padding: 0;
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
		width:760px;
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
		  height:40px;
		  width:140px;
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
		
	.btn:hover{
		background-color:#9bc0fd;
		color:#fff;
	}
	table {
		overflow:hidden;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:100%;
		-moz-border-radius:5px; /* FF1+ */
		-webkit-border-radius:5px; /* Saf3-4 */
		border-radius:5px;
		-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		table-layout:fixed;
	}
	
	th, td {padding:5px 10px 5px; text-align:center; }
	
	th {padding-top:8px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
	
	td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
	
	tr.odd-row td {background:#f6f6f6;}
	
	td.first, th.first {text-align:left}
	
	td.last {border-right:none;}
	
	/*
	Background gradients are completely unnecessary but a neat effect.
	*/
	
	td {
		background: -moz-linear-gradient(100% 25% 90deg, #fefefe, #f9f9f9);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f9f9f9), to(#fefefe));
	}
	
	tr.odd-row td {
		background: -moz-linear-gradient(100% 25% 90deg, #f6f6f6, #f1f1f1);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f1f1f1), to(#f6f6f6));
	}
	
	th {
		background: -moz-linear-gradient(100% 20% 90deg, #e8eaeb, #ededed);
		background: -webkit-gradient(linear, 0% 0%, 0% 20%, from(#ededed), to(#e8eaeb));
	}
	
	/*
	I know this is annoying, but we need additional styling so webkit will recognize rounded corners on background elements.
	Nice write up of this issue: http://www.onenaught.com/posts/266/css-inner-elements-breaking-border-radius
	
	And, since we've applied the background colors to td/th element because of IE, Gecko browsers also need it.
	*/
	
	tr:first-child th.first {
		-moz-border-radius-topleft:5px;
		-webkit-border-top-left-radius:5px; /* Saf3-4 */
	}
	
	tr:first-child th.last {
		-moz-border-radius-topright:5px;
		-webkit-border-top-right-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.first {
		-moz-border-radius-bottomleft:5px;
		-webkit-border-bottom-left-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.last {
		-moz-border-radius-bottomright:5px;
		-webkit-border-bottom-right-radius:5px; /* Saf3-4 */
	}
	
	.progress_bar .pro-bar {
		background: hsl(0, 0%, 97%);
		box-shadow: 0 1px 2px hsla(0, 0%, 0%, 0.1) inset;
		height:4px;
		margin-bottom: 12px;
		margin-top: 50px;
		position: relative;
	}
	.progress_bar .progress_bar_title{
		color: #000;
		font-size: 14px;
		font-weight: 300;
		position: relative;
		top: -28px;
		z-index: 1;
	}
	.progress_bar .progress_number{
		float: right;
		margin-top: -24px;
	}
	.progress_bar .progress-bar-inner {
		background-color: hsl(0, 0%, 88%);
		display: block;
		width: 0;
		height: 100%;
		position: absolute;
		top: 0;
		left: 0;
		transition: width 1s linear 0s;
		animation: animate-positive 2s;
	}
	.progress_bar .progress-bar-inner:before {
		content: "";
		background-color: hsl(0, 0%, 100%);
		border-radius: 50%;
		width: 4px;
		height: 4px;
		position: absolute;
		right: 1px;
		top: 0;
		z-index: 1;
	}
	.progress_bar .progress-bar-inner:after {
		content: "";
		width: 14px;
		height: 14px;
		background-color: inherit;
		border-radius: 50%;
		position: absolute;
		right: -4px;
		top: -5px;
	}
	@-webkit-keyframes animate-positive{
		0% { width: 0%; }
	}
	@keyframes animate-positive{
		0% { width: 0%; }
	}
	
	.i_title{
		margin-right:20px;
	}
	
	.i_title_s{
		margin-right:10px;
	}
	
	.count_area{
		margin:30px 10px 10px 10px;
		padding-top:30px;
		padding-left:30px;
		border: 2px solid #4f90fb;
		border-radius:10px;
		height:230px;
		text-align:right;
		padding-right:30px;
	}
	
	.btn_cancel{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:120px;
		  color:#666;
		  background-color:#fff;
		  font-size:16px;
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
		
	.btn_cancel:hover{
		color:#ff6384;
	}
	
	.bottom_title{
		margin-right:50px;
	}
</style>

<script type="text/javascript">

$(function(){
	var charge = $("#charge").html();
	$("#confirmRecieveBtn").hide();
	$("#payBtn").hide();
	var totalStageNum = $("#totalStageNum").html();
	var doneStageNum = $("#doneStageNum").html();
	
	var totalPrice = Number(0);
	var pri = $("#nextStagePrice").html();
	pri= Number(pri).toFixed(2);
	$("#nextStagePrice").html(pri);
	//初始化
	$(".price").each(function(){
		var price = $(this).html();
		price = Number(price).toFixed(2);
		$(this).html(price);
		var quantity = $(this).parent().prev().html();
		var temp = Number(quantity)*Number(price)*(Number(charge)/Number(100)+Number(1));
		temp =Number(temp).toFixed(2);
		totalPrice =Number(temp)+Number(totalPrice);
		$(this).parent().next().find(".l_price").html(temp);
	});
	
	var state = $("#state").html();
	if(state=="1"||state=="3"||state=="8"){
		$("#payBtn").show();
	}
	
	if(state=="5"){
		$("#confirmRecieveBtn").show();
	}
	
	totalPrice= Number(totalPrice).toFixed(2);
	$("#totalPrice").html('￥'+totalPrice);
	if(state=="7"){
		var percent=Number(1);
	}
	else{
		var percent = Number($("#doneStageNum").html())/Number($("#totalStageNum").html());
	}	
	//计算已经支付的金额
	var donePrice =Number(percent) * Number(totalPrice);
	donePrice= Number(donePrice).toFixed(2);
	$("#donePrice").html('￥'+donePrice);
	
	var leftPrice = Number(totalPrice)-Number(donePrice);
	leftPrice= Number(leftPrice).toFixed(2);
	$("#leftPrice").html('￥'+leftPrice);
	
	//设置进入条长度
	var a =(Number(percent)*100)+"%";
	alert(a);
	$("#progress_bar").css("width",a);
	
	$("#bar_msg").hide();
	
	$(".progress_bar").mouseover(function(){ $("#bar_msg").show();});
	$(".progress_bar").mouseout(function(){$("#bar_msg").hide();});
	$("#bar_msg").mouseover(function(){$("#bar_msg").show();});
	$("#bar_msg").mouseout(function(){$("#bar_msg").hide(); });
	
});

function closeBg() {
    $("#coverbg").hide();
    $(".dialog").hide();
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
								<li class="f_list_content">
									<span class="glyphicon glyphicon-envelope list_icon"></span>&nbsp;&nbsp;&nbsp;
									<span>消息中心</span>
								</li>
							</a>
							<a href="${ctx}/page/jumpToMyChart">
								<li class="f_list_content">
									<span class="glyphicon glyphicon-shopping-cart list_icon"></span>&nbsp;&nbsp;&nbsp;
									<span>购物车</span>
								</li>
							</a>
							<a href="${ctx}/page/jumpToMyOrder">
								<li class="f_list_content_current">
									<span class="glyphicon glyphicon-list-alt list_icon_current"></span>&nbsp;&nbsp;&nbsp;
									<span style="color:white;">订单中心</span>
								</li>
							</a>
						</ul>
					</div>
				</div>
				<div class="info_right">
					<div class="right_title">
						<span class="tit_b"></span>&nbsp;
						<span class="tit_text">订单中心</span>
					</div>
					<div class="right_content">
						<div style="height:150px;margin:10px;position:relative;">
							<p><span class="i_title">订单编号:</span>${order.orderID}</p>
							<p><span class="i_title">订单状态:</span>
								<c:choose>
    									<c:when test="${order.state == '1'}">
						       				<span style="color:#00b300;font-weight:600;">等待支付</span>
						   				</c:when>
						    			<c:when test="${order.state=='2'}">
						       				<span style="color:#aaa;font-weight:600;">已冻结</span>
						   				</c:when>
						    			<c:when test="${order.state=='3'}">
						       				<span style="color:#00b386;font-weight:600;">等待首次支付</span>
						   				</c:when>
						   				<c:when test="${order.state=='4'}">
						       				<span style="color:#e5e600;font-weight:600;">待发货</span>
						   				</c:when>
						   				<c:when test="${order.state=='5'}">
						       				<span style="color:#c6ff1a;font-weight:600;">已发货</span>
						   				</c:when>
						   				<c:when test="${order.state=='6'}">
						       				<span style="color:#FF9C9E;font-weight:600;">等待人工审核</span>
						   				</c:when>
						   				<c:when test="${order.state=='7'}">
						       				<span style="color: #4db8ff;font-weight:600;">支付完成</span>
						   				</c:when>
						   				<c:when test="${order.state=='8'}">
						       				<span style="color: #red;font-weight:600;">已逾期</span>
						   				</c:when>
   								</c:choose>
							</p>
							<p><span class="i_title">订单支付进度:</span></p>
							<div style="width:400px;float:left;position:relative;top:-70px;left:120px;">
								<div class="progress_bar">
									<div class="pro-bar" style="font-size:12px;">
										<small class="progress_bar_title">
										<c:choose>
											<c:when test="${order.state=='7'}">
												<span class="progress_number" style="font-size:10px;">${basicInfo.nextNo} 期/${basicInfo.totalStageNum} 期</span>
											</c:when>
											<c:otherwise>
												<span class="progress_number" style="font-size:10px;">${basicInfo.nextNo-1} 期/${basicInfo.totalStageNum} 期</span>
											</c:otherwise>
										</c:choose>
										</small>
										<span id="progress_bar" class="progress-bar-inner" style="background-color: #4f90fb; width:95%;" data-value="95" data-percentage-value="95"></span>
									</div>
								</div>
							</div>
							<div style="position:relative;left:-400px;position:relative;">
								<p><span class="i_title">收件人:</span>${order.reciever}
									<span class="i_title" style="position:absolute;right:50px;">收件地址:${order.address}</span><span class="i_title" style="position:absolute;right:0px;"></span>
									<span class="i_title" style="position:absolute;right:-220px;">联系电话:${order.phone}</span>
								</p>
							</div>
							<div style="height:140px;width:180px;padding:0px 10px 10px 10px;background-color:#fff;border:2px solid #4f90fb;border-radius:5px;;position:relative;top:-130px;left:550px;" id="bar_msg">
								<p><span class="i_title_s">原始总价：</span><span id="totalPrice" style="position:absolute;right:15px;"></span></p>
								<p><span class="i_title_s">已支付：</span><span id="donePrice" style="position:absolute;right:15px;"></span></p>
								<p><span class="i_title_s">未支付：</span><span id="leftPrice" style="position:absolute;right:15px;"></span></p>
							</div>
						</div>
						<div style="margin:0px 10px 0px 10px;max-height:1000px;overflow：auto;">
							<table>
							<tr>
								<th width=100px>图片与名称</th>
								<th width=100px>类型</th>
								<th width=80px>数量</th>
								<th width=80px>原始单价</th>
								<th width=80px>小计<br><span style="font-size:8px;">（包含手续费）</span></th>
							</tr>
							<c:forEach items="${goodsList}" var="goods">
							 	<tr>
							 		<td style="padding-top:10px;">
							 		<a href="${ctx}/goods/goodsDetail?goodsID=${goods.goodsID}">
							 			<img src="${ctx}/goods/readPicture?pictureID=${goods.goodsPictureID}" style="height:80px;margin-top:5px;" alt="img"/>
							 			</a>
							 			<p style="margin:10px 0px 0px 0px;">${goods.goodsName}</p>
							 		</td>
							 		<td>${goods.tag.tag}</td>
							 		<td>${goods.quantity}</td>
							 		<td><span style="font-size:8px">￥</span><span class="price">${goods.tag.price}</span></td>
							 		<td>￥<span class="l_price"></span></td>
							 	</tr>	
							 </c:forEach>
							 </table>
						</div>
						<div class="count_area">
							<div style="position:relative;height:120px;padding-right:30px;">
								<p  style="font-size:14px">本期为第
									<span style="color:#4d79ff;font-weight:bold;font-size:18px;">${basicInfo.nextNo}</span>
									期
									<span style="font-size:12px;">（共</span>
									<span style="font-size:15px;color:#4d79ff;font-weight:bold;">${basicInfo.totalStageNum}</span>
									<span style="font-size:12px;">期）</span>
								</p>
								<p><span  class="bottom_title" style="font-size:14px;font-weight:100;">无利率支付截止时间:</span>
									<span style="font-size:16px;font-weight:100;"><fmt:formatDate value="${basicInfo.deadline}" pattern="yyyy-MM-dd"/></span>
								<p>
								<p>
									<span class="bottom_title" style="font-size:18px;font-weight:500;">本期支付:</span>
									<span style="font-size:16px;font-weight:600;color:#4f90fb"">￥</span><span id="nextStagePrice" style="font-size:22px;font-weight:700;color:#4f90fb">${basicInfo.nextStagePrice}</span>
								<p>
								
								
							</div>
							<div style="position:relative;height:70px;padding-top:20px;border-top:1.5px dashed #4f90fb;">
								<a href="${ctx}/page/jumpToMyOrder"><button class="btn_cancel" id="submitBtn" style="position:absolute;left:30px;">返回</button></a>	
								<a href="${ctx}/order/confirmRecieve"><button class="btn" id="confirmRecieveBtn">确认收货</button></a>
								<a href="${ctx}/order/payOrder?orderID=${basicInfo.orderID}&stageNo=${basicInfo.nextNo}"><button class="btn" id="payBtn">支付本期</button></a>
							</div>
							
						</div>
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
	<p style="display:none" id="doneStageNum">${basicInfo.nextNo-1}</p>
	<p style="display:none" id="totalStageNum">${basicInfo.totalStageNum}</p>
	<p style="display:none" id="charge">${charge}</p>
	<p style="display:none" id="state">${order.state}</p>
</body>
</html>