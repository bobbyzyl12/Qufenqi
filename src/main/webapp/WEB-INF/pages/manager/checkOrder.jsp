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
  <script type="text/javascript" src="${ctx}/js/Chart.js"></script>
<style type="text/css">
	html,body,div,ul,li
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	
	.header_container
	{
		width:auto;
		height:45px;
		background-image:url(${ctx}/img/m1.jpg);
		background-size:cover; 
	}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:570px;
		width:100%;
	}
	
	div.main_container{
		overflow:auto;
		padding-bottom:40px;
	}
	
	div.main_container_box{
		position:relative;
		top:10px;
		width:1000px;
		height:600px;
		margin-left:auto;
		margin-right:auto;
		background-color:#E9E9E9;
		border-radius:10px;
	}
	
	div.footer{
		height:30px;
		position:absolute;
		bottom:-50px;
		left:0px;
		width:100%;
		text-align:center;
		display:block;
		background-color:#fff;
		border-top-width:1px;
		border-style:solid;
		border-color:#ccc;
		border-bottom-width:0px;
		border-left-width:0px;
		border-right-width:0px;
	}
	
	.header_basic{
		background-color:white;
		height:40px;
		overflow: hidden;
		
		position:relative;
		filter:alpha(opacity=75); /*支持 IE 浏览器*/
		-moz-opacity:0.75; /*支持 FireFox 浏览器*/
		opacity:0.75; /*支持 Chrome, Opera, Safari 等浏览器*/
		
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
		border:2px solid #ccc; 
		border-width:0 2px 0 0;
		text-decoration:none;
		text-transform:none;
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	.header_under_center{
		height:100%;
		width:1000px;
		margin-left:auto;
    	margin-right:auto;
    	vertical-align:middle;
	}
		
	.chart_box{
		display:inline-block;
		width:450px;
	}
	
	.big_chart{
		height:350px;
		width:400px;
		margin-top:20px;
		margin-bottom:10px;
		margin-right:auto;
		margin-left:auto;
		text-align:center;
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	}
	
	.small_chart_box{
		width:400px;
		height:200px;
		margin-right:auto;
		margin-left:auto;
		
	}
	
	.small_chart{
		display:inline-block;
		width:195px;
		text-align:center;
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	}	
	
	.chart_btn_box{
		display:inline-block;
		height:200px;
		width:195px;
		margin:0px;
		text-align:center;
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
		position:relative;
		left:10px;
	}
	
	.alert_msg{
		font-size:10px;
		color:#ff6384;
	}
	
	.message_box{
		height:560px;
		width:540px;
		margin-left:auto;
		margin-right:auto;
		position:absolute;
		top:20px;
		right:20px;
		
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	
		font-size:16px;
	}
	
	.order_msg{
		height:240px;
		border-style:solid;
  		border-top-width:2px;
  		border-bottom-width:2px;
  		border-left-width:2px;
  		border-right-width:2px;
  		border-color:#aaaaaa;
  		padding:25px;
  		padding-left:30px;
	}
	
	.user_msg{
		height:240px;
		border-style:solid;
  		border-top-width:2px;
  		border-bottom-width:2px;
  		border-left-width:2px;
  		border-right-width:2px;
  		border-color:#aaaaaa;
  		padding:25px;
  		padding-left:30px;
	}
	
	.result_msg{
		height:80px;
		border-style:solid;
  		border-top-width:10px;
  		border-bottom-width:2px;
  		border-left-width:2px;
  		border-right-width:2px;
  		border-color:#aaaaaa;
  		text-align:center;
  		padding-top:15px;
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
	span.title_text{
		font-weight:bold;
	}
	
	span.important_text{
		font-weight:bold;
		color:#ff6384;
	}
	
	img.icon_img{
		position:absolute;
		top:20px;
		right:50px;
		width:200px;
		height:200px;
		
	}
	
	.btn_pass{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:100px;
		  color:#ffffff;
		  background-color:#4a8cf7;
		  font-size:18px;
		  font-weight:normal;
		  border:2px solid #dcdcdc;
		  -webkit-border-top-left-radius:8px;
		  -moz-border-radius-topleft:8px;
		  border-top-left-radius:8px;
		  -webkit-border-top-right-radius:8px;
		  -moz-border-radius-topright:8px;
		  border-top-right-radius:8px;
		  -webkit-border-bottom-left-radius:8px;
		  -moz-border-radius-bottomleft:8px;
		  border-bottom-left-radius:8px;
		  -webkit-border-bottom-right-radius:8px;
		  -moz-border-radius-bottomright:8px;
		  border-bottom-right-radius:8px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_pass:hover{
		color:#cee0fd;
		background-color:#0b68ff;
	}
	
	.btn_reject{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:100px;
		  color:#ffffff;
		  background-color:#ff6782;
		  font-size:18px;
		  font-weight:normal;
		  border:2px solid #dcdcdc;
		  -webkit-border-top-left-radius:8px;
		  -moz-border-radius-topleft:8px;
		  border-top-left-radius:8px;
		  -webkit-border-top-right-radius:8px;
		  -moz-border-radius-topright:8px;
		  border-top-right-radius:8px;
		  -webkit-border-bottom-left-radius:8px;
		  -moz-border-radius-bottomleft:8px;
		  border-bottom-left-radius:8px;
		  -webkit-border-bottom-right-radius:8px;
		  -moz-border-radius-bottomright:8px;
		  border-bottom-right-radius:8px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_reject:hover{
		color:#ffcdd6;
		background-color:#ff5170;
	}
	
	.dialog{
		display: none;
		z-index: 5;
		
		height:200px;
		width:400px;
		background-color: #FFF;
		border: 1px solid #888;
		
		position: fixed !important; /* 浮动对话框 */
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
	.no_res{
		text-align:center;
		position: relative;
	    top: 10px;
	    width: 1000px;
	    height: 600px;
	    margin-left: auto;
	    margin-right: auto;
	    background-color: #E9E9E9;
	    border-radius: 10px;
	    padding-top:250px;
	}
</style>

<script type="text/javascript">
	$(function(){
		var check = $("#haveRes").html();
		if(check =="no"){
			$(".no_res").show();
			$(".main_container").css("overflow","hidden");
			$(".main_container").css("position","relative");
			$(".main_container").css("top","0px");
			$(".main_container").css("height","600px");
			$(".main_container_box").hide();
		}
		else if(check =="yes"){
			$(".no_res").hide();
			$(".main_container_box").show();
		}
	});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="header_container">
			<div class="header_basic">
				<div class="header_box">
					<div class="header_selection_box">
						<ul>
							<li>
								<a href="${ctx}/page/jumpToCheckOrder" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:16px;">订单审核</p>
								</a>
							</li>
							<li>
								<a href="${ctx}/page/jumpToCheckUser" class="header_btn">
	  								<p style="font-size:16px;">信用审核</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="header_botton_box">
						<ul>
							<li>
								<a href="${ctx}/user/managerLogout" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<span class="glyphicon glyphicon-log-out header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;退出登陆</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="no_res">
				<p style="font-size: 25px;color: #777;">没有相关数据</p>	
			</div>
			<div class="main_container_box">
				<div class="chart_box">
					<div class="big_chart">
						<canvas id="myChart" width="400" height="325"></canvas>
						<p>用户当前所有状态金额统计</p>
					</div>
					<div class="small_chart_box">
						<div class="small_chart">
							<canvas id="smallChart" width="195" height="180"></canvas>
							<p>用户所有订单各状态数量</p>
						</div>
						<div class="chart_btn_box">
							<canvas id="smallChart2" width="195" height="180"></canvas>
							<p>用户订单各状态原始金额</p>
						</div>
					</div>
				</div>
				<div class="message_box">
					<div class="order_msg">
						<p><span class="title_text">订单编号：</span><span id="orderID">${order.orderID}</span></p>
						<p><span class="title_text">订单生成时间：</span><span><fmt:formatDate value="${order.orderCreateTime}" pattern="yyyy-MM-dd"/></span></p>
						<p><span class="title_text">订单总金额：</span>￥<span class="money">${order.orderPrice}</span></p>
						<p><span class="title_text">订单每期应付金额：</span>￥ <span id="perStagePrice" class="money">111</span></p>
						<p><span class="title_text">订单分期：</span><span id="stage">${order.orderStage}</span>期</p>
						<p><span class="title_text">订单最终应付金额：</span><span class="important_text">￥ <span id="finalPrice" class="money">${finalPrice}</span></span></p>					
						<img src="${ctx}/img/listImg.png" class="icon_img"/>
					</div>
					<div class="user_msg">
						<p><span class="title_text">用户编号：</span>${user.userID}</p>
						<p><span class="title_text">用户信用额度等级：</span>${credit.creditName}</p>
						<p><span class="title_text">用户累计逾期次数：</span>${user.userBadHistory}次</p>
						<p><span class="title_text">用户现总欠款金额：</span>￥ <span id="userOwe" class="money">${user.userOwe}</span></p>
						<p><span class="title_text">用户最高欠款累计额度：</span>￥ <span id="maxOwe" class="money">${credit.maxOwe}</span></p>
						<p><span class="title_text">用户剩余可欠款额度：</span><span class="important_text">￥<span id="leftMoney" class="money">${credit.maxOwe}-${user.userOwe}</span></span></p>		
						<img src="${ctx}/img/userImg.png" class="icon_img" style="position:absolute;top:260px;right:40px;"/>
					</div>
					<div class="result_msg">
						<a href="${ctx}/order/passOrder?orderID=${order.orderID}"><button class="btn_pass">通过</button></a>
						<button class="btn_reject" id="btn_reject">不通过</button>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			Copyright (c) 2016
		</div>
	</div>
	<!-- jQuery 遮罩层 -->
	<div id="coverbg" class="coverbg"></div>
	
	<!-- 这里存放dialogs -->
	<div id="reasonDialog" class="dialog" style="height:360px;">
		<div class="right_title" style="text-align:left;">
			<span class="tit_b"></span>&nbsp;
			<span class="tit_text">不通过理由</span>
			<span class="alert_msg" style="margin-left:20px;">*请至少选择或填写一个理由</span>
		</div>
		<div style="height:220px;padding:10px 30px 10px 30px;text-align:left;">
			<p><input id="reasonCheckBox1" type="checkbox" style="margin-right:10px;">不良记录过多</p>
			<p><input id="reasonCheckBox2" type="checkbox" style="margin-right:10px;">当前欠款金额过多</p>
			<p><input id="reasonCheckBox3" type="checkbox" style="margin-right:10px;">当前存在逾期订单</p>
			<p><input id="reasonCheckBox4" type="checkbox" style="margin-right:10px;">其他</p>
			<textarea id="reasonDescribe" type="input" rows="4" cols="45" placeholder="请输入理由" style="padding-left:20px"></textarea>
		</div>
		<div style="border-top:1px solid #ccc;margin-top:30px;padding-top:10px;padding-right:20px;text-align:right;">
				<button class="btn" id="saveButton" style="width:100px;height:35px;font-size:16px;">确认</button>
	  			<a href="#" onclick="closeBg();"><button class="btn_cancel" style="width:100px;height:35px;font-size:16px;">取消</button></a>
		</div>
	</div>
	
	<div id="successDialog" class="dialog">
		<p class="dialog_msg">审核完毕</p>
  		<a href="${ctx}/page/jumpToCheckOrder" onclick="closeBg();"><button class="btn" style="width:120px;height:40px;font-size:18px;">下一个</button></a>
	</div>
	
	<!-- 暂存数据用 -->
	<p style="display:none;" id="haveRes">${haveRes}</p>
	
<script type="text/javascript">
	$(function(){
		var check = $("#haveRes").html();
		if(check=="yes"){
			var order =$("#orderID").html();
			
			var finalPrice = $("#finalPrice").html();
			var stage = $("#stage").html();
			var perStagePrice = Number(finalPrice)/Number(stage);
			$("#perStagePrice").html(perStagePrice);
			$("#leftMoney").html((Number($("#maxOwe").html()))-Number($("#userOwe").html()));
			$(".money").each(function(){
				var money =$(this).html();
				money = Number(money).toFixed(2);
				$(this).html(money);
			});
			$(".alert_msg").hide();
			$("#btn_reject").click(function(){
				var bh = $("body").height()*1.075;
			    var bw = $("body").width();
			    $("#coverbg").css({
			        height: bh,
			        width: bw,
			        display: "block"
			    });
			    $(".alert_msg").hide();
			    $("#reasonDialog").show();
			    $("#saveButton").click(function(){
			    	var ok =false;
			    	var reason="";
			    	$(".alert_msg").hide();
			    	if($('#reasonCheckBox1').is(':checked')) {
	    				reason = "不良记录过多";
	    				ok=true;
	    			}
			    	if($('#reasonCheckBox2').is(':checked')) {
	    				if(ok){
	    					reason = reason+'、';
	    				}
			    		reason = reason + "当前欠款金额过多";
	    				ok=true;
	    			}
			    	if($('#reasonCheckBox3').is(':checked')) {
			    		if(ok){
	    					reason = reason+'、';
	    				}
	    				reason = reason + "当前存在逾期订单";
	    				ok=true;
	    			}
			    	if($('#reasonCheckBox4').is(':checked')) {
			    		if(ok){
	    					reason = reason+'、';
	    				}
	    				reason = reason + ($("#reasonDescribe").val());
	    				ok=true;
	    			}

			    	if(ok){
			    		$.ajax({
		    				url: '${ctx}/order/rejectOrder',
		    				type: 'POST',
		    				data: {'reason':reason,'orderID':order},
		    				success: function (msg){
		    					var bh = $("body").height()*1.075;
		    				    var bw = $("body").width();
		    				    $("#coverbg").css({
		    				        height: bh,
		    				        width: bw,
		    				        display: "block"
		    				    });
		    				    $("#reasonDialog").hide();
		    				    $("#successDialog").show();
		    				} 
		    			});
			    	}
			    	else{
			    		$(".alert_msg").show();
			    	}
			    	
			    });
			});
		}
		
	});
	
	function closeBg() {
	    $("#coverbg").hide();
	    $(".dialog").hide();
	}
	
	$(function(){
		
		var check = $("#haveRes").html();
		if(check=="yes"){
			var orderID =$("#orderID").html();
			$.ajax({                           	  
				url: '${ctx}/order/getFirstCartData',       //处理测试页面                 
				type: 'POST',                  
				data: {orderID:orderID},                
				success: function (msg){
					var	a = msg[0];
					var b = msg[1];
					var c = msg[2];
					if(a==null){a=Number(0);}
					if(b==null){b=Number(0);}
					if(c==null){c=Number(0);}
					a=Number(a).toFixed(2);
					b=Number(b).toFixed(2);
					c=Number(c).toFixed(2);
					var data_big = {
						    labels: [
						        "已逾期金额",
						        "已支付金额",
						        "等待支付金额",
						    ],
						    datasets: [
						        {
						            data: [b, a, c],
						            backgroundColor: [
						                "#FF6384",
						                "#36A2EB",
						                "#FFCE56"
						            ],
						            hoverBackgroundColor: [
						                "#FF6384",
						                "#36A2EB",
						                "#FFCE56"
						            ]
						        }]
						};
					var options_big={
							   animateRotate :true,
							   animateScale : true,
					};
					
					var ctx = document.getElementById("myChart").getContext("2d");
					var newChart = new Chart(ctx, {
					  	type: 'doughnut',
					    data: data_big,
					    options: options_big
					});
				}
			});
			
			$.ajax({                           	  
				url: '${ctx}/order/getSecondCartData',       //处理测试页面                 
				type: 'POST',                  
				data: {orderID:orderID},                
				success: function (msg){
					var	a = msg[0];
					var b = msg[1];
					var c = msg[2];
					var d = msg[3];
					if(a==null){a=Number(0);}
					if(b==null){b=Number(0);}
					if(c==null){c=Number(0);}
					if(d==null){d=Number(0);}
					
					var data_small = {
						    labels: [
						        "已逾期",
						        "已支付",
						        "待支付",
						        "其他",
						    ],
						    datasets: [
						        {
						            data: [c,a,b,d],
						            backgroundColor: [
						                "#FF6384",
						                "#36A2EB",
						                "#FFCE56",
						                "#666666"
						            ],
						            hoverBackgroundColor: [
						                "#FF6384",
						                "#36A2EB",
						                "#FFCE56",
						                "#666666"
						            ]
						        }]
						};
					var options_small={
							   animateRotate :true,
							   animateScale : true,
					};
					
					var ctx = document.getElementById("smallChart").getContext("2d");
					var newSmallChart = new Chart(ctx, {
					  	type: 'doughnut',
					    data: data_small,
					    options: options_small
					});
				}
				
			});
			
			
			
			$.ajax({                           	  
				url: '${ctx}/order/getThirdCartData',       //处理测试页面                 
				type: 'POST',                  
				data: {orderID:orderID},                
				success: function (msg){
					var	a = msg[0];
					var b = msg[1];
					var c = msg[2];
					var d = msg[3];
					if(a==null){a=Number(0);}
					if(b==null){b=Number(0);}
					if(c==null){c=Number(0);}
					if(d==null){d=Number(0);}
					
					a=Number(a).toFixed(2);
					b=Number(b).toFixed(2);
					c=Number(c).toFixed(2);
					d=Number(d).toFixed(2);
					
					var data_small2 = {
						    labels: [
						        "已逾期",
						        "已支付",
						        "待支付",
						        "其他",
						    ],
						    datasets: [
						        {
						            data: [b,a,c,d],
						            backgroundColor: [
						                "#FF6384",
						                "#36A2EB",
						                "#FFCE56",
						                "#666666"
						            ],
						            hoverBackgroundColor: [
						                "#FF6384",
						                "#36A2EB",
						                "#FFCE56",
						                "#666666"
						            ]
						        }]
						};
					var options_small2={
							   animateRotate :true,
							   animateScale : true,
					};
					
					var ctx = document.getElementById("smallChart2").getContext("2d");
					var newSmallChart2 = new Chart(ctx, {
					  	type: 'doughnut',
					    data: data_small2,
					    options: options_small2
					});
				}
			});
		}
	});
	</script>
	
</body>
</html>
