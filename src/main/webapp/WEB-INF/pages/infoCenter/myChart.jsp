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
		
		height:300px;
		width:400px;
		background-color: #FFF;
		border: 1px solid #888;
		
		position: absolute !important; /* 浮动对话框 */
		top: 20%;
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
		  width:150px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:20px;
		  font-weight:600;
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
	
	input.msg_input{
		width:300px;
		height:30px;
		font-size:15px;
		margin-bottom:5px;
		padding-left:20px;
		border: 1px solid #ddd;
    	border-radius: 2px;
    	color: #aaa;
    	font-size: 14px;
		outline:none;
		text-align:left;
		margin:10px;
	}
	
	input.msg_input：hover,input.msg_input:focus{
		border: 1px solid #4f90fb;
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
	
	
	.count_area{
		margin-top:10px;
		padding-top:30px;
		padding-left:30px;
		border:1px soild #aaa;
		height:200px;
		text-align:right;
		padding-right:30px;
	}
	
	.goodsNum{
		width:40px;
		height:25px;
		text-align:center;
	}
	
	.deleteGoodsInCart{
		font-size:10px;
		margin:0px;
	}
	
	.deleteGoodsInCart:hover{
		color:#ff6384;
	}
	
</style>

<script type="text/javascript">

$(function(){
	//初始化：包括各类价格的格式，一些数量
	var totalPrice = Number(0);
	var maxMonth=Number(0);
	$(".success_msg").hide();
	$(".perPrice").each(function(){
		var eachPrice = $(this).html();
		eachPrice = Number(eachPrice).toFixed(2);
		$(this).html(eachPrice);
	});
	
	$(".eachTotoalPrice").each(function(){
		var eachPrice = $(this).html();
		eachPrice = Number(eachPrice).toFixed(2);
		$(this).attr("title",eachPrice);
		var quantity = $(this).prevAll(':eq(2)').find(".goodsNum").val();
		var finalPrice =Number(eachPrice)*Number(quantity);
		finalPrice = Number(finalPrice).toFixed(2);
		maxMonth = maxMonth+(finalPrice/($(this).prevAll(':eq(1)').find(":first").html()));
		$(this).html(finalPrice);
		totalPrice = Number(totalPrice)+Number(finalPrice);
	});
	
	//设置总价
	totalPrice= Number( totalPrice).toFixed(2);
	maxMonth =  Number(maxMonth).toFixed(2);
	$("#totalPrice").html( totalPrice);
	$("#maxPer").html(maxMonth);
	
	$(".deleteGoodsInCart").click(function(){
		var goodsID = $(this).closest("tr").attr("title");
		var tag = $(this).parent().prev().html();
		var stageID = $(this).parent().next().find(".stages").html();
		$.ajax({                           	  
			url: '${ctx}/order/deleteCartByAll',       //处理测试页面                 
			type: 'POST',                  
			data: {goodsID:goodsID,tag:tag,stageID:stageID},                
			success: function (msg){
				if(msg=="success"){
					window.location.href='${ctx}/page/jumpToMyChart';
				}
			}
		});
	});
	
	$(".minusQuantity").click(function(){
		var currentNum = $(this).next().val();
		if(currentNum==1){}
		else{currentNum = Number(currentNum)-Number(1);
			$(this).next().val(currentNum);
			var goodsID = $(this).closest("tr").attr("title");
			var tag = $(this).parent().prev().html();
			var stageID = $(this).parent().next().find(".stages").html();
			$(this).closest("td").find(".success_msg").show();
			$(this).closest("td").find(".success_msg").delay(400).hide(0);
			$.ajax({                           	  
				url: '${ctx}/order/updateCart',       //处理测试页面                 
				type: 'POST',                  
				data: {goodsID:goodsID,tag:tag,quantity:currentNum,stageID:stageID},                
				success: function (msg){
					if(msg=="success"){
						totalPrice = Number(0);
						maxMonth=Number(0);
						$(".eachTotoalPrice").each(function(){
							var eachPrice = $(this).html();
							eachPrice = $(this).attr("title");
							eachPrice = Number(eachPrice).toFixed(2);
							var quantity = $(this).prevAll(':eq(2)').find(".goodsNum").val();
							var finalPrice =Number(eachPrice)*Number(quantity);
							finalPrice = Number(finalPrice).toFixed(2);
							$(this).html(finalPrice);
							maxMonth = maxMonth+(finalPrice/($(this).prevAll(':eq(1)').find(":first").html()));
							totalPrice = Number(totalPrice)+Number(finalPrice);
						});
						totalPrice= Number( totalPrice).toFixed(2);
						maxMonth =  Number(maxMonth).toFixed(2);
						$("#totalPrice").html( totalPrice);
						$("#maxPer").html(maxMonth);
					}
				}
			});
		}
	});
	
	$(".plusQuantity").click(function(){
		var currentNum = $(this).prev().val();
		currentNum = Number(currentNum)+Number(1);
		$(this).prev().val(currentNum);
		var goodsID = $(this).closest("tr").attr("title");
		var tag = $(this).parent().prev().html();
		var stageID = $(this).parent().next().find(".stages").html();
		$(this).closest("td").find(".success_msg").show();
		$(this).closest("td").find(".success_msg").delay(400).hide(0);
		$.ajax({                           	  
			url: '${ctx}/order/updateCart',       //处理测试页面                 
			type: 'POST',                  
			data: {goodsID:goodsID,tag:tag,quantity:currentNum,stageID:stageID},                
			success: function (msg){
				if(msg=="success"){
					totalPrice = Number(0);
					maxMonth=Number(0);
					$(".eachTotoalPrice").each(function(){
						var eachPrice = $(this).html();
						eachPrice = $(this).attr("title");
						eachPrice = Number(eachPrice).toFixed(2);
						var quantity = $(this).prevAll(':eq(2)').find(".goodsNum").val();
						var finalPrice =Number(eachPrice)*Number(quantity);
						finalPrice = Number(finalPrice).toFixed(2);
						$(this).html(finalPrice);
						maxMonth = maxMonth+(finalPrice/($(this).prevAll(':eq(1)').find(":first").html()));
						totalPrice = Number(totalPrice)+Number(finalPrice);
					});
					totalPrice= Number( totalPrice).toFixed(2);
					maxMonth =  Number(maxMonth).toFixed(2);
					$("#totalPrice").html( totalPrice);
					$("#maxPer").html(maxMonth);
				}
			}
		});
	});
	
	$(".goodsNum").change(function(){
		var currentNum = $(this).val();
		
		var reg=/^[1-9]\d*|0$/;
		if(!reg.test(currentNum)){
			$(this).val(Number(1));
		}
		else{
			var goodsID = $(this).closest("tr").attr("title");
			var tag = $(this).parent().prev().html();
			var stageID = $(this).parent().next().find(".stages").html();
			$(this).closest("td").find(".success_msg").show();
			$(this).closest("td").find(".success_msg").delay(400).hide(0);
			var tempCart={'goodsID':goodsID,'tag':tag,'quantity':currentNum,'stageID':stageID };
			
			$.ajax({                           	  
				url: '${ctx}/order/updateCart',       //处理测试页面                 
				type: 'POST',                  
				data: {goodsID:goodsID,tag:tag,quantity:currentNum,stageID:stageID},                
				success: function (msg){
					if(msg=="success"){
						totalPrice = Number(0);
						maxMonth=Number(0);
						$(".eachTotoalPrice").each(function(){
							var eachPrice = $(this).html();
							eachPrice = $(this).attr("title");
							eachPrice = Number(eachPrice).toFixed(2);
							var quantity = $(this).prevAll(':eq(2)').find(".goodsNum").val();
							var finalPrice =Number(eachPrice)*Number(quantity);
							finalPrice = Number(finalPrice).toFixed(2);
							$(this).html(finalPrice);
							maxMonth = maxMonth+(finalPrice/($(this).prevAll(':eq(1)').find(":first").html()));
							totalPrice = Number(totalPrice)+Number(finalPrice);
						});
						totalPrice= Number( totalPrice).toFixed(2);
						maxMonth =  Number(maxMonth).toFixed(2);
						$("#totalPrice").html( totalPrice);
						$("#maxPer").html(maxMonth);
					}
				}
			});
			
		}
	});
	$("#submitBtn").click(function(){
		var bh = $(".wrapper").height();
	    var bw = $(".wrapper").width();
	    $("#coverbg").css({
	        height: bh,
	        width: bw,
	        display: "block"
	    });
	    $("#msgDialog").show();
	});
	
	$("#confirmBtn").click(function(){
		var person = $("#receiver").val();
		var address = $("#address").val();
		var phone = $("#phoneNum").val();
		var ok1=false;
		var ok2=false;
		var ok3=false;
		var regPhone=/^1[3|4|5|7|8]\d{9}$/;
		if(person!=""){ok1=true;}
		if(address!=""){ok2=true;}
		
		if(phone==""){ok3=true;}
		else{
			if(regPhone.test(phone)){
				ok3=true;
			}
		}
		if(ok1&&ok2&&ok3){
			$.ajax({                           	  
				url: '${ctx}/order/submitOrder',       //处理测试页面                 
				type: 'POST',                  
				data: {person:person,phone:phone,address:address},                
				success: function (msg){
					if(msg=="success"){
						window.location.href='${ctx}/page/jumpToHomePage';
					}
					else if(msg=="oweTooMuch"){
						var bh = $(".wrapper").height();
					    var bw = $(".wrapper").width();
					    $("#coverbg").css({
					        height: bh,
					        width: bw,
					        display: "block"
					    });
					    $("#oweTooMuchDialog").show();
					}
				}
			});
		}
		
		
	});
});

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
								<li class="f_list_content_current">
									<span class="glyphicon glyphicon-shopping-cart list_icon_current"></span>&nbsp;&nbsp;&nbsp;
									<span style="color:white;">购物车</span>
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
						<span class="tit_text">我的购物车</span>
					</div>
					<div class="right_content">
						<div style="overflow:auto;max-height:600px;">
							<table>
							<tr>
								<!--<th width=40px></th> -->
								<th width=120px>图片与名称</th>
								<th width=120px>品牌</th>
								<th width=60px>类型</th>
								<th width=120px>数量</th>
								<th width=60px>分期</th>
								<th width=90px>单价</th>
								<th width=90px>小计<br><span style="font-size:8px;">(含手续费)</span></th>
							</tr>
							 <c:forEach items="${goodsInCartList}" var="goods">
							 	<tr title="${goods.goods.goodsID}">
							 		<!--<td><input checked="checked" type="checkbox" style="margin-left: 5px;margin-right: 15px;"></td> -->
							 		
							 		<td style="padding-top:5px;">
							 		<a href="${ctx}/goods/goodsDetail?goodsID=${goods.goods.goodsID}">
							 			<img src="${ctx}/goods/readPicture?pictureID=${goods.pictureID}" style="height:80px;margin-top:5px;" alt="img"/>
							 			</a>
							 			<p style="margin:0px;">${goods.goods.goodsName}</p>
							 		</td>
									
							 		<td style="font-size:8px;color:#666;">${goods.goods.goodsClass}<br>${goods.goods.goodsBrand}</td>
							 		<td>${goods.tag.tag}</td>
							 		<td class="goodsQuantity" style="padding-top:10px;">
							 			<div style="height:23px;">
							 				<p class="success_msg" style='font-size:6px;color:#999;margin:3px;'>修改成功</p>
							 			</div>
							 			<a href="#"  class='minusQuantity'><img src="${ctx}/img/minus.jpg" style="height:25px;position: relative;left: 4.3px;top: -1.7px;"></a>
										<input class="goodsNum" type="text" id="goodsNum" value="${goods.quantity}">
										<a href="#"  class='plusQuantity' ><img src="${ctx}/img/plus.jpg" style="height:25px;position: relative;left:-4.7px;top: -1.7px;"></a>
							 			<a href="#" class="deleteGoodsInCart"><p>删除</p> </a>
							 		</td>
							 		<td><span class="stages">${goods.goodsStage}</span><span>期</span></td>
							 		<td class="perPrice">${goods.tag.price}</td>
							 		<td class="eachTotoalPrice">${goods.goodsTotalPrice}</td>
							 	</tr>
							 </c:forEach>
							</table>
						</div>
						<div class="count_area">
							<p style="color:#4f90fb;font-size:20px;font-weight:600;padding-right:15px;"><span>总价：</span><span style="font-size:15px;">￥</span><span  id="totalPrice"></span></p>
							<p style="color:#666;font-size:14px;padding-right:15px;border-bottom:1px dashed #4f90fb;padding-bottom:20px;">(最高月供：<span style="color:#4f90fb;font-size:10px;">￥</span><span id="maxPer" style="color:#4f90fb;font-weight:bold;">11.33</span>)</p>
							<a href="#"><button class="btn" id="submitBtn">生成订单</button></a>	
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
	<div id="msgDialog" class="dialog" style="height:330px">
		<div style="height:230px;text-align:left;margin:10px 20px 10px 20px;">
			<div class="right_title">
						<span class="tit_b"></span>&nbsp;
						<span class="tit_text">请填写收货信息</span>
			</div>
			<div style="height:100px;margin:10px;">
				<p><span>收货人：</span><input id="receiver" class="msg_input" placeholder="收货人" style="width:100px;"></input></p>
				<p><span>收货地址：</span><input id="address" class="msg_input" placeholder="收货地址" style="width:240px;"></input></p>
				<p><span>联系电话：</span><input id="phoneNum" class="msg_input" placeholder="联系电话" style="width:150px;"></input></p>
			</div>
		</div>
		<div style="border-top:1px solid #ccc;padding-top:20px;">
  		<a href="#" id="confirmBtn"><button class="btn" style="width:120px;height:40px;font-size:18px;">确认</button></a>
		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;background-color:#fff;color:#666;border-color:#666;">取消</button></a>
		</div>
	</div>
	<div id="oweTooMuchDialog" class="dialog">
  		<p class="dialog_msg">抱歉，您的欠款余额不足，请考虑删除部分商品！</p>
  		<a href="#" onclick="closeBg();"><button class="btn" style="width:120px;">关闭</button></a>
	</div>
	<!-- 暂存数据用 -->
	
</body>
</html>