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
		overflow: auto;
	}
	
	div.header_container
	{
		width:auto;
		height:150px;
		background-image:url(${ctx}/img/headerBack.jpg);
	}
	
	div.main_container{
		width:100%;
		padding-top:20px;
		padding-bottom:50px;
		margin-bottom:40px;
		overflow:auto;
		position:relative;
		top:-40px;
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
		width:1200px;
			
		margin-left:auto;
    	margin-right:auto;
    	
	}
	
	.header_botton_box{
		float:right;
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
	
	
	.search_btn_box{
		float:left;
	}
	
	.search_btn{
		width:120px;
		height:50px;
		font-size:20px;
		color:#fff;
		font-weight:bold;
		padding:0px 0px 0px 0px;
		border:0;
		margin:0;
		background-color:#3399ff;
		letter-spacing:6px;
		text-align:center;
	}
	
	.search_btn:hover{
		background-color:#007fff;
	}
	
	.new_msg{
		min-width: 16px;
    	height: 16px;
    	line-height: 14px;
    	text-align: center;
    	display:inline-block;
    	background: #ff80aa;
    	color: #fff;
    	border-radius: 3px;
    	
    	position: relative;
    	right: 18px;
    	top: -52px;
    	padding:0 2px 0 2px;
    	border: 1px solid #fff;
    	
    	font-style:normal;
		font-size:9px;
	}
	
	.index_area{
		height:420px;
		width:150px;
		position:absolute;
		top:0px;
		left:0px;
	}
	
	li.index_li{
		line-height:38px;
		height:38px;
		padding-left:45px;
		text-align:left;
		width:100%;
		border-bottom: 1px solid #fff;
		background-color:#4f90fb;
	}
	
	li.index_li:hover{
		background-color:#69a1fc;
	}
	
	span.index_title{
		font-size:15px;
		color:#fff;
	}

	.center_area{
		width:1000px;
		margin-left:auto;
		margin-right:auto;
	}
	.goods_top_area{
		height:400px;
		position:relative;
		background-color:#fff;
		border:1px solid #ddd;
		border-radius:5px;
	}
	
	.goods_down_area{
		margin:30px 0px 30px 0px;
		min-height:400px;
		max-height:700px;
		overflow:auto;
		background-color:#fff;
		border:1px solid #ddd;
		border-radius:5px;
	}
	
	.picture_area{
		width:400px;
		position:absolute;
	}
	
	.basic_info_area{
		width:600px;
		position:absolute;
		left:400px;
		border-left:1px solid #ccc;
	}
	
	.picture_box{
		width:350px;
		height:350px;
		margin:25px 25px 25px 25px;
		
	}
	
	.describe_content{
		margin:20px 30px 30px 30px;
		line-height:300%;
		overflow:auto;
	}
	
	.describe_title{
		padding-left: 30px;
		font-size: 20px;
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
	    height:20px;
	    margin-top:16px;
	    background-color:#00a1d6;
	    border-radius:4px;
		float: left;
	}
	
	.tit_text{
		color:#00a1d6;
		margin:30px 0 0 5px;
	    font-size:18px;
	    cursor:default;
	}
	
	.info_box{
		margin:0px;
		
	}
	
	.goods_name{
		font-size:20px;
		font-weight:800;	
	}
	
	
	.price_box,.tag_box,.stage_box,.perMonth_box,.input_area{
		padding-left:20px;
		font-size:16px;
	}
	
	.price_box{
		height:60px;
		line-height:60px;
		background-color:#f6f6f6;
		vertical-align:middle;
		color:#4f90fb;
		font-weight:500;
		margin:20px;
	}
	
	.tag_box,.stage_box,.perMonth_box,.input_area{
		height:40px;
		line-height:40px;
		margin:10px 20px 10px 20px;
	}

	.mark{
		position:relative;
		top:3px;
		font-size:12px;
		font-weight:800;
		background-color:#f6f6f6;
	}
	
	.current_price,.current_per_month{
		font-size:22px;
		font-weight:800;
	}
	
	.current_per_month{
		color:#4f90fb;
	}
	
	.tagLi,.stageLi{
		line-height:20px;
		padding:5px 10px 5px 10px;
		font-size:16px;
		border:1px solid #666;
		margin-left:10px;
		margin-right:10px;
	}
	
	.tagLi2,.stageLi2{
		line-height:20px;
		padding:5px 10px 5px 10px;
		font-size:16px;
		border:2px solid #4f90fb;
		margin-left:10px;
		margin-right:10px;
	}
	
 	.btn{
		  padding:0;
		  height:25px;
		  width:70px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:14px;
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
	
	.btn_cancel{
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
		
	.btn_cancel:hover{
		color:#ff6384;
	}
	
	.buyBtn{
		  padding:0;
		  margin-left:30px;
		  margin-right:30px;
		  height:50px;
		  width:180px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:20px;
		  font-weight:500;
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
		  
		  position:absolute;right:50px;bottom:80px;
		}
		
	.buyBtn:hover{
		background-color:#9bc0fd;
	}
	
	.goodsNum{
		height:30px;
		width:60px;
		text-align:center;
		line-height: 30px;
	}
	
	.l_title{
		color:#666;
		position: relative;
		top: 5px;
		font-weight:400;
	}
	
	.storage_span{
		font-size:12px;
		color:#666;
		position: relative;
		top: 5px;
	}
	
	.num_icons{
		background-color:#f2f2f2;
		font-size:16px;
		color:#aaa;
		
	}
	
	.tagPrice,.tagStorage{
		display:none;
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
		font-size:16px;
		margin-top:30px;
	}
</style>

<script type="text/javascript">

$(function(){
	$("#goodsNum").val(Number(1));
	
	//初始化
	var tagPrice=$("#current_price").html();
	tagPrice = Number(tagPrice).toFixed(2);
	$("#current_price").html(tagPrice);
	$("#current_per_month").html(tagPrice);
	
	var tagStorage=$("#current_storage").html;
	var stage=Number(1);
	var onePerMonth = (Number(tagPrice))/(Number(stage));
	var charge =Number(0);
	$("#pm").html(onePerMonth);
	
	//选项初始都选择第一个
	$(".tagLi :first").css("border","2px solid #4f90fb");
	$(".stageLi :first").css("border","2px solid #4f90fb");
	var tag=$(".tagLi :first").children(":eq(2)").html();
	
	$(".tagLi").click(function(){
		$(".tagLi").css("border","1px solid #666");
		$(this).css("border","2px solid #4f90fb");
		tagPrice = $(this).children(":eq(0)").html();
		tagPrice = Number(tagPrice).toFixed(2);
		tagStorage = $(this).children(":eq(1)").html();
		tag = $(this).children(":eq(2)").html();
		$("#current_price").html(tagPrice);
		$("#current_storage").html(tagStorage);
		var quantity = $("#goodsNum").val();
		onePerMonth = (Number(tagPrice))/(Number(stage));
		var perMonth = Number(quantity)*Number(tagPrice)/Number(stage);
		$("#pm").html(onePerMonth);
		perMonth  = Number(perMonth).toFixed(2);
		$("#current_per_month").html(perMonth);
	});
	
	$(".stageLi").click(function(){
		$(".stageLi").css("border","1px solid #666");
		$(this).css("border","2px solid #4f90fb");
		stage = $(this).children(":first").html();
		
		if(stage == "1"){
			charge = $("#chargeList").find(":eq(0)").html();
		}
		else if(stage == "3"){
			charge = $("#chargeList").find(":eq(1)").html();
		}
		else if(stage == "6"){
			charge = $("#chargeList").find(":eq(2)").html();
		}
		else if(stage == "9"){
			charge = $("#chargeList").find(":eq(3)").html();
		}
		else if(stage == "12"){
			charge = $("#chargeList").find(":eq(4)").html();
		}
		else if(stage == "18"){
			charge = $("#chargeList").find(":eq(5)").html();
		}
		else if(stage == "24"){
			charge = $("#chargeList").find(":eq(6)").html();
		}
		else if(stage == "36"){
			charge = $("#chargeList").find(":eq(7)").html();
		}
		
		var quantity = $("#goodsNum").val();
		onePerMonth = (Number(tagPrice))/(Number(stage))*((Number(charge)/100)+1);
		var perMonth = (Number(quantity)*Number(tagPrice)/Number(stage))*((Number(charge)/100)+1);
		$("#pm").html(onePerMonth);
		perMonth  = Number(perMonth).toFixed(2);
		$("#current_per_month").html(perMonth);
	});
	
	$("#addCart").click(function(){
		var goodsID= $("#goodsID").html();
		var currentNum = $("#goodsNum").val();
		$.ajax({                           	  
			url: '${ctx}/order/addCart',       //处理测试页面                 
			type: 'POST',                  
			data: {goodsID:goodsID,quantity:currentNum,tag:tag,stageID:stage},                
			success: function (msg){
				if(msg=="unlogged"){
					var bh = $(".wrapper").height();
				    var bw = $(".wrapper").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
                	$("#unloggedDialog").show();
				}
				else if(msg=="lock"){
					var bh = $(".wrapper").height();
				    var bw = $(".wrapper").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
                	$("#lockDialog").show();
				}
				else if(msg=="success"){
					var bh = $(".wrapper").height();
				    var bw = $(".wrapper").width();
				    $("#coverbg").css({
				        height: bh,
				        width: bw,
				        display: "block"
				    });
                	$("#successDialog").show();
				}
			}
		});
	});
});

function plus(){
	var currentNum = $("#goodsNum").val();
	currentNum = Number(currentNum)+Number(1);
	 $("#goodsNum").val(currentNum);
	 var perMonth = Number(currentNum)*Number($("#pm").html());
	 perMonth  = Number(perMonth).toFixed(2);
	 $("#current_per_month").html(perMonth);
}
function minus(){
	var currentNum = $("#goodsNum").val();
	if(currentNum==1){$("#goodsNum").val(currentNum);}
	else{currentNum = Number(currentNum)-Number(1);
	 $("#goodsNum").val(currentNum);
	 var perMonth = Number(currentNum)*Number($("#pm").html());
	 perMonth  = Number(perMonth).toFixed(2);
	 $("#current_per_month").html(perMonth); 
	}
}

function checkIsNum(){
	var currentNum = $("#goodsNum").val();
	
	var reg=/^[1-9]\d*|0$/;
	if(!reg.test(currentNum)){
		$("#goodsNum").val(Number(1));
		currentNum =Number(1);
	}
	 var perMonth = Number(currentNum)*Number($("#pm").html());
	 perMonth  = Number(perMonth).toFixed(2);
	 $("#current_per_month").html(perMonth);
}
//关闭灰色 jQuery 遮罩
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
					<div class="header_botton_box">
						<ul>
							<%if(session.getAttribute("userName") == null){%>
							<li>
								<a href="${ctx}/page/jumpToLogin" class="header_btn2" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:18px;">登陆</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToSignin" class="header_btn2">
	  								<p style="font-size:18px;">注册</p>
								</a>
							</li>
							<%}else{%>	
							<li>
								<a href="${ctx}/page/jumpToMyInfo" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<span class="glyphicon glyphicon-user header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;个人中心</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToMsgInfo" class="header_btn">
	  								<span class="glyphicon glyphicon-envelope header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;我的消息</p>
	  								<em class="new_msg" id="msgNum">${msgNum}</em>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToMyChart" class="header_btn">
	  								<span class="glyphicon glyphicon-shopping-cart header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;购物车</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToMyOrder" class="header_btn">
	  								<span class="glyphicon glyphicon-list-alt header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;我的订单</p>
								</a>
							</li>
							<%}%>
						</ul>
					</div>
				</div>
			</div>
			<div class="header_under">
				<div class="header_under_center">
					<div class="header_logo_box">
						<a href="${ctx}/page/jumpToHomePage">
							<img class="header_logo" src="${ctx}/img/logo.png">
						</a>
					</div>
					<div class="header_search_box">
						<form action="${ctx}/goods/searchAll" method="post">
							<input class="header_search" type="text" name="searchContent" id="searchContent" placeholder="输入关键字">
							<input class="search_btn" type="submit" id="search_btn" value="搜索">
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container" style="overflow:auto;background-color:#f2f2f2;">
			<div class="center_area">
				<div><p>
					<a href="${ctx}/page/jumpToHomePage">首页</a>>
					<c:choose>
						<c:when test="${goodsPack.goodsClass == '手机通讯'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=1">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '电脑平板'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=2">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '腕表饰品'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=3">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '数码家电'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=4">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '家居家饰'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=5">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '家装建材'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=6">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '食品饮料'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=7">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '衣装服饰'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=8">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '鞋靴箱包'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=9">${goodsPack.goodsClass}</a>
						</c:when>
						<c:when test="${goodsPack.goodsClass == '图书百货'}">
					 		<a href="${ctx}/goods/searchByClass?searchContent=10">${goodsPack.goodsClass}</a>
						</c:when>
					</c:choose>
					 
				</p></div>
				<div class="goods_top_area">
					<div class="picture_area">
						<div class="picture_box">
							<img src="${ctx}/goods/readPicture?pictureID=${goodsPack.goodsPictureID}" style="height:350px;" alt="img"/>
						</div>
					</div>
					
					<div class="basic_info_area">
						<div class="info_box">
							<p style="margin:25px 20px 20px 30px;"><span class="goods_name">${goodsPack.goodsName}</span></p>
							<div class="price_box">
								<span>现&nbsp;&nbsp;&nbsp;&nbsp;价：</span>
								<span class="mark">￥</span>
								<span id="current_price" class="current_price">${defaultPrice}</span>
							</div>
							<div class="tag_box"> 
								<dl>
									<dt style="text-align: left;float: left;width: 66px;"><span class="l_title">类&nbsp;&nbsp;型：</span></dt>
									<dd><ul>
									<c:forEach items="${goodsPack.goodsTag}" var="tags">
										<a href="#">
											<li class="tagLi">
											<span class="tagPrice">${tags.price}</span>
											<span class="tagStorage">${tags.storage}</span>
											<span>${tags.tag}</span>
											</li></a>
									</c:forEach>
									</ul></dd>
								</dl>
							</div>
							<div class="stage_box"> 
								<dl>
								<dt style="text-align: left;float: left;width: 66px;"><span class="l_title">分&nbsp;&nbsp;期：</span></dt>
								
								<dd><ul>
									<c:forEach items="${goodsPack.goodsStage}" var="stage">
										<a href="#"><li class="stageLi"><span>${stage}</span><span>期</span></li></a>
									</c:forEach></ul></dd>
								</dl>
							</div>
							<div class="perMonth_box">
								<dl>
								<dt style="text-align: left;float: left;width: 66px;"><span class="l_title">月&nbsp;&nbsp;供：</span></dt>
									
								<dd>
									<span class="mark" style="background-color:#fff;color:#4f90fb">￥</span>
									<span id="current_per_month" class="current_per_month">${defaultPerMonth}</span>
								</dd>
								</dl>
							</div>
							<div class="input_area" style="height:50px;">
								<span class="l_title" style="margin-right:10px;">数&nbsp;&nbsp;量：</span>
								<img  onclick="minus()" src="${ctx}/img/minus.jpg" style="position: relative;left: 4.3px;top: -1.6px;">
								<input class="goodsNum" type="text" id="goodsNum" onchange="checkIsNum()">
								<img onclick="plus()" src="${ctx}/img/plus.jpg" style="position: relative;left:-4.7px;top: -1.6px;">
								<span class="storage_span" style="margin-left:10px;">库&nbsp;存：</span>
								<span id="current_storage" class="storage_span">${defaultStorage}</span>
							</div>
							<button id="addCart" class="buyBtn" style=""><span class="glyphicon glyphicon-shopping-cart" style="color:#fff"></span>&nbsp;加入购物车</button>
						</div>
					</div>
				</div>
				<div class="goods_down_area">
					<div class="describe_title">
						<span class="tit_b"></span>&nbsp;
						<span class="tit_text">详细信息</span>
					</div>
					<div  class="describe_content">
						${goodsPack.goodsDescribe}
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
	<div id="unloggedDialog" class="dialog">
		<p class="dialog_msg">请先登陆</p>
		<a href="${ctx}/page/jumpToLogin"><button class="btn" style="width:120px;height:35px;font-size:18px;position:relative;left:27.5px;">前往登陆</button></a>
  		<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:30px;height:30px;font-size:14px;color:#aaa;position:relative;left:110px;top:-60px">x</button></a>
	</div>
	
	<div id="lockDialog" class="dialog">
		<p class="dialog_msg">您未进行实名认证，不能分期付款</p>
		<a href="${ctx}/page/jumpToMyInfo"><button class="btn" style="width:120px;height:35px;font-size:18px;position:relative;left:27.5px;">前往提交</button></a>
  		<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:30px;height:30px;font-size:14px;color:#aaa;position:relative;left:110px;top:-60px">x</button></a>
	</div>
	
	<div id="successDialog" class="dialog">
		<p class="dialog_msg">添加成功</p>
		<a href="${ctx}/page/jumpToHomePage"><button class="btn" style="width:120px;height:35px;font-size:18px;position:relative;left:27.5px;">返回首页</button></a>
  		<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:30px;height:30px;font-size:14px;color:#aaa;position:relative;left:110px;top:-60px">x</button></a>
	</div>
	
	<!-- 暂存数据用 -->
	<p id="goodsID" style="display:none">${goodsPack.goodsID}</p>
	<p id="pm" style="display:none"></p>
	<div id="chargeList" style="display:none">
		<c:forEach items="${chargeList}" var="charge">
		<p>${charge}</p>
		</c:forEach>
	</div>
</body>
</html>